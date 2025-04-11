<?php
/**
 * Mở kết nối đến CSDL sử dụng PDO
 */
function pdo_get_connection(){
    $host = '127.0.0.1';
    $db_name = 'duan1_laptop'; // Đảm bảo tên cơ sở dữ liệu là duan1_laptop
    $username = 'root';
    $password = '';
    try {
        $conn = new PDO("mysql:host=$host;dbname=$db_name;charset=utf8mb4", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        die("Kết nối cơ sở dữ liệu thất bại: " . $e->getMessage());
    }
    return $conn;
}

