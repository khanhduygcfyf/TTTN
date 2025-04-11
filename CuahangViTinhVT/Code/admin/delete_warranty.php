<?php
require_once '../config/config.php';
$conn = pdo_get_connection();

$id = $_GET['id'];

// Xóa bản ghi
$stmt = $conn->prepare("DELETE FROM warranty_records WHERE id = ?");
$success = $stmt->execute([$id]);

// Cập nhật lại ID để liên tục
if ($success) {
    $conn->query("SET @count = 0");
    $conn->query("UPDATE warranty_records SET id = @count:=@count+1");
}

echo json_encode(['success' => $success]);
?>