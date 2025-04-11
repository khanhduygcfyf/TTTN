-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 01, 2025 lúc 03:30 PM
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
-- Cơ sở dữ liệu: `duan1_laptop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `address`
--

INSERT INTO `address` (`id`, `user_id`, `address`) VALUES
(17, 15, 'Vĩnh Long 123'),
(18, 6, 'Hà Nội');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `image`, `status`) VALUES
(2, 'iPhone', 'iphone3.jpg', 1),
(4, 'Samsung', 'samung2.jpg', 1),
(6, 'Xiaomi', 'xiaomi.jpg', 1),
(16, 'Realme', 'realmi.jpg', 1),
(17, 'OPPO', 'oppo-reno12-5g-pink-thumb-600x600.jpg', 1),
(19, 'Nokia', 'nokia.jpg', 1),
(20, 'vivo', 'vivo-v40-lite-bac-thumb-600x600.jpg', 1),
(21, 'HONOR', 'honor-x6b-green-thumb-600x600.jpg', 1),
(22, 'TCL', 'tcl-406s-blue-thumb-600x600.jpg', 1),
(23, 'TECNO', 'tecno-spark-10-pro-1_1702883431.png', 1),
(24, 'Masstel', 'masstel-fami-50-green-thumb-600x600.jpg', 1),
(25, 'Itel', 'itel-it9211-xanh-thumb-600x600.jpg', 1),
(26, 'viettel', 'viettel-sumo-4g-t2-black-thumb-600x600.jpg', 1),
(27, 'Benco', 'benco-4g-g3-xanh-thumb-600x600.jpg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 ẩn 1 hiện',
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderdetails_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `total` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `note` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`post_id`, `category_id`, `title`, `image`, `author`, `content`, `views`, `status`, `created_at`, `updated_at`) VALUES
(1, 15, 'Điện thoại chiến game đỉnh tại shop khanhduy', 'dtchiengame.jpg', 'Admin', '<p><strong>Xiaomi Black Shark 4s</strong></p><p>Black Shark 4S Gundam được trang bị cấu hình cực kỳ mạnh mẽ. Điện thoại với chipset Snapdragon 888+, xây dựng trên tiến trình 5nm cho khả năng chiến các game hồ họa khủng mạnh mẽ. Cung cấp năng lượng cho Black Shark 4S Gundam là viên pin dung lượng 4500mAh hỗ trợ sạc nhanh với công suất 120W.</p><p>&nbsp;</p>', 0, 1, '2023-11-29 17:13:09', '2024-12-23 22:54:40'),
(5, 15, 'Top 3 dòng điện thoại chụp ảnh đẹp nhất năm 2024', 'download.jpg', 'Admin', '<h3><strong>Điện thoại iPhone 15</strong></h3><p>Khi được hỏi về điện thoại nào chụp hình đẹp nhất, chắc hẳn iPhone 15 sẽ là cái tên được nhắc đến đầu tiên. iPhone 15 là chiếc điện thoại chụp ảnh đẹp được trang bị cảm biến camera được nâng cấp lên đến 48MP, cao hơn bản tiền nhiệm đến 4 lần. Camera trước có thêm tính năng Smart HDR với chế độ chụp ban đêm đỉnh cao. Chiếc điện thoại này được trang bị hệ thống camera kép xịn xò với góc chụp siêu rộng, lên đến 120 độ.&nbsp;</p><h3><strong>Samsung Galaxy S23 Ultra 5G</strong></h3><p>Đây là một trong những chiếc điện thoại Samsung chụp ảnh đẹp nhất 2024. Với thiết kế vô cùng sang trọng cùng các bản màu năng động, trẻ trung. Galaxy S23 Ultra 5G có camera với độ phân giải khủng lên đến 108MP. Ảnh được chụp sắc nét với chất lượng tuyệt vời.</p><h3><strong>Xiaomi Redmi Note 12 Pro 5G</strong></h3><p>Chiếc điện thoại đến từ nhà Xiaomi này nằm top với những đặc điểm camera vượt trội. Camera chính có độ phân giải 108MP đi kèm với cảm biến cao cấp cho ra những chiếc ảnh cực kỳ sắc nét. Điểm ghi dấu ấn của chiếc điện thoại này chính là tính năng Super Pixel cho phép ghép 4 điểm ảnh lại làm một.</p><p>Xiaomi Redmi Note 12 Pro 5G thách thức mọi điều kiện ánh sáng vối chế độ chụp ban đêm chuyên nghiệp. Đây được xem là chiếc điện thoại có pin trâu với dung lượng pin cực lớn 5000 mAh. Do đó, người dùng có thể quay chụp thoải mái mà không lo phải cắm sạc nhiều lần.</p>', 0, 1, '2023-11-29 17:25:47', '2024-12-23 23:10:44'),
(8, 16, 'Shop Khanhduyy xin chúc mọi người một ngày giáng sinh vui vẻ hạnh phúc ^-^', 'giangsinh.png', 'Admin', '<p>Nhân dịp giáng sinh shop Khanhduyy sẽ có tặng mọi người 1 món quà giáng sinh nho nhỏ khi mọi người đặt điện thoại của shop Cảm ơn mọi người đã đặt hàng tại shop &gt;-&lt;</p>', 0, 1, '2023-12-03 13:45:32', '2024-12-23 23:07:59'),
(9, 15, 'Galaxy AI', 'samsung.jpg', 'Admin', '<p>Kỉ nguyên công nghệ mới với Quyền năng Galaxy AI.<br>Galaxy AI mang đến trải nghiệm hoàn toàn mới và thay đổi cách mà bạn kết nối với thế giới, khai mở sự sáng tạo, nâng tầm hiệu suất công việc, và mở ra vô vàn tiềm năng.<br>Làm chủ cuộc sống với Galaxy AI.</p>', 0, 1, '2023-12-03 17:41:06', '2024-12-23 22:57:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_categories`
--

