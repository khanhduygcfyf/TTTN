-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 27, 2025 lúc 12:49 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `viettan_warranty`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warranty_records`
--

CREATE TABLE `warranty_records` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Khóa chính',
  `ten_hang` varchar(255) NOT NULL COMMENT 'Tên hàng',
  `nguoi_gui` varchar(255) NOT NULL COMMENT 'Người gửi',
  `so_luong` int(11) UNSIGNED NOT NULL COMMENT 'Số lượng',
  `tinh_trang_nhan` varchar(255) NOT NULL COMMENT 'Tình trạng nhận',
  `ngay_gui_hang` date NOT NULL COMMENT 'Ngày gửi hàng',
  `dia_chi_bao_hanh` varchar(255) NOT NULL COMMENT 'Địa chỉ bảo hành',
  `ngay_nhan` date NOT NULL COMMENT 'Ngày nhận',
  `cong_no` decimal(10,2) UNSIGNED NOT NULL COMMENT 'Công nợ ',
  `da_xu_ly_xong` tinyint(1) UNSIGNED NOT NULL COMMENT 'Đã xử lý xong (0 hoặc 1)',
  `ghi_chu` text NOT NULL COMMENT 'Ghi chú'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
