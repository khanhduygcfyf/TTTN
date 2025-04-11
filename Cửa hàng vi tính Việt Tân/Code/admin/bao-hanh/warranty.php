<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Kiểm tra session
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
if (!isset($_SESSION['user_admin'])) {
    header('Location: login.php');
    exit();
}

// Kết nối cơ sở dữ liệu
require_once '../config/config.php';
$conn = pdo_get_connection();

// Xử lý thêm mới bản ghi bảo hành
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $ten_hang = $_POST['ten_hang'];
    $nguoi_gui = $_POST['nguoi_gui'];
    $so_luong = $_POST['so_luong'];
    $tinh_trang_nhan = $_POST['tinh_trang_nhan'];
    $serial_no = $_POST['serial_no'];
    $ngay_gui_hang = $_POST['ngay_gui_hang'];
    $dia_chi_bao_hanh = $_POST['dia_chi_bao_hanh'];
    $ngay_nhan = $_POST['ngay_nhan'];
    $cong_no = $_POST['cong_no'];
    $da_xu_ly_xong = isset($_POST['da_xu_ly_xong']) ? 1 : 0;
    $ghi_chu = $_POST['ghi_chu'];

    $stmt = $conn->prepare("INSERT INTO warranty_records (ten_hang, nguoi_gui, so_luong, tinh_trang_nhan, serial_no, ngay_gui_hang, dia_chi_bao_hanh, ngay_nhan, cong_no, da_xu_ly_xong, ghi_chu) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute([$ten_hang, $nguoi_gui, $so_luong, $tinh_trang_nhan, $serial_no, $ngay_gui_hang, $dia_chi_bao_hanh, $ngay_nhan, $cong_no, $da_xu_ly_xong, $ghi_chu]);

    header('Location: warranty.php');
    exit();
}

