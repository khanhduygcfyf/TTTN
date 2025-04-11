<?php
// Kiểm tra và lấy ID danh mục từ URL
if (isset($_GET['id']) && $_GET['id'] > 0) {
    $category_id = intval($_GET['id']);

    // Lấy giá trị lọc giá từ GET nếu có
    $min_price = isset($_GET['min_price']) ? intval($_GET['min_price']) : '';
    $max_price = isset($_GET['max_price']) ? intval($_GET['max_price']) : '';

    if ($min_price !== '' && $max_price !== '') {
        // Lọc sản phẩm theo danh mục và khoảng giá
        $list_products = $ProductModel->select_products_by_cate($category_id, $min_price, $max_price);
    } else {
        // Nếu không lọc giá, chỉ lấy sản phẩm theo danh mục
        $list_products = $ProductModel->select_products_by_cate($category_id);
    }
} else {
    header("Location: index.php");
    exit;
}

// Lấy danh sách tất cả danh mục
$list_catgories = $CategoryModel->select_all_categories();
?>

<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links">
                    <a href="index.php"><i class="fa fa-home"></i> Trang chủ</a>
                    <a href="index.php?url=cua-hang">Sản phẩm</a>
                    <span>
                        <?php foreach ($list_catgories as $value) {
                            if ($value['category_id'] == $category_id) {
                                echo $value['name'];
                            }
                        } ?>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Shop Section Begin -->
