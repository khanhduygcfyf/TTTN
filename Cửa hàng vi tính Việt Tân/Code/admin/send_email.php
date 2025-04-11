<?php

require_once '../config/config.php';
require 'vendor/autoload.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Kết nối cơ sở dữ liệu
$conn = pdo_get_connection();

// Lấy dữ liệu thô từ php://input
$rawInput = file_get_contents('php://input');
file_put_contents('debug_log.txt', "Raw Input: $rawInput\n", FILE_APPEND);

if (empty($rawInput)) {
    file_put_contents('debug_log.txt', "Raw Input is empty\n", FILE_APPEND);
    echo json_encode(['success' => false, 'error' => 'Dữ liệu JSON không tồn tại hoặc không hợp lệ']);
    exit();
}

// Giải mã JSON
$data = json_decode($rawInput, true);
file_put_contents('debug_log.txt', "Decoded JSON: " . print_r($data, true), FILE_APPEND);

if (!$data || !isset($data['id']) || !isset($data['tenHang'])) {
    file_put_contents('debug_log.txt', "Dữ liệu JSON không hợp lệ\n", FILE_APPEND);
    echo json_encode(['success' => false, 'error' => 'Dữ liệu JSON không hợp lệ']);
    exit();
}

$id = $data['id'];
$tenHang = $data['tenHang'];

// Lấy thông tin từ bảng warranty_records
$stmt = $conn->prepare("SELECT * FROM warranty_records WHERE id = ?");
$stmt->execute([$id]);
$record = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$record) {
    file_put_contents('debug_log.txt', "Không tìm thấy bản ghi với ID: $id\n", FILE_APPEND);
    echo json_encode(['success' => false, 'error' => 'Không tìm thấy bản ghi']);
    exit();
}

// Gửi email
function sendEmail($to, $subject, $body) {
    $mail = new PHPMailer(true);
    try {
        $mail->isSMTP();
        $mail->Host       = 'smtp.gmail.com';
        $mail->SMTPAuth   = true;
        $mail->Username   = 'vvhieu502@gmail.com'; // Thay bằng email của bạn
        $mail->Password   = 'pidg vglg gqky dpnw'; // Thay bằng mật khẩu ứng dụng Gmail
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port       = 587;

        $mail->setFrom('vvhieu502@gmail.com', 'Admin');
        $mail->addAddress($to);

        $mail->isHTML(true);
        $mail->Subject = $subject;
        $mail->Body    = $body;

        $mail->send();
        file_put_contents('debug_log.txt', "Email đã được gửi thành công đến $to\n", FILE_APPEND);
    } catch (Exception $e) {
        file_put_contents('debug_log.txt', "Lỗi gửi email: {$mail->ErrorInfo}\n", FILE_APPEND);
    }
}

// Gửi email nhắc nhở
$to = 'arcblu2@gmail.com'; // Thay bằng email nhận thông báo
$subject = "Nhắc nhở xử lý thiết bị chưa được xử lý";
$body = "Thiết bị <b>\"$tenHang\"</b> (ID: $id) chưa được xử lý. Vui lòng kiểm tra và xử lý ngay.";

sendEmail($to, $subject, $body);

echo json_encode(['success' => true]);
?>