// Lấy dữ liệu từ bảng warranty_records
$query = $conn->query("SELECT * FROM warranty_records ORDER BY id ASC");
$warranty_records = $query->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý bảo hành</title>
    <!-- Thêm Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container-fluid mt-5">
        <h1 class="text-center mb-4">Quản lý bảo hành</h1>

        <!-- Form thêm mới bảo hành -->
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">
                <h5>Thêm mới bảo hành</h5>
            </div>
            <div class="card-body">
                <form method="POST" action="">
                    <div class="row g-3">
                        <div class="col-md-4">
                            <label for="ten_hang" class="form-label">Tên hàng</label>
                            <input type="text" id="ten_hang" name="ten_hang" class="form-control" required>
                        </div>
                        <div class="col-md-4">
                            <label for="nguoi_gui" class="form-label">Người gửi</label>
                            <input type="text" id="nguoi_gui" name="nguoi_gui" class="form-control" required>
                        </div>
                        <div class="col-md-4">
                            <label for="so_luong" class="form-label">Số lượng</label>
                            <input type="number" id="so_luong" name="so_luong" class="form-control" min="1" required>
                        </div>
                        <div class="col-md-4">
                            <label for="tinh_trang_nhan" class="form-label">Tình trạng nhận</label>
                            <input type="text" id="tinh_trang_nhan" name="tinh_trang_nhan" class="form-control" required>
                        </div>
                        <div class="col-md-4">
                            <label for="serial_no" class="form-label">Serial No</label>
                            <input type="text" id="serial_no" name="serial_no" class="form-control" required>
                        </div>
                        <div class="col-md-4">
                            <label for="ngay_gui_hang" class="form-label">Ngày gửi hàng</label>
                            <input type="date" id="ngay_gui_hang" name="ngay_gui_hang" class="form-control" required>
                        </div>
                        <div class="col-md-4">
                            <label for="dia_chi_bao_hanh" class="form-label">Địa chỉ bảo hành</label>
                            <input type="text" id="dia_chi_bao_hanh" name="dia_chi_bao_hanh" class="form-control" required>
                        </div>
                        <div class="col-md-4">
                            <label for="ngay_nhan" class="form-label">Ngày nhận</label>
                            <input type="date" id="ngay_nhan" name="ngay_nhan" class="form-control">
                        </div>
                        <div class="col-md-4">
                            <label for="cong_no" class="form-label">Công nợ</label>
                            <input type="number" id="cong_no" name="cong_no" class="form-control" step="0.01">
                        </div>
                        <div class="col-md-4">
                            <label for="da_xu_ly_xong" class="form-label">Đã xử lý xong</label>
                            <div class="form-check">
                                <input type="checkbox" id="da_xu_ly_xong" name="da_xu_ly_xong" class="form-check-input">
                                <label for="da_xu_ly_xong" class="form-check-label">Có</label>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <label for="ghi_chu" class="form-label">Ghi chú</label>
                            <textarea id="ghi_chu" name="ghi_chu" class="form-control" rows="2"></textarea>
                        </div>
                    </div>
                    <div class="mt-3 text-end">
                        <button type="submit" class="btn btn-success">Thêm mới</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Bảng hiển thị danh sách bảo hành -->
        <div class="card">
            <div class="card-header bg-secondary text-white">
                <h5>Danh sách bảo hành</h5>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover table-responsive">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Tên hàng</th>
                            <th>Người gửi</th>
                            <th>Số lượng</th>
                            <th>Tình trạng nhận</th>
                            <th>Serial No</th>
                            <th>Ngày gửi hàng</th>
                            <th>Địa chỉ bảo hành</th>
                            <th>Ngày nhận</th>
                            <th>Công nợ</th>
                            <th>Đã xử lý xong</th>
                            <th>Ghi chú</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($warranty_records as $record): ?>
                            <tr id="row-<?= $record['id'] ?>">
                                <td><?= $record['id'] ?></td>
                                <td contenteditable="true" class="editable" data-field="ten_hang"><?= $record['ten_hang'] ?></td>
                                <td contenteditable="true" class="editable" data-field="nguoi_gui"><?= $record['nguoi_gui'] ?></td>
                                <td contenteditable="true" class="editable" data-field="so_luong"><?= $record['so_luong'] ?></td>
                                <td contenteditable="true" class="editable" data-field="tinh_trang_nhan"><?= $record['tinh_trang_nhan'] ?></td>
                                <td><?= $record['serial_no'] ?></td>
                                <td contenteditable="true" class="editable" data-field="ngay_gui_hang"><?= $record['ngay_gui_hang'] ?></td>
                                <td contenteditable="true" class="editable" data-field="dia_chi_bao_hanh"><?= $record['dia_chi_bao_hanh'] ?></td>
                                <td contenteditable="true" class="editable" data-field="ngay_nhan"><?= $record['ngay_nhan'] ?></td>
                                <td contenteditable="true" class="editable" data-field="cong_no"><?= $record['cong_no'] ?></td>
                                <td>
                                    <input type="checkbox" <?= $record['da_xu_ly_xong'] ? 'checked disabled' : '' ?> 
                                           onchange="updateStatus(<?= $record['id'] ?>, this.checked)">
                                </td>
                                <td contenteditable="true" class="editable" data-field="ghi_chu"><?= $record['ghi_chu'] ?></td>
                                <td>
                                    <button class="btn btn-success btn-sm save-btn" onclick="saveEdit(<?= $record['id'] ?>)">Lưu</button>
                                    <button class="btn btn-danger btn-sm" onclick="deleteRecord(<?= $record['id'] ?>)">Xóa</button>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Thêm Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.querySelectorAll('.editable').forEach(cell => {
            cell.addEventListener('focus', () => {
                cell.dataset.originalValue = cell.textContent.trim(); // Lưu giá trị ban đầu
            });

            cell.addEventListener('blur', () => {
                if (!cell.dataset.saved) {
                    cell.textContent = cell.dataset.originalValue; // Khôi phục giá trị ban đầu nếu không lưu
                }
            });
        });

        function updateStatus(id, isChecked) {
            fetch(`update_status.php`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ id, da_xu_ly_xong: isChecked ? 1 : 0 })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    const checkbox = document.querySelector(`#row-${id} input[type="checkbox"]`);
                    checkbox.disabled = true; // Khóa checkbox sau khi lưu
                } else {
                    alert('Cập nhật trạng thái thất bại!');
                }
            })
            .catch(error => console.error('Error:', error));
        }

        function saveEdit(id) {
            const row = document.getElementById(`row-${id}`);
            const updatedData = {};

            row.querySelectorAll('.editable').forEach(cell => {
                const field = cell.getAttribute('data-field');
                updatedData[field] = cell.textContent.trim();
                cell.dataset.saved = true; // Đánh dấu đã lưu
            });

            fetch(`update_warranty.php`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ id, ...updatedData })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Cập nhật thành công!');
                } else {
                    alert('Cập nhật thất bại!');
                }
            })
            .catch(error => console.error('Error:', error));
        }

        function deleteRecord(id) {
            if (confirm('Bạn có chắc chắn muốn xóa bản ghi này?')) {
                fetch(`delete_warranty.php?id=${id}`, {
                    method: 'GET'
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert('Xóa thành công!');
                        location.reload(); // Tải lại trang để cập nhật ID
                    } else {
                        alert('Xóa thất bại!');
                    }
                })
                .catch(error => console.error('Error:', error));
            }
        }

        // Kiểm tra trạng thái checkbox sau 10 giây
        document.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
            if (!checkbox.checked) {
                const row = checkbox.closest('tr'); // Tìm hàng chứa checkbox
                if (row) {
                    const id = row.id.split('-')[1]; // Lấy ID từ hàng
                    const tenHangElement = row.querySelector('[data-field="ten_hang"]');
                    const tenHang = tenHangElement ? tenHangElement.textContent.trim() : null;

                    if (tenHang) {
                        console.log(`Đang kiểm tra thiết bị: ${tenHang} (ID: ${id})`);
                        setTimeout(() => {
                            if (!checkbox.checked) {
                                console.log(`Gửi thông báo cho thiết bị: ${tenHang} (ID: ${id})`);
                                // Gửi yêu cầu đến PHP để gửi email
                                fetch('send_email.php', {
                                    method: 'POST',
                                    headers: { 'Content-Type': 'application/json' },
                                    body: JSON.stringify({ id, tenHang })
                                })
                                .then(response => response.json())
                                .then(data => {
                                    if (data.success) {
                                        console.log(`Thông báo đã được gửi cho thiết bị: ${tenHang}`);
                                    } else {
                                        console.error('Gửi thông báo thất bại!', data.error);
                                    }
                                })
                                .catch(error => console.error('Error:', error));
                            }
                        }, 10000); // 10 giây
                    } else {
                        console.error('Không tìm thấy tên hàng cho checkbox:', checkbox);
                    }
                } else {
                    console.error('Không tìm thấy hàng chứa checkbox:', checkbox);
                }
            }
        });
    </script>
</body>
</html>