<section class="shop spad">
    <div class="container">
        <div class="row">
            <!-- Sidebar Begin -->
            <div class="col-lg-3 col-md-3">
                <div class="shop__sidebar">
                    <!-- Danh mục -->
                    <div class="sidebar__categories">
                        <div class="section-title">
                            <h4>DANH MỤC</h4>
                        </div>
                        <div class="categories__accordion">
                            <div class="accordion" id="accordionExample">
                                <?php foreach ($list_catgories as $value) {
                                    extract($value);
                                ?>
                                <div class="card">
                                    <div class="card-heading active">
                                        <!-- Truyền thêm min_price và max_price vào URL -->
                                        <a href="index.php?url=danh-muc-san-pham&id=<?=$category_id?><?=($min_price !== '' || $max_price !== '') ? "&min_price=$min_price&max_price=$max_price" : ''?>">
                                            <?=$name?>
                                        </a>
                                    </div>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>

                    <!-- Bộ lọc giá -->
                    <!-- <div class="sidebar__filter">
                        <div class="section-title">
                            <h4>LỌC THEO GIÁ</h4>
                        </div>
                        <div class="filter-range-wrap">
                            <form action="index.php" method="GET">
                                <input type="hidden" name="url" value="danh-muc-san-pham"> <!-- Đảm bảo URL khớp với case trong index.php -->
                                <!-- <input type="hidden" name="id" value="<?=$category_id?>">
                                <div class="price-input">
                                    <p>Giá từ:</p>
                                    <input type="number" name="min_price" value="<?=$min_price?>" placeholder="Nhập giá thấp nhất">
                                    <p>đến</p>
                                    <input type="number" name="max_price" value="<?=$max_price?>" placeholder="Nhập giá cao nhất">
                                </div>
                                <button type="submit" class="filter-price">LỌC GIÁ</button>
                            </form>
                        </div>
                    </div> -->
                    <div class="sidebar__filter">
                        <div class="section-title">
                            <h4 class="filter-title">LỌC THEO GIÁ</h4>
                        </div>
                        <form action="index.php" method="GET" class="filter-form">
                            <input type="hidden" name="url" value="danh-muc-san-pham">
                            <input type="hidden" name="id" value="<?=$category_id?>">

                            <label for="min_price">Giá từ:</label>
                            <input type="number" name="min_price" id="min_price" placeholder="Nhập giá thấp nhất" value="<?=$min_price?>">

                            <label for="max_price">đến:</label>
                            <input type="number" name="max_price" id="max_price" placeholder="Nhập giá cao nhất" value="<?=$max_price?>">

                            <button type="submit" class="filter-price">Lọc giá</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Sidebar End -->

            <!-- Product List Begin -->
            <div class="col-lg-9 col-md-9">
                <?php if (count($list_products) > 0) { ?>
                <div class="row">
                    <?php foreach ($list_products as $value) {
                        extract($value);
                        $discount_percentage = $ProductModel->discount_percentage($price, $sale_price);
                    ?>
                    <div class="col-lg-4 col-md-6 col-6-rp-mobile">
                        <div class="product__item sale">
                            <div class="product__item__pic set-bg" data-setbg="upload/<?=$image?>">
                                <div class="label_right sale">-<?=$discount_percentage?>%</div>
                                <ul class="product__hover">
                                    <li><a href="upload/<?=$image?>" class="image-popup"><span class="arrow_expand"></span></a></li>
                                    <li>
                                        <a href="index.php?url=chitietsanpham&id_sp=<?=$product_id?>&id_dm=<?=$category_id?>"><span class="icon_search_alt"></span></a>
                                    </li>
                                    <li>
                                        <?php if (isset($_SESSION['user'])) { ?>
                                        <form action="index.php?url=gio-hang" method="post">
                                            <input type="hidden" name="product_id" value="<?=$product_id?>">
                                            <input type="hidden" name="user_id" value="<?=$_SESSION['user']['id']?>">
                                            <input type="hidden" name="name" value="<?=$name?>">
                                            <input type="hidden" name="image" value="<?=$image?>">
                                            <input type="hidden" name="price" value="<?=$sale_price?>">
                                            <input type="hidden" name="product_quantity" value="1">
                                            <button type="submit" name="add_to_cart" id="toastr-success-top-right">
                                                <span class="icon_bag_alt"></span>
                                            </button>
                                        </form>
                                        <?php } else { ?>
                                        <button type="button" onclick="alert('Vui lòng đăng nhập để thực hiện chức năng này');">
                                            <span class="icon_bag_alt"></span>
                                        </button>
                                        <?php } ?>
                                    </li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6 class="text-truncate-1"><a href="product-details.html"><?=$name?></a></h6>
                                <div class="rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <div class="product__price"><?=number_format($sale_price)?>₫ <span><?=number_format($price)?>₫</span></div>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                </div>
                <?php } else { ?>
                <div class="container-fluid mt-5">
                    <div class="row rounded justify-content-center mx-0 pt-5">
                        <div class="col-md-6 text-center">
                            <h4 class="mb-4">Danh mục chưa có sản phẩm</h4>
                            <a class="btn btn-primary rounded-pill py-3 px-5" href="index.php?url=cua-hang">Trở lại cửa hàng</a>
                        </div>
                    </div>
                </div>
                <?php } ?>
            </div>
            <!-- Product List End -->
        </div>
    </div>
</section>
<!-- Shop Section End -->

<style>
   .sidebar__filter {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.06);
    width: 100%;
    max-width: 300px;
    margin: 0 auto;
}

.filter-title {
    font-weight: bold;
    font-size: 18px;
    margin-bottom: 20px;
    position: relative;
    display: inline-block;
    border-bottom: 2px solid #007bff;
    padding-bottom: 3px;
}

.filter-form label {
    display: block;
    font-size: 14px;
    margin-bottom: 6px;
    margin-top: 15px;
    color: #333;
}

.filter-form input[type="number"] {
    width: 100%;
    padding: 10px 12px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 6px;
    margin-bottom: 10px;
    outline: none;
    transition: border-color 0.3s ease;
}

.filter-form input[type="number"]:focus {
    border-color: #007bff;
    box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.1);
}

.filter-price {
    background-color: #007bff;
    color: #fff;
    border: none;
    width: 100%;
    padding: 10px;
    border-radius: 6px;
    font-size: 15px;
    font-weight: 500;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.filter-price:hover {
    background-color: #0056b3;
}

</style>