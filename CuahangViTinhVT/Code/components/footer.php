<!-- Instagram End -->
<div style="border: 1px solid #0A68FF;"></div>
<!-- Footer Section Begin -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-7">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a href="./index.html"><img src="public/img/Data driven.png" alt="" width="357" height="290"></a>
                    </div>
                    <p>Chào mừng bạn đến với Máy tính Việt Tân, nơi cung cấp những sản phẩm chất lượng</p>
                    
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-5">
                <div class="footer__widget">
                    <h6>ĐƯỜNG DẪN</h6>
                    <ul>
                        <li><a href="http://localhost/Test/Code/index.php?url=lien-he" style="color: black;">Về chúng tôi</a></li>
                        <li><a href="http://localhost/Test/Code/index.php?url=bai-viet" style="color: black;">Tin tức</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-4">
                <div class="footer__widget">
                    <h6>HỖ TRỢ</h6>
                    <ul>
                        <li style="color: black;">Mua hàng: <span style="color: blue;">1900000</span></li>
                        <li style="color: black;">Bảo hành: <span style="color: blue;">1900000</span></li>
                        <li style="color: black;">Khiếu nại: <span style="color: blue;">1900000</span></li>
                        <li style="color: black;">Email: <span style="color: blue;">CHVT@gmail</span></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-8 col-sm-8">
                <div class="footer__newslatter">
                    <h6>KẾT NỐI VỚI CHÚNG TÔI</h6>
                    <div class="footer__payment">
                    <a href="https://id.zalo.me/account/login?continue=https%3A%2F%2Fzalo.me%2Fpc" target="_blank">
                        <img src="public/img/payment/zalo.png" alt="Zalo">
                    </a>
                    <a href="https://www.facebook.com/trinhtanvu/?locale=vi_VN" target="_blank">
                        <img src="public/img/payment/face.png" alt="Facebook">
                    </a>
                    <a href="https://www.tiktok.com/@ashinreview2002/video/7483379545790369031?is_from_webapp=1&sender_device=pc" target="_blank">
                        <img src="public/img/payment/tiktok.png" alt="TikTok">
                    </a>
    
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-lg-12">
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                <div class="footer__copyright__text">
                    <p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="#" target="_blank">Duy</a></p>
                </div>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Search Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form action="tim-kiem" method="get" class="search-model-form">
            <input type="search" name="query" id="search-input" placeholder="TÌM KIẾM.....">
        </form>
    </div>
</div>
<!-- Search End -->

<!-- Toatr -->
<script>
    $(document).ready(function () {
        $("#toastr-success-top-right").on("click", function () {
            toastr.success("1 sản phẩm đã thêm vào giỏ", "Thành công", {
                closeButton: true,
                debug: false,
                newestOnTop: false,
                progressBar: true,
                positionClass: "toast-top-right",
                preventDuplicates: false,
                onclick: null,
                showDuration: "300",
                hideDuration: "1000",
                timeOut: "5000",
                extendedTimeOut: "1000",
                showEasing: "swing",
                hideEasing: "linear",
                showMethod: "fadeIn",
                hideMethod: "fadeOut"
            });
        });
    });
</script>

<!-- Js Plugins -->
<script src="public/js/jquery-3.3.1.min.js"></script>
<script src="public/js/bootstrap.min.js"></script>
<script src="public/js/jquery.magnific-popup.min.js"></script>
<script src="public/js/jquery-ui.min.js"></script>
<script src="public/js/mixitup.min.js"></script>
<script src="public/js/jquery.countdown.min.js"></script>
<script src="public/js/jquery.slicknav.js"></script>
<script src="public/js/owl.carousel.min.js"></script>
<script src="public/js/jquery.nicescroll.min.js"></script>
<script src="public/js/main.js"></script>

<!-- dialogflow -->
<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<df-messenger
    intent="WELCOME"
    chat-title="Chat"
    agent-id="a111a74a-8334-4098-9636-0f1433d6fc97"
    language-code="vi"
></df-messenger>


</body>

</html>