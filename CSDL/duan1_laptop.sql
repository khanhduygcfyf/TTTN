-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 11, 2025 lúc 04:41 AM
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
(2, 'Camera', 'Camera.jpg', 1),
(4, 'Đầu ghi', 'DAi2K8104H3-1536x1536.png', 1),
(6, 'Ổ cứng', '452_o_cung_ssd_wd_green_240_gb_sata_iii_wds240g3g0a__1_.jpg', 1),
(16, 'Mainboard', 'h610m_h_v3_ddr4-01_d00cab3a362e4d759823b579a68fbc1a_grande.JPG', 1),
(17, 'RAM', 'Ram-Kingston-16GB.jpg', 1),
(19, 'Nguồn máy tính', 'Power-350W.jpg', 1),
(20, 'Case PC', 'casePC.jpg', 1),
(21, 'Bàn phím', '11518_xiberia_xs3100.jpg', 1),
(22, 'Đầu mạng RJ45', 'Đầu mạng.jpg', 1),
(23, 'Thẻ nhớ', 'the-nho.jpg', 1),
(24, 'Chuột', 'chuot.jpg', 1),
(25, 'Card đồ họa', 'vga.jpg', 1),
(26, 'Văn phòng phẩm', 'van-phong-pham-quan-8.png', 1),
(27, 'Loa vi tính', 'loa.jpg', 1);

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

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`comment_id`, `content`, `date`, `status`, `user_id`, `product_id`) VALUES
(14, 'Camera dữ dằn', '2025-04-04 09:38:28', 1, 8, 37),
(15, 'hay', '2025-04-04 10:01:06', 1, 8, 37),
(16, 'hay', '2025-04-04 10:01:25', 1, 8, 37),
(17, 'Rất tốt', '2025-04-04 10:10:56', 1, 8, 37);

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

--
-- Đang đổ dữ liệu cho bảng `orderdetails`
--

