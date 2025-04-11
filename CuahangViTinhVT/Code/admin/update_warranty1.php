<?php
require_once '../config/config.php';
$conn = pdo_get_connection();

$data = json_decode(file_get_contents('php://input'), true);
$id = $data['id'];
unset($data['id']); // Loại bỏ ID khỏi dữ liệu cập nhật

$fields = array_keys($data);
$placeholders = implode(' = ?, ', $fields) . ' = ?';

$stmt = $conn->prepare("UPDATE warranty_records SET $placeholders WHERE id = ?");
$success = $stmt->execute([...array_values($data), $id]);

echo json_encode(['success' => $success]);
?>