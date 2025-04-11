<?php
require_once '../config/config.php';

try {
    $conn = pdo_get_connection();
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Không thể kết nối cơ sở dữ liệu: ' . $e->getMessage()]);
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Lấy dữ liệu từ form
    $serial_no = trim($_POST['serial_no']);
    $ten_hang = trim($_POST['ten_hang']);
    $nguoi_gui = trim($_POST['nguoi_gui']);
    $so_luong = $_POST['so_luong'];
    $tinh_trang_nhan = trim($_POST['tinh_trang_nhan']);
    $ngay_gui_hang = $_POST['ngay_gui_hang'];
    $dia_chi_bao_hanh = trim($_POST['dia_chi_bao_hanh']);
    $ngay_nhan = $_POST['ngay_nhan'];
    $cong_no = !empty($_POST['cong_no']) ? $_POST['cong_no'] : 0.00;
    $da_xu_ly_xong = isset($_POST['da_xu_ly_xong']) ? 1 : 0;
    $ghi_chu = trim($_POST['ghi_chu']);

    // Kiểm tra dữ liệu đầu vào
    if (empty($serial_no) || empty($ten_hang) || empty($nguoi_gui) || empty($tinh_trang_nhan) || empty($ngay_gui_hang) || empty($dia_chi_bao_hanh) || empty($ngay_nhan)) {
        echo json_encode(['success' => false, 'message' => 'Vui lòng điền đầy đủ thông tin.']);
        exit();
    }

    if (!is_numeric($so_luong) || $so_luong < 1) {
        echo json_encode(['success' => false, 'message' => 'Số lượng phải là số nguyên lớn hơn hoặc bằng 1.']);
        exit();
    }

    if (!is_numeric($cong_no) || $cong_no < 0) {
        echo json_encode(['success' => false, 'message' => 'Công nợ phải là số không âm.']);
        exit();
    }

    try {
        // Thực hiện truy vấn
        $stmt = $conn->prepare("INSERT INTO warranty_records (id, serial_no, ten_hang, nguoi_gui, so_luong, tinh_trang_nhan, ngay_gui_hang, dia_chi_bao_hanh, ngay_nhan, cong_no, da_xu_ly_xong, ghi_chu) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute([$serial_no, $ten_hang, $nguoi_gui, $so_luong, $tinh_trang_nhan, $ngay_gui_hang, $dia_chi_bao_hanh, $ngay_nhan, $cong_no, $da_xu_ly_xong, $ghi_chu]);

        // Lấy ID vừa thêm
        $id = $conn->lastInsertId();

        echo json_encode([
            'success' => true,
            'record' => [
                'id' => $id,
                'serial_no' => $serial_no,
                'ten_hang' => $ten_hang,
                'nguoi_gui' => $nguoi_gui,
                'so_luong' => $so_luong,
                'tinh_trang_nhan' => $tinh_trang_nhan,
                'ngay_gui_hang' => $ngay_gui_hang,
                'dia_chi_bao_hanh' => $dia_chi_bao_hanh,
                'ngay_nhan' => $ngay_nhan,
                'cong_no' => $cong_no,
                'da_xu_ly_xong' => $da_xu_ly_xong,
                'ghi_chu' => $ghi_chu
            ]
        ]);
    } catch (PDOException $e) {
        // Xử lý lỗi truy vấn
        echo json_encode(['success' => false, 'message' => 'Lỗi khi thêm dữ liệu: ' . $e->getMessage()]);
    }
    exit();
}

echo json_encode(['success' => false, 'message' => 'Yêu cầu không hợp lệ.']);
exit();
?>
<div class="col-lg-1">
    <label for="so_luong" class="form-label">Số lượng:</label>
    <input type="number" id="so_luong" name="so_luong" class="form-control" min="1" required>
</div>
<div class="col-lg-2">
    <label for="cong_no" class="form-label">Công nợ:</label>
    <input type="number" step="0.01" id="cong_no" name="cong_no" class="form-control">
</div>
<script>
    document.getElementById('addWarrantyForm').addEventListener('submit', function (e) {
        const soLuongInput = document.getElementById('so_luong');
        if (soLuongInput.value < 1 || isNaN(soLuongInput.value)) {
            e.preventDefault();
            alert('Số lượng phải là số nguyên lớn hơn hoặc bằng 1.');
            soLuongInput.focus();
        }
    });
</script>