INSERT INTO `orderdetails` (`orderdetails_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(120, 62, 36, 1, 8000000),
(121, 63, 37, 1, 200),
(122, 64, 36, 1, 8000000);

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

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `date`, `total`, `address`, `phone`, `note`, `status`) VALUES
(62, 18, '2025-04-02 21:15:08', 8000000, 'bạc liêu', '0986546782', '', 1),
(63, 8, '2025-04-04 09:20:41', 200, 'Bạc Liêu', '0903077032', '', 4),
(64, 8, '2025-04-08 14:07:20', 8000000, 'Bạc Liêu', '0903077032', '', 1);

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
(1, 16, 'Bán laptop', 'baiviet.jpg', 'Admin', '<p>Laptop dell latitude 5300 i5 Gen 8 ram 8G/Ssd 256G hàng lướt đẹp mới về giá 5tr. Lh: 0918458963</p>', 0, 1, '2023-11-29 17:13:09', '2025-04-09 13:41:33'),
(5, 16, 'TOP 5 các hãng camera tốt và được ưa chuộng nhất hiện nay', 'Camera.jpg', 'Admin', '<ul><li>Camera giám sát EZVIZ&nbsp;</li><li>Camera giám sát TP - Link&nbsp;</li><li>Camera Tiandy&nbsp;</li><li>Camera Botslab</li><li>Camera giám sát Imou</li></ul><p>&nbsp;</p>', 0, 1, '2023-11-29 17:25:47', '2025-04-09 13:57:43'),
(8, 16, 'Build PC giá rẻ làm việc và học tập chỉ từ 6 triệu', 'pc-6.jpg', 'Admin', '<ul><li>Mainboard (Main): MSI H310 - Giá 1.350.000 VND</li><li>CPU: Intel G5400 - Giá 1.600.000 VND</li><li>RAM: DDR4 8GB - Giá 950.000 VND</li><li>Ổ đĩa cứng SSD: Samsung 120GB - Giá 750.000 VND</li><li>Nguồn điện (Nguồn): Xigmatek 500W - Giá 650.000 VND</li><li>Vỏ case: Full LED - Giá 500.000 VND</li></ul>', 0, 1, '2023-12-03 13:45:32', '2025-04-09 13:57:07'),
(9, 16, 'Sale sốc văn phòng phẩm', 'van-phong-pham.jpg', 'Admin', '<p>Tặng kèm quà khi đơn từ 500.000 trở lên&nbsp;</p>', 0, 1, '2023-12-03 17:41:06', '2025-04-09 13:48:39');

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
(1, 17, 'Ram Laptop Kingston 16GB 3200 MHz (KVR32S22S8/16)', 'Ram-Kingston-16GB.jpg', 10, 0, 790000, 790000, '2023-11-18 08:22:03', 4, '<figure class=\"table\"><table><tbody><tr><td><strong>&nbsp; Nhà sản xuất</strong></td><td>&nbsp;&nbsp;&nbsp; Kingston (USA)</td></tr><tr><td><strong>&nbsp;&nbsp;&nbsp; Model</strong></td><td>&nbsp;&nbsp;&nbsp; KVR32S22S8/16</td></tr><tr><td><strong>&nbsp;&nbsp;&nbsp; Chuẩn RAM</strong></td><td>&nbsp;&nbsp;&nbsp; DDR4 SODIMM</td></tr><tr><td><strong>&nbsp;&nbsp;&nbsp; Bus hỗ trợ</strong></td><td>&nbsp;&nbsp;&nbsp; 3200MHz</td></tr><tr><td><strong>&nbsp;&nbsp;&nbsp; Dung lượng</strong></td><td>&nbsp;&nbsp;&nbsp; 16GB (1x16GB)</td></tr><tr><td><strong>&nbsp;&nbsp;&nbsp; Điện áp</strong></td><td>&nbsp;&nbsp;&nbsp; 1.2v</td></tr><tr><td><strong>&nbsp;&nbsp;&nbsp; CAS Latency</strong></td><td>&nbsp;&nbsp;&nbsp; CL22</td></tr><tr><td><strong>&nbsp;&nbsp;&nbsp; OverClock</strong></td><td>&nbsp;&nbsp;&nbsp; None</td></tr></tbody></table></figure>', '<ul><li><strong>Loại sản phẩm:</strong> Ram Laptop</li><li><strong>Dung lượng:</strong> 16GB</li><li><strong>Chuẩn:</strong> DDR4</li><li><strong>Bus:</strong> 3200Mhz</li><li><strong>Điện áp:</strong> 1.2v</li></ul>', 1),
(2, 2, 'KX-A4013WN-A', 'KX-A4013WN-A.png', 10, 0, 1830000, 1830000, '2023-11-18 10:15:54', 10, '<p>. Camera IP WIFI thân 4.0MP ngoài trời<br>. Cảm biến 1/3″ Sony SNR1s CMOS 4.0MP<br>. Độ phân giải: 4MP@20fps, 1080@25/30fps<br>. Chuẩn nén hình ảnh: Smart H.265+/H.265/H.264+/H.264<br>. Tầm xa hồng ngoại: 30m, hỗ trợ hồng ngoại thông minh<br>. Ống kính: 2.8mm , góc nhìn 90°<br>. Công nghệ bổ trợ hình ảnh: Chống ngược sáng DWDR, Chống nhiễu 3DNR, Chế độ ngày đêm IRC, AWB, AGC..<br>. Kết nối LAN, hỗ trợ ONVIF, wifi AP.<br>. Tích hợp mic và loa , hỗ trợ đàm thoai 2 chiều<br>. Hỗ trợ giao diện web dễ dàng quản lý<br>. Hỗ trợ thẻ nhớ lên đến 256GB<br>. Nguồn 12VDC , chất liệu vỏ nhựa + kim loại<br>. Chuẩn chống bụi nước IP67, lắp đặt ngoài trời</p>', '<p>. Camera IP WIFI thân 4.0MP ngoài trời<br>. Cảm biến 1/3″ Sony SNR1s CMOS 4.0MP<br>. Độ phân giải: 4MP@20fps, 1080@25/30fps<br>. Chuẩn nén hình ảnh: Smart H.265+/H.265/H.264+/H.264<br>. Tầm xa hồng ngoại: 30m, hỗ trợ hồng ngoại thông minh<br>. Ống kính: 2.8mm , góc nhìn 90°<br>. Công nghệ bổ trợ hình ảnh: Chống ngược sáng DWDR, Chống nhiễu 3DNR, Chế độ ngày đêm IRC, AWB, AGC..<br>. Kết nối LAN, hỗ trợ ONVIF, wifi AP.<br>. Tích hợp mic và loa , hỗ trợ đàm thoai 2 chiều<br>. Hỗ trợ giao diện web dễ dàng quản lý<br>. Hỗ trợ thẻ nhớ lên đến 256GB<br>. Nguồn 12VDC , chất liệu vỏ nhựa + kim loại<br>. Chuẩn chống bụi nước IP67, lắp đặt ngoài trời</p>', 1),
(6, 4, 'KX-DAi8116H3', 'KX-DAi8116H3-1536x1536.png', 10, 0, 7940000, 7940000, '2023-11-20 22:23:49', 4, '<p>. Đầu ghi hình AI nhận diện khuôn mặt 8 kênh<br>. Hỗ trợ HDCVI/AHD/TVI/CVBS/IP<br>. Hỗ trợ camera HDCVI 5M-N (1fps–10fps); 4M-N/1080P (1fps–15fps); 1080N/720P/960H/D1/CIF (1fps–25/30fps)<br>. Chuẩn nén hình ảnh: AI Coding/H.265+/H.265/H.264+/H.264<br>. Hỗ trợ camera IP tối đa 12 kênh, lên đến 6Mp. Băng thông tối đa 64 Mbps<br>. Hỗ trợ 1 kênh Bảo vệ chu vi và 8 kênh SMD Plus. Playback 1/4 kênh cùng lúc<br>. Hỗ trợ 1 kênh Face recognition (chỉ hỗ trợ camera analog). Tốc độ xử lý: lên đến 8 khuôn mặt / giây<br>. Cảnh báo người lạ: phát hiện người lạ mặt (không có trong cơ sở dữ liệu của thiết bị)<br>. Hỗ trợ tìm kiếm và phân loại theo mục tiêu (Người, Phương tiện)<br>. Hỗ trợ cổng Audio in/out đàm thoại 2 chiều hoặc ghi âm cho kênh 1.<br>. Hỗ trợ 1 HDMI, 1 VGA, 1 RJ-45 Port (100 Mbps)<br>. Hỗ trợ 1 SATA x 10TB<br>. Hỗ trợ 128 user truy cập cùng lúc thích hợp cho những dự án như trường học, trường mầm non…<br>. Hỗ trợ kết nối với camera cũa các hãng khác như: Arecont Vision, AXIS, Bosch, Brickcom, Canon, CP Plus, Dynacolor, Honeywell, Panasonic, Pelco, Samsung, Sanyo, Sony, Videosec, Vivotek,…</p>', '<p>. Hỗ trợ CVI/AHD/TVI/CVBS/IP<br>. Hỗ trợ ghi hình: 5M-N (1 fps–10 fps); 4M-N/1080P (1 fps–15 fps); 1080N/720P/960H/D1/CIF (1 fps–25/30 fps); Sub stream: D1/CIF (1 fps–15 fps)<br>. AI Coding/H.265+/H.265/H.264+/H.264<br>. Hỗ trợ camera IP tối đa 24 kênh, lên đến 6Mp. Băng thông tối đa 128Mbps<br>. Hỗ trợ chức năng Bảo vệ chu vi (2ch) và SMD Plus (16ch) (analog), 2 kênh Face recognition (analog), phát hiện người lạ mặt<br>. Playback 1/4/9/16 kênh cùng lúc<br>. Hỗ trợ cổng Audio in/out đàm thoại 2 chiều hoặc ghi âm cho kênh 1.<br>. Hỗ trợ 1 HDMI, 1 VGA, 1 RJ-45 Port<br>. Hỗ trợ 1 SATA x 16TB</p>', 1),
(14, 20, 'Thùng máy Vitra Cruise AX3 - Trắng | Micro ATX, kèm sẵn 4 fan RGB', 'pctrang.jpg', 6, 0, 519000, 419000, '2023-11-20 22:54:49', 2, '<p><strong>Kích thước:</strong></p><ul><li><strong>Chuẩn:</strong> M-ATX / ITX</li><li><strong>Kích thước (Cao x Rộng x Dài):</strong> 310 x 195 x 410 mm</li></ul><p><strong>Ngoại hình:</strong></p><ul><li><strong>Màu sắc:</strong> Trắng</li><li><strong>Chất liệu:</strong> Khung thép SPCC 0.45mm &amp; Plastic/ Sơn tĩnh điện, sườn kính cường lực dày 4mm</li><li><strong>Khối lượng tịnh:</strong> 3.8kg</li></ul><p><strong>Cổng giao tiếp mặt trước:</strong></p><ul><li>USB 2.0 x 2</li><li>1 HD Audio &amp; 1 Mic</li></ul><p><strong>Khay gắn:</strong></p><ul><li>HDD 3.5” x 1</li><li>SSD 2.5” x 2</li><li>PCI x 4</li></ul><p><strong>Hệ thống làm mát:</strong></p><ul><li><strong>Trước:</strong> 3 x Fan 120mm (Kèm theo)</li><li><strong>Sau:</strong> 1 x Fan 120mm (Kèm theo)</li><li><strong>Top:</strong> 2 x Fan 120mm (tùy chọn)</li></ul><p><strong>Hỗ trợ:</strong></p><ul><li>Fan CPU cao 160mm</li><li>VGA dài 280mm</li></ul>', '<ul><li><strong>Vật liệu:</strong> Steel</li><li><strong>Kích thước:</strong> 310 x 195 x 410 mm</li><li><strong>Khe mở rộng:</strong> 7 slots</li><li><strong>Hỗ trợ Mainboard:</strong> M-ATX / ITX</li><li><strong>Cổng kết nối:</strong> USB 2.0 x 2, 1 HD Audio &amp; 1 Mic</li><li><strong>Hỗ trợ tản nhiệt CPU:</strong> 160mm</li><li><strong>Hỗ trợ VGA:</strong> 280mm</li><li><strong>Kính cường lực:</strong> Hông</li><li><strong>Fan case</strong><ul><li><strong>Trước:</strong> 3 x Fan 120mm (Kèm theo)</li><li><strong>Sau:</strong> 1 x Fan 120mm (Kèm theo)</li><li><strong>Top:</strong> 2 x Fan 120mm (tùy chọn)</li></ul></li></ul>', 1),
(15, 4, 'KX-DAi8104H3', 'KX-DAi8104H3-1536x1536.png', 10, 0, 3350000, 3350000, '2023-11-20 23:05:47', 1, '<p>. Đầu ghi hình AI nhận diện khuôn mặt 4 kênh<br>. Hỗ trợ HDCVI/AHD/TVI/CVBS/IP<br>. Hỗ trợ camera HDCVI 5M-N (1fps–10fps); 4M-N/1080P (1fps–15fps); 1080N/720P/960H/D1/CIF (1fps–25/30fps)<br>. Chuẩn nén hình ảnh: AI Coding/H.265+/H.265/H.264+/H.264<br>. Hỗ trợ camera IP tối đa 6 kênh, lên đến 6Mp. Băng thông tối đa 32 Mbps<br>. Hỗ trợ 1 kênh Bảo vệ chu vi và 4 kênh SMD Plus. Playback 1/4 kênh cùng lúc<br>. Hỗ trợ 1 kênh Face recognition (chỉ hỗ trợ camera analog). Tốc độ xử lý: lên đến 8 khuôn mặt / giây<br>. Cảnh báo người lạ: phát hiện người lạ mặt (không có trong cơ sở dữ liệu của thiết bị)<br>. Hỗ trợ tìm kiếm và phân loại theo mục tiêu (Người, Phương tiện)<br>. Hỗ trợ cổng Audio in/out đàm thoại 2 chiều hoặc ghi âm cho kênh 1.<br>. Hỗ trợ 1 HDMI, 1 VGA, 1 RJ-45 Port (100 Mbps)<br>. Hỗ trợ 1 SATA x 6TB<br>. Hỗ trợ 128 user truy cập cùng lúc thích hợp cho những dự án như trường học, trường mầm non…<br>. Hỗ trợ kết nối với camera cũa các hãng khác như: Arecont Vision, AXIS, Bosch, Brickcom, Canon, CP Plus, Dynacolor, Honeywell, Panasonic, Pelco, Samsung, Sanyo, Sony, Videosec, Vivotek,…</p>', '<p>. Đầu ghi hình Ai nhận diện khuôn mặt 4 kênh<br>. Hỗ trợ camera HDCVI 5M-N; 4M-N/1080P; 1080N/720P/960H/D1/CIF<br>. Chuẩn nén hình ảnh: AI Coding/H.265+/ H.265/H.264+/H.264<br>. Hỗ trợ camera IP tối đa 6 kênh, lên đến 6Mp<br>. Băng thông tối đa 32 Mbps<br>. Hỗ trợ 1 kênh Bảo vệ chu vi và 4 kênh SMD Plus. Playback 1/4 kênh cùng lúc, 1 kênh Face recognition (chỉ hỗ trợ camera analog)<br>. Tốc độ xử lý: lên đến 8 khuôn mặt / giây<br>. Cảnh báo người lạ: phát hiện người lạ mặt (không có trong cơ sở dữ liệu của thiết bị)<br>. Hỗ trợ 1 HDMI, 1 VGA, 1 RJ-45 Port (100 Mbps), 1 SATA x 6TB</p>', 1),
(16, 6, 'SDSSDA-240G-G26', 'ssd.JPG', 10, 0, 700000, 700000, '2023-11-20 23:09:13', 1, '<p>-&nbsp;<strong>ổ cứng SSD Sandisk</strong> của bạn với phần mềm quản lý <strong>Sandisk Dashboard</strong> giúp bạn dễ dàng quản lý thiết bị trong nền tảng window, hỗ trợ nâng cấp firmware và <strong>xử lý lỗi dữ liệu SSD</strong></p><p>- Với tốc độ đọc lên tới 530MB/s và tốc độ ghi 440MB/s điều này mang lại trải nghiệm chơi game cực nhanh .</p><p>&nbsp;- Điều đặc biệt được người dùng quan tâm tới chiếc<strong> ổ Sandisk SSD Plus</strong> chính là khả năng chống shock tới 1500G ,thời gian hoạt động ước tính&nbsp;1.750.000 giờ.</p>', '<p>- Ổ cứng SSD Laptop SANDISK PLUS<br>- Tốc độ đọc/ghi đạt 530 MB/s và 440MB/s<br>- Xử lý nhanh<br>- Hoạt động êm và hiệu quả<br>- Hiệu năng ổn định<br>- Phát sinh ít nhiệt do đó laptop sẽ mát hơn<br>- Bảo hành chính hãng 36 Tháng</p>', 1),
(17, 4, 'KX-DAi8104TH3', 'KX-DAi8104TH3.jpg', 10, 0, 3175000, 3175000, '2023-11-20 23:12:48', 3, '<p>. Đầu ghi hình AI nhận diện khuôn mặt 4 kênh vỏ nhựa<br>. Hỗ trợ HDCVI/AHD/TVI/CVBS/IP<br>. Hỗ trợ camera HDCVI 5M-N (1fps–10fps); 4M-N/1080P (1fps–15fps); 1080N/720P/960H/D1/CIF (1fps–25/30fps)<br>. Chuẩn nén hình ảnh: AI Coding/H.265+/H.265/H.264+/H.264<br>. Hỗ trợ camera IP tối đa 6 kênh, lên đến 6Mp. Băng thông tối đa 32 Mbps<br>. Hỗ trợ 1 kênh Bảo vệ chu vi và 4 kênh SMD Plus. Playback 1/4 kênh cùng lúc<br>. Hỗ trợ 1 kênh Face recognition (chỉ hỗ trợ camera analog). Tốc độ xử lý: lên đến 8 khuôn mặt / giây<br>. Cảnh báo người lạ: phát hiện người lạ mặt (không có trong cơ sở dữ liệu của thiết bị)<br>. Hỗ trợ tìm kiếm và phân loại theo mục tiêu (Người, Phương tiện)<br>. Hỗ trợ cổng Audio in/out đàm thoại 2 chiều hoặc ghi âm cho kênh 1.<br>. Hỗ trợ 1 HDMI, 1 VGA, 1 RJ-45 Port (100 Mbps)<br>. Hỗ trợ 1 SATA x 6TB<br>. Hỗ trợ 128 user truy cập cùng lúc thích hợp cho những dự án như trường học, trường mầm non…<br>. Hỗ trợ kết nối với camera cũa các hãng khác như: Arecont Vision, AXIS, Bosch, Brickcom, Canon, CP Plus, Dynacolor, Honeywell, Panasonic, Pelco, Samsung, Sanyo, Sony, Videosec, Vivotek,…</p>', '<p>. Đầu ghi hình Ai nhận diện khuôn mặt 4 kênh vỏ nhựa<br>. Hỗ trợ camera HDCVI 5M-N; 4M-N/1080P; 1080N/720P/960H/D1/CIF<br>. Chuẩn nén hình ảnh: AI Coding/H.265+/ H.265/H.264+/H.264<br>. Hỗ trợ camera IP tối đa 6 kênh, lên đến 6Mp<br>. Băng thông tối đa 32 Mbps<br>. Hỗ trợ 1 kênh Bảo vệ chu vi và 4 kênh SMD Plus.<br>. Hỗ trợ 1 kênh Face recognition<br>. Cảnh báo người lạ: phát hiện người lạ mặt<br>. Hỗ trợ tìm kiếm và phân loại theo mục tiêu, cổng Audio in/out đàm thoại 2 chiều<br>. Hỗ trợ 1 HDMI, 1 VGA, 1 RJ-45 Port(100 Mbps), 1 SATA x 6TB</p>', 1),
(18, 26, 'Giấy note 5 màu nhỏ dạ quang Uni-T', 'giay-note-5-mau-1.png', 100, 0, 7000, 7000, '2023-11-20 23:20:33', 4, '', '<p><strong>Giấy note 5 màu dạ quang Uni-T:</strong> Giấy có 5 màu sắc khác nhau nổi bật, đẹp mắt. Phục vụ tốt nhu cầu làm việc, chất keo bền lâu, khó bong tróc. Đặc biệt với màu dạ quang sẽ giúp người sử dụng đánh dấu 1 cách rõ ràng hơn.</p>', 1),
(20, 6, 'SWS240G3G0A', '452_o_cung_ssd_wd_green_240_gb_sata_iii_wds240g3g0a__1_.jpg', 10, 0, 500000, 500000, '2023-11-20 23:31:04', 3, '<p>Chuẩn kết nối: SATA 3 (6Gb/s)<br>Dung lượng lưu trữ: <strong>240GB</strong><br>Kích thước / Loại: 2.5 inch</p><p><strong>Hiệu năng</strong></p><p>Tốc độ truyền dữ liệu (max)<br>Tốc độ chuẩn kết nối: 6 Gb/s<br>Tốc độ đọc dữ liệu: 545 MB/s<br>&nbsp;Độ bền MTBF: lên tới 1 triệu giờ</p><p><strong>Quản lý điện năng tiêu thụ</strong><br>Yêu cầu nguồn điện trung bình:<br>&nbsp; &nbsp;Đọc/ghi: 1700 mW max<br>&nbsp; Trung bình khi hoạt động: 60 mW<br>&nbsp; &nbsp;Ngủ:&nbsp;26 mW</p><p><strong>Thông số khi hoạt động</strong><br>Nhiệt độ<br>&nbsp; Hoạt động: 0 - 70°C<br>&nbsp; Không hoạt động: -55 - 85°C<br>Shock<br>&nbsp;&nbsp;1,500 G @ 0.5 msec half sine<br>Độ ồn&nbsp;<br>&nbsp; Nhàn rỗi:&nbsp;4.9 gRMS, 7-800 Hz<br>&nbsp; Hoạt động (Trung bình):&nbsp;5.0 gRMS, 10-2000 Hz</p><p>Kích thước vật lý: 7.00mm x 69.85mm x 100.50mm; Nặng:&nbsp;32.2g, ± 0.5g</p>', '<ul><li>Dung lượng 240GB&nbsp;</li><li>Chuẩn giao tiếp SATA3 (6Gb/s) &nbsp;</li><li>Tốc độ đọc 545MB/s</li><li>Tốc độ ghi Up to 465MB/s</li><li>Kích thước 2.5inch</li><li>Bảo hành 3 năm</li></ul>', 1),
(21, 19, 'Nguồn máy tính AIGO VK650 - 650W (80 Plus/ Active PFC/ Single Rail)', 'Power-650W.jpg', 10, 0, 800000, 800000, '2023-11-23 09:54:06', 1, '<figure class=\"table\"><table><tbody><tr><td>Thương hiệu</td><td>AIGO</td></tr><tr><td>Tên sản phẩm</td><td>AIGO VK650 - 650W (85 Plus/ Active PFC/ Single Rail)</td></tr><tr><td>Chủng loại</td><td>Nguồn máy tính</td></tr><tr><td colspan=\"2\">Chi tiết</td></tr><tr><td>Điện áp đầu vào</td><td>220-240V</td></tr><tr><td>Công suất tối đa</td><td>650W</td></tr><tr><td>Quạt</td><td>120mm</td></tr><tr><td>Tiêu chuẩn</td><td>&nbsp;</td></tr><tr><td>Kích thước (CxRxD)</td><td>150mm x 140mm x 85mm</td></tr><tr><td>Chiều dài nguồn tối đa</td><td>150mm</td></tr><tr><td>Khối lượng</td><td>&nbsp;</td></tr><tr><td>Số lượng cable kết nối</td><td>1 x ATX 24-PIN (20+4)<br>2 x CPU 8-PIN (4+4)<br>2 x PCIe 6+2 Pins<br>4 x SATA (4 SATA)<br>2 x PERIPHERAL (4-PIN)</td></tr><tr><td>Loại dây cắm</td><td>Non modun</td></tr></tbody></table></figure>', '<ul><li>Công suất tối đa 600w</li><li>Phù hợp các loại cấu hình phổ thông</li><li>Thiết kế chắc chắn, cứng cáp</li><li>Fan tản nhiệt 120mm giúp tăng khả năng làm mát cho bộ nguồn</li></ul>', 1),
(23, 19, 'Nguồn máy tính AIGO VK350 - 350W', 'Power-350W.jpg', 10, 0, 349000, 349000, '2023-11-23 12:19:16', 2, '<figure class=\"table\"><table><tbody><tr><td>Thương hiệu</td><td>AIGO</td></tr><tr><td>Tên sản phẩm</td><td>VK350 - 350W (Màu Đen)</td></tr><tr><td>Chủng loại</td><td>Nguồn máy tính</td></tr><tr><td colspan=\"2\">Chi tiết</td></tr><tr><td>Điện áp đầu vào</td><td>220-240V</td></tr><tr><td>Công suất tối đa</td><td>350W</td></tr><tr><td>Quạt</td><td>120mm</td></tr><tr><td>Tiêu chuẩn</td><td>&nbsp;</td></tr><tr><td>Kích thước (CxRxD)</td><td>150mm x 140mm x 85mm</td></tr><tr><td>Chiều dài nguồn tối đa</td><td>150mm</td></tr><tr><td>Khối lượng</td><td>&nbsp;</td></tr><tr><td>Số lượng cable kết nối</td><td>1 x ATX 24-PIN (20+4)<br>1 x CPU 8-PIN (4+4)<br>2 x SATA (3 SATA)<br>2 x PERIPHERAL (4-PIN)</td></tr><tr><td>Loại dây cắm</td><td>Non modun</td></tr></tbody></table></figure>', '<ul><li>Công suất tối đa 350w</li><li>Phù hợp các loại cấu hình phổ thông và văn phòng</li><li>Quạt tản nhiệt 12cm tăng khả năng làm mát</li></ul>', 1),
(24, 25, 'Card màn hình Galax RTX 4070 EX Gamer Pink 12G GDDR6X 3 Fan', 'vga.jpg', 10, 2, 17590000, 17590000, '2023-11-23 12:20:16', 6, '', '<ul><li><strong>CUDA Cores</strong>: 5888</li><li><strong>Boost Clock</strong>: 2535MHz</li><li><strong>1-Click OC Clock</strong>: 2550MHz</li><li><strong>Memory</strong>: 12GB GDDR6X</li></ul>', 1),
(25, 24, 'Chuột Gaming Zadez G-151M (Đen)', 'mouse.jpg', 100, 0, 250000, 250000, '2023-11-23 16:21:03', 6, '', '<ul><li>Sản phẩm chính hãng ZADEZ</li><li>Thiết kế đối xứng hỗ trợ thuận cả 2 tay</li><li>DPI: 1200 - 3200 (có thể tuỳ chỉnh lên 7200 bằng driver)</li><li>6 phím chức năng có thể thiết lập qua phần mềm</li><li>Có tích hợp đèn LED RGB nổi bật</li><li>Độ bền lên đến 5 triệu lần nhấn</li><li>Chiều dài dây: 1.5 m</li><li>Tương thích với hệ điều hành Windows</li><li>Kích thước: 120.4 x 65.3 x 39.5 mm - Trọng lượng: 69 g</li><li>Sản phẩm bao gồm: Chuột</li><li>Thiết kế đẹp lạ, kiểu dáng đối xứng phù hợp cho người thuận cả 2 tay</li><li>Chi tiết tinh xảo, phủ màu đen mạnh mẽ, trọng lượng nhẹ 69 g, cầm tay dễ chịu, hạn chế trơn trượt khi thao tác cho mọi game thủ. Chuột có dây thích hợp nằm trên bàn làm việc, phòng chơi game của mọi cá nhân, quán game hay văn phòng.</li></ul>', 1),
(26, 23, 'Thẻ nhớ SANDISK 32GB', 'the-nho.jpg', 100, 1, 130000, 130000, '2023-11-23 16:23:55', 16, '', '<p>`<strong>Loại thẻ:</strong>Thẻ Micro SD</p><ul><li><strong>Dung lượng:</strong>32 GB</li><li><strong>Tốc độ đọc dữ liệu:</strong>80 MB/s</li><li><strong>Tốc độ ghi dữ liệu:</strong>10 MB/s</li><li><strong>Hãng:</strong>Sandisk.</li></ul>', 1),
(27, 21, 'Bàn phím cơ DareU EK98L Grey Black Dream switch', 'keyboard.jpg', 10, 1, 699000, 589999, '2023-11-23 20:31:17', 5, '<ul><li>Thương hiệu DareU</li><li>Keycap ABS Doubleshot</li><li>Số phím 98 phím</li><li>Layout 1800 Compact</li><li>Loại dây Dây USB-A</li><li>Chất liệu vỏ Nhựa</li><li>Bảo hành 24 Tháng</li><li>Switch DareU Dream</li><li>LED Rainbow</li><li>Kết nối Có dây</li><li>Màu sắc Đen/ Xám</li></ul>', '<p>Gõ code cực chill, combat game cực đã=))</p>', 1),
(28, 27, 'Loa Máy Tính LEERFEI E-1046 Loa Mini Digital Speaker', 'loa.jpg', 50, 1, 120000, 120000, '2023-11-29 20:36:43', 19, '', '<ul><li>Thiết bị âm thanh tương thích</li><li>PC &amp; Laptop</li><li>Hạn bảo hành 3 tháng</li><li>Loại bảo hành Bảo hành nhà cung cấp</li><li>Kết nối đầu vào USB, JACK 3.5</li><li>Chức năng bluetooth Không</li><li>Loa thông minh Không</li><li>Loại loa Loa máy tính</li><li>Thiết bị phân tần 2 Way</li><li>Loại ampli khác</li><li>Game chuyên dụng Không</li><li>Kiểu kết nối Có dây</li><li>Kích thước (dài x rộng x cao) 105x80x50mm</li><li>Tần số tối thiểu 20Hz</li><li>Tần số tối đa 100Hz</li><li>Công suất 5</li><li>Độ nhạy 70dB</li></ul>', 1),
(29, 16, 'Bo mạch chủ GIGABYTE H610M-H V3 (DDR4)', 'h610m_h_v3_ddr4-01_d00cab3a362e4d759823b579a68fbc1a_grande.JPG', 10, 1, 1990000, 1890000, '2023-12-02 20:54:53', 18, '<figure class=\"table\"><table><tbody><tr><td><strong>CPU</strong></td><td><p>Socket LGA1700: Hỗ trợ bộ xử lý Intel ® Core ™ i9 thế hệ thứ 12 / bộ xử lý Intel ® Core ™ i7 / bộ xử lý Intel ® Core ™ i5</p><p>Bộ nhớ đệm L3 thay đổi tùy theo CPU</p><p>(Vui lòng tham khảo \"Danh sách hỗ trợ CPU\" để biết thêm thông tin.)</p></td></tr><tr><td><strong>Chipset</strong></td><td>Intel ® H610 Express</td></tr><tr><td><strong>Bộ nhớ</strong></td><td>Hỗ trợ cho các mô-đun bộ nhớ DDR4 3200/3000/2933/2666/2400/2133 MT/s<br>2 x khe cắm DDR4 DIMM hỗ trợ bộ nhớ hệ thống lên đến 64 GB (dung lượng DIMM đơn 32 GB)<br>Kiến trúc bộ nhớ kênh đôi<br>Hỗ trợ cho các mô-đun bộ nhớ ECC Un-buffered DIMM 1Rx8/2Rx8 (hoạt động ở chế độ không phải ECC)<br>Hỗ trợ cho các mô-đun bộ nhớ non-ECC Un-buffered DIMM 1Rx8/2Rx8/1Rx16<br>Hỗ trợ cho các mô-đun bộ nhớ Extreme Memory Profile (XMP)<br>(Cấu hình CPU và bộ nhớ có thể ảnh hưởng đến các loại bộ nhớ được hỗ trợ, tốc độ dữ liệu (tốc độ) và số lượng mô-đun DRAM, vui lòng tham khảo \"Danh sách hỗ trợ bộ nhớ\" trên trang web của GIGABYTE để biết thêm thông tin.)</td></tr><tr><td><strong>Đồ họa tích hợp</strong></td><td><p>Bộ xử lý đồ họa tích hợp - Hỗ trợ đồ họa HD Intel ® :</p><p>1 x cổng D-Sub, hỗ trợ độ phân giải tối đa 1920x1200 @ 60 Hz</p><p>1 x cổng HDMI, hỗ trợ độ phân giải tối đa 4096x2160 @ 60 Hz<br>* Hỗ trợ phiên bản HDMI 2.1 và HDCP 2.3.<br>** Hỗ trợ các cổng tương thích HDMI 2.1 TMDS gốc</p><p>(Thông số kỹ thuật đồ họa có thể khác nhau tùy thuộc vào sự hỗ trợ của CPU.)</p></td></tr><tr><td><strong>Âm thanh</strong></td><td><p>Realtek ® Audio CODEC</p><p>Âm thanh độ nét cao</p><p>2/4 / 5.1 / 7.1 kênh<br>* Để định cấu hình âm thanh 7.1 kênh, bạn cần mở phần mềm âm thanh và chọn \"cài đặt nâng cao của thiết bị &gt; thiết bị phát lại để thay đổi cài đặt mặc định trước\". Vui lòng truy cập trang web của GIGABYTE để biết chi tiết về cách định cấu hình phần mềm âm thanh.</p></td></tr><tr><td><strong>LAN</strong></td><td>Intel® GbE LAN chip (1 Gbps/100 Mbps)</td></tr><tr><td><strong>Khe mở rộng</strong></td><td>CPU:<br>- 1 x khe cắm PCI Express x16, hỗ trợ PCIe 4.0 và chạy ở x16<br>Chipset:<br>- 1 x khe cắm PCI Express x1, hỗ trợ PCIe 3.0 và chạy ở x1</td></tr><tr><td><strong>Giao diện lưu trữ</strong></td><td><p>Chipset:</p><p>1 x đầu nối M.2 (Socket 3, M key, hỗ trợ <a href=\"https://gearvn.com/collections/ssd-o-cung-the-ran\">SSD</a> loại 2260/2280 PCIe 3.0 x4 / x2)</p><p>4 x đầu nối SATA 6Gb / s</p></td></tr><tr><td><strong>USB</strong></td><td><p>Chipset:</p><p>4 x cổng USB 3.2 Gen 1 (2 cổng ở mặt sau, 2 cổng có sẵn thông qua đầu cắm USB bên trong)</p><p>4 x cổng USB 2.0 / 1.1 ở mặt sau</p><p>Bộ chip + Hub USB 2.0:</p><p>4 x cổng USB 2.0 / 1.1 khả dụng thông qua các đầu cắm USB bên trong</p></td></tr><tr><td><strong>Đầu nối I / O nội bộ</strong></td><td><ul><li>1 x đầu nối nguồn chính ATX 24 chân</li><li>1 x đầu nối nguồn ATX 12V 8 chân</li><li>1 x đầu cắm quạt CPU</li><li>2 x đầu cắm quạt hệ thống</li><li>1 x đầu nối M.2 Socket 3</li><li>4 x đầu nối SATA 6Gb/s</li><li>1 x đầu cắm dải đèn LED RGB</li><li>1 x đầu cắm bảng điều khiển phía trước</li><li>1 x đầu cắm âm thanh bảng điều khiển phía trước</li><li>1 x đầu cắm loa</li><li>1 x đầu cắm USB 3.2 Gen 1</li><li>2 x đầu cắm USB 2.0/1.1</li><li>1 x đầu cắm Trusted Platform Module (Chỉ dành cho mô-đun GC-TPM2.0 SPI/GC-TPM2.0 SPI 2.0 / GC-TPM2.0 SPI V2)</li><li>1 x đầu cắm cổng nối tiếp</li><li>1 x jumper CMOS trong suốt</li><li>1 x đầu cắm chống xâm nhập khung máy</li></ul></td></tr><tr><td><strong>Kết nối mặt sau</strong></td><td><ul><li>1 x cổng bàn phím/chuột PS/2</li><li>1 x cổng D-Sub</li><li>1 x cổng HDMI</li><li>2 x cổng USB 3.2 Gen 1</li><li>4 x cổng USB 2.0/1.1</li><li>1 x cổng RJ-45</li><li>3 x giắc cắm âm thanh</li></ul></td></tr><tr><td><strong>Bộ điều khiển I / O</strong></td><td>Chip điều khiển iTE ® I / O</td></tr><tr><td><strong>Giám sát hệ thống</strong></td><td><p>Phát hiện điện áp</p><p>Phát hiện nhiệt độ</p><p>Phát hiện tốc độ quạt</p><p>Cảnh báo quá nhiệt</p><p>Cảnh báo lỗi quạt</p><p>Điều khiển tốc độ quạt</p><p>* Chức năng điều khiển tốc độ quạt có được hỗ trợ hay không sẽ tùy thuộc vào bộ làm mát bạn lắp đặt.</p></td></tr><tr><td><strong>BIOS</strong></td><td><ul><li>1 x 128 Mbit flash</li><li>Use of licensed AMI UEFI BIOS</li><li>PnP 1.0a, DMI 2.7, WfM 2.0, SM BIOS 2.7, ACPI 5.0</li></ul></td></tr><tr><td><strong>Các tính năng độc đáo</strong></td><td><p>Hỗ trợ cho APP Center<br>* Các ứng dụng có sẵn trong APP Center có thể khác nhau tùy theo kiểu bo mạch chủ. Các chức năng được hỗ trợ của từng ứng dụng cũng có thể khác nhau tùy thuộc vào thông số kỹ thuật của bo mạch chủ.</p><p>- @BIOS<br>- EasyTune<br>- Smart Backup<br>- System Information Viewer<br>Hỗ trợ cho Q-Flash</p></td></tr><tr><td><strong>Phần mềm đóng gói</strong></td><td><p>Norton ® Internet Security (phiên bản OEM)</p><p>Phần mềm quản lý băng thông LAN</p></td></tr><tr><td><strong>Hệ điều hành</strong></td><td><p>Hỗ trợ cho Windows 11 64-bit</p><p>Hỗ trợ cho Windows 10 64-bit</p></td></tr><tr><td><strong>Kích thước</strong></td><td><p>Micro ATX</p><p>23cm x 21,5cm</p></td></tr></tbody></table></figure>', '', 1),
(30, 22, 'Đầu mạng RJ45', 'RJ45.jpg', 100, 3, 5000, 5000, '2023-12-02 20:56:21', 16, '<ul><li>Hãng sản xuất: Ugreen</li><li>Model: 20331</li><li>Tính năng: Đầu bấm dây mạng RJ45</li><li>Tương thích: RJ45 cat5, cat5e</li><li>Chất liệu: Chân bấm đồng nguyên chất, mạ vàng. 24K</li><li>Vỏ nhựa trong cao cấp chống gãy, vỡ</li><li>Được sản xuất bằng chất liệu cao cấp bao gồm các chân bấm bằng đồng nguyên chất mạ vàng. 24K (lớp mạ dầy 50 micro met) và chất liệu nhựa cao cấp giúp đảm bảo khả năng dẫn truyền tín hiệu của các sợi &nbsp;cat5, cat5e.</li><li>Đầu bấm mạng RJ45 loại tốt Ugreen 20331 bao gồm 1 hộp chứa 50 hạt mạng cao cấp bên trong, tương thích với tất cả các loại cáp mạng cat5, cat5e hiện nay. Với chất liệu cao cấp, hạt mạng ugreen hạn chế tình trạng bị vỡ, gãy trong quá trình bấm dây giúp giảm thiểu tiêu hao tối đa cho các dự án và công trình.</li></ul><p><br>&nbsp;</p>', '<figure class=\"table\"><table><tbody><tr><td>Tính năng</td><td>Đầu bấm dây mạng RJ45</td></tr><tr><td>Chất liệu</td><td>Chân bấm đồng nguyên chất, mạ vàng 24KVỏ nhựa trong cao cấp chống gãy, vỡ</td></tr><tr><td>Hãng sản xuất</td><td>Ugreen</td></tr></tbody></table></figure>', 1),
(31, 2, 'KX-A2013WN-A', 'KX-A2013WN-A.png', 10, 4, 1585000, 1585000, '2023-12-02 20:59:06', 17, '<p>. Camera IP WIFI thân 2.0MP ngoài trời<br>. Cảm biến 1/2.8″ Sony SNR1s CMOS 2.0MP<br>. Độ phân giải: 1920×1080@25/30fps<br>. Chuẩn nén hình ảnh: Smart H.265+/H.265/H.264+/H.264<br>. Tầm xa hồng ngoại: 30m, hỗ trợ hồng ngoại thông minh<br>. Ống kính: 2.8mm , góc nhìn 100°<br>. Công nghệ bổ trợ hình ảnh: Chống ngược sáng DWDR, Chống nhiễu 3DNR, Chế độ ngày đêm IRC, AWB, AGC..<br>. Kết nối LAN, hỗ trợ ONVIF, wifi AP.<br>. Tích hợp mic và loa , hỗ trợ đàm thoai 2 chiều<br>. Hỗ trợ giao diện web dễ dàng quản lý<br>. Hỗ trợ thẻ nhớ lên đến 256GB<br>. Nguồn 12VDC , chất liệu vỏ nhựa + kim loại<br>. Chuẩn chống bụi nước IP67, lắp đặt ngoài trời</p>', '<p>. Camera IP WIFI thân 2.0MP ngoài trời<br>. Cảm biến 1/2.8″ Sony SNR1s CMOS 2.0MP<br>. Độ phân giải: 1920×1080@25/30fps<br>. Chuẩn nén hình ảnh: Smart H.265+/H.265/H.264+/H.264<br>. Tầm xa hồng ngoại: 30m, hỗ trợ hồng ngoại thông minh<br>. Ống kính: 2.8mm , góc nhìn 100°<br>. Công nghệ bổ trợ hình ảnh: Chống ngược sáng DWDR, Chống nhiễu 3DNR, Chế độ ngày đêm IRC, AWB, AGC..<br>. Kết nối LAN, hỗ trợ ONVIF, wifi AP.<br>. Tích hợp mic và loa , hỗ trợ đàm thoai 2 chiều<br>. Hỗ trợ giao diện web dễ dàng quản lý<br>. Hỗ trợ thẻ nhớ lên đến 256GB<br>. Nguồn 12VDC , chất liệu vỏ nhựa + kim loại<br>. Chuẩn chống bụi nước IP67, lắp đặt ngoài trời</p>', 1),
(32, 2, 'KX-C4W', 'KX-C4W.png', 10, 2, 1820000, 1820000, '2023-12-02 21:00:48', 32, '<p>• Camera wifi quay quét trong nhà dòng HOME series<br>• Độ phân giải 1/2.8″ CMOS 4MP, 25/30fps@2560×1440<br>• Chuẩn nén H265+<br>• Chế độ ngày đêm (ICR), Chống ngược sáng DWDR, chống ngược sáng(BLC), chống nhiễu (3D-DNR).<br>• Tầm xa hồng ngoại 15m<br>• Ống kính 4mm, góc nhìn 85.9° (2MP) / 4mm, góc nhìn 80.3° (4MP)<br>• Khả năng quay quét : ngang : 0° đến 325° , dọc –20° đến +100°<br>• Giao diện web và tên miền miễn phí KBVISION.TV<br>• Hỗ trợ chức năng Phát hiện con người, Hàng rào ảo, khu vực cấm (IVS)<br>• Chức năng Smart Tracking, theo dõi đối tượng xâm nhập, cảnh báo bằng âm thanh<br>• Thiết lập điểm preset, gọi điểm preset nhanh<br>• Tính năng Privacy mode, cho phép cụp ống kính và đảm bảo sự riêng tư<br>• Hỗ trợ đàm thoại hai chiều với Mic và loa tích hợp<br>• Hỗ trợ khe cắm thẻ nhớ 512GB<br>• Kết nối WIFI (2.4GHz), cổng LAN, hỗ trợ ONVIF<br>• Điện áp DC5V, cổng cắm USB-C<br>• Phần mềm sử dụng: KBVIEW PLUS</p>', '<p>• Độ phân giải 1/2.8″ CMOS 4MP, 25/30fps@2560×1440<br>• Chuẩn nén H265+<br>• Chế độ ngày đêm (ICR), Chống ngược sáng DWDR, chống ngược sáng(BLC), chống nhiễu (3D-DNR).<br>• Tầm xa hồng ngoại 15m<br>• Ống kính 4mm, góc nhìn 85.9° (2MP) / 4mm, góc nhìn 80.3° (4MP)<br>• Khả năng quay quét : ngang : 0° đến 325° , dọc –20° đến +100°<br>• Giao diện web và tên miền miễn phí KBVISION.TV<br>• Hỗ trợ chức năng Phát hiện con người, Hàng rào ảo, khu vực cấm (IVS)<br>• Chức năng Smart Tracking, theo dõi đối tượng xâm nhập, cảnh báo bằng âm thanh<br>• Thiết lập điểm preset, gọi điểm preset nhanh<br>• Tính năng Privacy mode, cho phép cụp ống kính và đảm bảo sự riêng tư<br>• Hỗ trợ đàm thoại hai chiều với Mic và loa tích hợp<br>• Hỗ trợ khe cắm thẻ nhớ 512GB<br>• Kết nối WIFI (2.4GHz), cổng LAN, hỗ trợ ONVIF<br>• Điện áp DC5V, cổng cắm USB-C<br>• Phần mềm sử dụng: KBVIEW PLUS</p>', 1),
(34, 6, 'HDD WD Blue 1TB 3.5 inch SATA III 64MB Cache 7200RPM WD10EZEX', 'hdd-wd-blue-1tb-3-5-inch-sata-iii-64mb-cache-7200rpm-wd10ezex.JPG', 10, 2, 1390000, 1230000, '2024-03-31 22:24:56', 20, '<ul><li>Dung lượng 1TB</li></ul>', '<ul><li>Chuẩn HDD: 3.5\" Inches SATA III&nbsp;</li><li>Số vòng: 7200RPM</li><li>Transfer Rate: 150&nbsp;MB/s</li><li>Bảo hành chính hãng 2&nbsp;năm 1 đổi 1&nbsp;</li></ul>', 1),
(35, 20, 'Thùng máy Xigmatek XA-20 (EN46072) (No Fan)', 'casePC.jpg', 6, 3, 270000, 270000, '2024-12-18 14:24:09', 7, '<ul><li>Kích thước: 370 x 188 x 413 mm</li><li>Hỗ trợ: 2.5 “, 3.5″ x 2 / ODD 3.5” x 1</li><li>Vật liệu: SECC phủ đen, Plastic ABS, Nhựa trong suốt</li><li>Khe mở rộng: 7 slots</li><li>Hỗ trợ Mainboard: ATX, Micro-ATX, ITX</li><li>Cổng kết nối: USB x2 – Audio in/out x 1 (HD Audio)</li><li>Hỗ trợ tản nhiệt CPU 155mm</li><li>Hỗ trợ VGA 330mm</li></ul>', '<p>Kích thước: 370 x 188 x 413 mm</p><p>Hỗ trợ: 2.5 “, 3.5″ x 2 / ODD 3.5” x 1</p><p>Vật liệu: SECC phủ đen, Plastic ABS, Nhựa trong suốt</p><p>Khe mở rộng: 7 slots</p><p>Hỗ trợ Mainboard: ATX, Micro-ATX, ITX</p><p>Cổng kết nối: USB x2 – Audio in/out x 1 (HD Audio)</p><p>Hỗ trợ tản nhiệt CPU 155mm</p><p>Hỗ trợ VGA 330mm</p>', 1),
(36, 4, 'KX-DAi2K8104H3', 'DAi2K8104H3-1536x1536.png', 10, 3, 5635000, 5635000, '2024-12-19 02:50:41', 8, '<p>. Hỗ trợ HDCVI/AHD/TVI/CVBS/IP<br>. Hỗ trợ camera HDCVI 4K (1 fps–7 fps); 6MP (1 fps–10 fps); 5MP (1 fps–12 fps); 4MP/3MP (1 fps–15 fps); 4M-N/1080p/720p/960H/D1/ CIF (1 fps–25/30 fps);<br>. AI Coding/H.265+/H.265/H.264+/H.264<br>. Hỗ trợ camera IP tối đa 8 kênh, lên đến 8Mp. Băng thông tối đa 64 Mbps<br>. Hỗ trợ 1 kênh Bảo vệ chu vi và 4 kênh SMD Plus. Playback 1/4 kênh cùng lúc<br>. Hỗ trợ 1 kênh Face recognition (chỉ hỗ trợ camera analog)<br>. Cảnh báo người lạ: phát hiện người lạ mặt (không có trong cơ sở dữ liệu của thiết bị)<br>. Hỗ trợ cổng Audio in/out đàm thoại 2 chiều hoặc ghi âm cho kênh 1</p>', '<p>. Hỗ trợ HDCVI/AHD/TVI/CVBS/IP<br>. Hỗ trợ camera HDCVI 4K (1 fps–7 fps); 6MP (1 fps–10 fps); 5MP (1 fps–12 fps); 4MP/3MP (1 fps–15 fps); 4M-N/1080p/720p/960H/D1/ CIF (1 fps–25/30 fps);<br>. AI Coding/H.265+/H.265/H.264+/H.264<br>. Hỗ trợ camera IP tối đa 8 kênh, lên đến 8Mp. Băng thông tối đa 64 Mbps<br>. Hỗ trợ 1 kênh Bảo vệ chu vi và 4 kênh SMD Plus. Playback 1/4 kênh cùng lúc<br>. Hỗ trợ 1 kênh Face recognition (chỉ hỗ trợ camera analog)<br>. Cảnh báo người lạ: phát hiện người lạ mặt (không có trong cơ sở dữ liệu của thiết bị)<br>. Hỗ trợ cổng Audio in/out đàm thoại 2 chiều hoặc ghi âm cho kênh 1</p>', 1),
(37, 2, 'KX-C2W', 'KX-C2W.png', 10, 1, 1685000, 1685000, '2025-04-03 19:38:32', 86, '<p>• Camera wifi quay quét trong nhà dòng HOME series<br>• Độ phân giải 1/2.8″ CMOS 2MP, 25/30fps@1080P<br>• Chuẩn nén H265+<br>• Chế độ ngày đêm (ICR), Chống ngược sáng DWDR, chống ngược sáng(BLC), chống nhiễu (3D-DNR).<br>• Tầm xa hồng ngoại 15m<br>• Ống kính 4mm, góc nhìn 85.9° (2MP) / 4mm, góc nhìn 80.3° (4MP)<br>• Khả năng quay quét : ngang : 0° đến 325° , dọc –20° đến +100°<br>• Giao diện web và tên miền miễn phí KBVISION.TV<br>• Hỗ trợ chức năng Phát hiện con người, Hàng rào ảo, khu vực cấm (IVS)<br>• Chức năng Smart Tracking, theo dõi đối tượng xâm nhập, cảnh báo bằng âm thanh<br>• Thiết lập điểm preset, gọi điểm preset nhanh<br>• Tính năng Privacy mode, cho phép cụp ống kính và đảm bảo sự riêng tư<br>• Hỗ trợ đàm thoại hai chiều với Mic và loa tích hợp<br>• Hỗ trợ khe cắm thẻ nhớ 512GB<br>• Kết nối WIFI (2.4GHz), cổng LAN, hỗ trợ ONVIF<br>• Điện áp DC5V, cổng cắm USB-C<br>• Phần mềm sử dụng: KBVIEW PLUS</p>', '<p>• Độ phân giải 1/2.8″ CMOS 2MP, 25/30fps@1080P<br>• Chuẩn nén H265+<br>• Chế độ ngày đêm (ICR), Chống ngược sáng DWDR, chống ngược sáng(BLC), chống nhiễu (3D-DNR).<br>• Tầm xa hồng ngoại 15m<br>• Ống kính 4mm, góc nhìn 85.9° (2MP) / 4mm, góc nhìn 80.3° (4MP)<br>• Khả năng quay quét : ngang : 0° đến 325° , dọc –20° đến +100°<br>• Giao diện web và tên miền miễn phí KBVISION.TV<br>• Hỗ trợ chức năng Phát hiện con người, Hàng rào ảo, khu vực cấm (IVS)<br>• Chức năng Smart Tracking, theo dõi đối tượng xâm nhập, cảnh báo bằng âm thanh<br>• Thiết lập điểm preset, gọi điểm preset nhanh<br>• Tính năng Privacy mode, cho phép cụp ống kính và đảm bảo sự riêng tư<br>• Hỗ trợ đàm thoại hai chiều với Mic và loa tích hợp<br>• Hỗ trợ khe cắm thẻ nhớ 512GB<br>• Kết nối WIFI (2.4GHz), cổng LAN, hỗ trợ ONVIF<br>• Điện áp DC5V, cổng cắm USB-C<br>• Phần mềm sử dụng: KBVIEW PLUS</p>', 1),
(38, 2, 'KX-A3W', 'KX-A3W.png', 10, 0, 1105000, 1105000, '2025-04-08 15:33:30', 13, '<p>• Độ phân giải 1/3.2″ CMOS 3MP, 25/30fps@2304 x 1296<br>• Chuẩn nén H265<br>• Chế độ ngày đêm (ICR), Chống ngược sáng DWDR<br>• Tầm xa hồng ngoại 10m<br>• Ống kính 3.6mm, góc nhìn 73° (3MP)<br>• Khả năng quay quét : ngang : 0° đến 355° , dọc –5° đến 80°<br>• Hỗ trợ chức năng Phát hiện con người AI, Phát hiện thú cưng, phát hiện âm thanh bất thường<br>• Chức năng Auto Tracking, theo dõi đối tượng<br>• Thiết lập điểm yêu thích (Preset Patrol)<br>• Tính năng Privacy mode, cho phép cụp ống kính và đảm bảo sự riêng tư<br>• Hỗ trợ đàm thoại hai chiều với Mic và loa tích hợp<br>• Hỗ trợ khe cắm thẻ nhớ 256GB<br>• Kết nối WIFI 6 (2.4GHz), cổng LAN, hỗ trợ ONVIF<br>• Kết nối nhanh bằng Bluetooth<br>• Điện áp DC5V<br>• Phần mềm sử dụng: KBVIEW PLUS</p>', '<p>. 1/3.2″ CMOS, 3.0 MP 25fps, H.265<br>. Hồng ngoại 10m, ống kính 3.6mm (79°)<br>. Quay quét ngang: 355°, dọc: -5°- 80°<br>. Mic và loa, đàm thoại 2 chiều, báo động còi hú<br>. Phát hiện chuyển động /con người, phát hiện âm thanh bất thường<br>. LAN, WIFI 2.4GHz, ONVIF, chế độ riêng tư<br>. Hỗ trợ thẻ nhớ max 256GB</p>', 1),
(39, 2, 'KX-A5W', 'KX-A5W.png', 10, 0, 1510000, 1510000, '2025-04-08 15:45:22', 4, '<p>• Độ phân giải 1/2.8″ CMOS 5MP, 25/30fps@2880 x 1620<br>• Chuẩn nén H265<br>• Chế độ ngày đêm (ICR), Chống ngược sáng DWDR<br>• Tầm xa hồng ngoại 10m<br>• Ống kính 3.6mm, 3.6mm, góc nhìn 74° (5MP)<br>• Khả năng quay quét : ngang : 0° đến 355° , dọc –5° đến 80°<br>• Hỗ trợ chức năng Phát hiện con người AI, Phát hiện thú cưng, phát hiện âm thanh bất thường<br>• Chức năng Auto Tracking, theo dõi đối tượng<br>• Thiết lập điểm yêu thích (Preset Patrol)<br>• Tính năng Privacy mode, cho phép cụp ống kính và đảm bảo sự riêng tư<br>• Hỗ trợ đàm thoại hai chiều với Mic và loa tích hợp<br>• Hỗ trợ khe cắm thẻ nhớ 256GB<br>• Kết nối WIFI 6 (2.4GHz), cổng LAN, hỗ trợ ONVIF<br>• Kết nối nhanh bằng Bluetooth<br>• Điện áp DC5V<br>• Phần mềm sử dụng: KBVIEW PLUS</p>', '<p>. 1/3.2″ CMOS, 5.0 MP 25fps, H.265<br>. Hồng ngoại 10m, ống kính 3.6mm (79°)<br>. Quay quét ngang: 355°, dọc: -5°- 80°<br>. Mic, loa, đàm thoại 2 chiều, báo động còi hú<br>. Phát hiện chuyển động /con người, phát hiện âm thanh bất thường<br>. LAN, WIFI 2.4GHz, ONVIF, chế độ riêng tư<br>. Hỗ trợ thẻ nhớ max 256GB<br>. DC5V, vỏ nhựa</p>', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ratings`
--

INSERT INTO `ratings` (`rating_id`, `product_id`, `rating`, `comment`, `user_id`, `comment_id`) VALUES
(1, 37, 5, 'Dữ danwf', 8, NULL),
(2, 37, 5, 'hay', 8, NULL),
(3, 37, 5, 'vcjkj', 8, NULL),
(4, 37, 5, NULL, 8, 15),
(5, 37, 5, NULL, 8, 16),
(6, 37, 5, NULL, 8, 17);

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
(17, 'khanhduy', '$2y$10$epSxFmY2Shb8WKilxQIS4eYXBpMPd6q/kKoZPT.UQ492f/go8/Dr2', 'Lê Khánh Duy', 'user-default.png', 'duy0984162403@gmail.com', '0984162403', 'Bạc Liêu', 0, 1),
(18, 'duy', '$2y$10$bLt.35GcHE.XxGwlV63/meEEleZmy1uW9cKBdNiRLWS9AAxTQjpeO', 'duy', 'user-default.png', 'duy@gmail.com', '0986546782', 'bạc liêu', 0, 1),
(19, 'TuongVi', '$2y$10$/LznOH9z3wRZOb9dFrkHeuIBAWq4TaPy3sVonLJjyJLz6UcWnz3EO', 'Huỳnh Thị Tường Vi', 'user-default.png', 'Tuongvi@gmail.com', '0704744284', 'Hòa Bình', 0, 1);

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

--
-- Đang đổ dữ liệu cho bảng `warehouse`
--

INSERT INTO `warehouse` (`id`, `name`, `price`, `quantity`, `sell`, `created_at`) VALUES
(12, 'Ổ cứng HDD 1TB', 100000, 10, 0, '2025-04-09 16:48:55');

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
-- Chỉ mục cho bảng `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `comment_id` (`comment_id`);

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
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

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
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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

--
-- Các ràng buộc cho bảng `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`comment_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