CREATE TABLE `post_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `post_categories`
--

INSERT INTO `post_categories` (`id`, `name`) VALUES
(15, 'Điện thoại'),
(16, 'Sự kiện');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sell_quantity` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `views` int(11) NOT NULL DEFAULT 0,
  `details` text NOT NULL,
  `short_description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `image`, `quantity`, `sell_quantity`, `price`, `sale_price`, `create_date`, `views`, `details`, `short_description`, `status`) VALUES
(1, 17, 'OPPO Reno12 5G', 'oppo-reno12-5g-_main_365_1020.png.webp', 10, 0, 12990000, 10990000, '2023-11-18 08:22:03', 3, '', '', 1),
(2, 2, 'Xiaomi Redmi Note 13', 'xiaomi-redmi-no_main_556.png', 10, 0, 3890000, 3890000, '2023-11-18 10:15:54', 3, '', '', 1),
(6, 4, 'Samsung M54 5G', 'samsung1.jpg', 10, 0, 3000000, 3000000, '2023-11-20 22:23:49', 4, '', '', 1),
(14, 20, 'Vivo Y11', 'vivo-y11-600-600-do-1-600x600.jpg', 10, 0, 2990000, 2990000, '2023-11-20 22:54:49', 1, '', '', 1),
(15, 4, 'Samsung Galaxy S24 Ultra 12GB/512GB', 'ss-s24-ultra-xam-222_1.webp', 10, 0, 33490000, 33490000, '2023-11-20 23:05:47', 1, '', '', 1),
(16, 6, 'Xiaomi Black Shark 4s', 'blackshark-4s-white_1634350802.jpg', 10, 0, 11390000, 10690000, '2023-11-20 23:09:13', 1, '', '', 1),
(17, 4, 'Samsung Galaxy A06 6GB/128GB', 'samsung-galaxy-a06-blue-thumb-600x600.jpg', 10, 0, 3790000, 3790000, '2023-11-20 23:12:48', 3, '', '', 1),
(18, 26, 'Viettel sumo 4G', 'viettel-sumo-4g-t2-black-thumb-600x600.jpg', 10, 0, 700000, 700000, '2023-11-20 23:20:33', 4, '', '', 1),
(20, 6, 'Xiaomi 14T 5G 12GB/256GB', 'xiaomi-14t-grey-thumb-600x600.jpg', 10, 0, 12990000, 12990000, '2023-11-20 23:31:04', 2, '', '', 1),
(21, 19, 'Nokia 110 5G', 'nokia2.jpg', 20, 0, 110000, 88000, '2023-11-23 09:54:06', 1, '', '', 1),
(23, 19, 'Nokia 105 4G', 'nokia1.jpg', 10, 0, 150000, 120000, '2023-11-23 12:19:16', 2, '', '', 1),
(24, 25, 'Itel S23', 'itel-s23-2_2.webp', 10, 2, 3990000, 2490000, '2023-11-23 12:20:16', 5, '', '', 1),
(25, 24, 'Masstel Fami 50 4G', 'masstel-fami-50-green-thumb-600x600.jpg', 10, 0, 600000, 500000, '2023-11-23 16:21:03', 6, '', '', 1),
(26, 23, 'Tecno Spark GO 1', 'tecno-spark-go-1-white-thumb-600x600.jpg', 10, 1, 1990000, 1800000, '2023-11-23 16:23:55', 15, '', '', 1),
(27, 21, 'HONOR X6b', 'honor-x6b-green-thumb-600x600.jpg', 10, 1, 3690000, 3500000, '2023-11-23 20:31:17', 4, '', '', 1),
(28, 27, 'Benco S1 Pro', 'benco-s1-pro-xanh_2.webp', 10, 1, 4290000, 3900000, '2023-11-29 20:36:43', 15, '', '', 1),
(29, 16, 'Realmy C61', 'realme-c61-4gb1_main_252_1020.png.webp', 10, 1, 3500000, 3000000, '2023-12-02 20:54:53', 13, '', '', 1),
(30, 22, 'TCL 505', 'tcl-505-xanh-thumb-1-600x600.jpg', 10, 3, 5000000, 4800000, '2023-12-02 20:56:21', 13, '', '', 1),
(31, 2, 'iPhone 14 128GB', 'iphone.jpg', 10, 4, 20000000, 19990000, '2023-12-02 20:59:06', 17, '', '', 1),
(32, 2, 'iPhone 13 256GB', 'iphone2.jpg', 10, 2, 18000000, 17000000, '2023-12-02 21:00:48', 30, '', '', 1),
(34, 6, 'Xiaomi 11 Lite 5G NE', 'xiaomi-11-lite-5g-ne-pink-600x600.jpg', 4, 2, 7000000, 6000000, '2024-03-31 22:24:56', 18, '', '<ul><li>Hệ điều hành: Android 11.</li><li>Chip xử lý (CPU): Snapdragon 778G <strong>5G</strong>.</li><li>Tốc độ CPU: 1 nhân 2.4 GHz, 3 nhân 2.2 GHz &amp; 4 nhân 1.9 GHz.</li><li>Chip đồ họa (GPU): Adreno 642L.</li><li>RAM: 8 GB.</li><li>Dung lượng lưu trữ: 128 GB.</li><li>Dung lượng còn lại (khả dụng) khoảng: 115 GB.</li><li>Thẻ nhớ: MicroSD, hỗ trợ tối đa 512 GB.</li></ul>', 1),
(35, 20, 'vivo V40 5G 12GB/256GB', 'vivo-v40-5g-cam-hong-thumb-600x600.jpg', 7, 3, 12900000, 10000000, '2024-12-18 14:24:09', 7, '', '', 1),
(36, 4, 'Samsung', 'samsung-galaxy-a35_8__2_1_2.webp', 10, 1, 8000000, 8000000, '2024-12-19 02:50:41', 4, '', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL COMMENT 'Họ tên',
  `image` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 là khách hàng 1 là nhân viên',
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `image`, `email`, `phone`, `address`, `role`, `active`) VALUES
(8, 'admin', '$2y$10$Cm.2KiZ85WRGUTBk8vhMaOIQt46A53HKuzPfZh2jS.fdZzAr33dTi', 'Admin', 'User-Avatar-Profile-PNG-Isolated-Clipart.png', 'duykun@gmail.com', '0903077032', 'Bạc Liêu', 1, 1),
(17, 'khanhduy', '$2y$10$epSxFmY2Shb8WKilxQIS4eYXBpMPd6q/kKoZPT.UQ492f/go8/Dr2', 'Lê Khánh Duy', 'user-default.png', 'duy0984162403@gmail.com', '0984162403', 'Bạc Liêu', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sell` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderdetails_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
