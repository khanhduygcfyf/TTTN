<?php
require_once '../config/config.php';
$conn = pdo_get_connection();

$data = json_decode(file_get_contents('php://input'), true);
$id = $data['id'];
$da_xu_ly_xong = $data['da_xu_ly_xong'];

$stmt = $conn->prepare("UPDATE warranty_records SET da_xu_ly_xong = ? WHERE id = ?");
$success = $stmt->execute([$da_xu_ly_xong, $id]);

echo json_encode(['success' => $success]);
?>