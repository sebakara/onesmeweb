-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 27, 2022 at 12:36 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `adminId` int(11) NOT NULL,
  `adminName` varchar(255) NOT NULL,
  `adminUser` varchar(255) NOT NULL,
  `adminEmail` varchar(255) NOT NULL,
  `adminPassword` varchar(32) NOT NULL,
  `level` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`adminId`, `adminName`, `adminUser`, `adminEmail`, `adminPassword`, `level`) VALUES
(1, 'Nayem Howlader', 'nayem', 'nayemhowlader77@gmail.com', '850721dea834fe36b29083291509c7ad', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brandId` int(11) NOT NULL,
  `brandName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brandId`, `brandName`) VALUES
(2, 'Phone Docking Station'),
(3, 'CANON'),
(4, 'COVER'),
(5, 'ACER');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cartId` int(11) NOT NULL,
  `sId` varchar(255) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cart`
--

INSERT INTO `tbl_cart` (`cartId`, `sId`, `productId`, `productName`, `price`, `quantity`, `image`) VALUES
(5, 'bs8he71va3pd60o3grd9vpv19c', 18, 'Phone Case Cover For Iphone', 1891.00, 1, 'uploads/4ad5cd7ae0.jpg'),
(6, 'bs8he71va3pd60o3grd9vpv19c', 13, 'metal display tripod stand for phone', 1300.00, 2, 'uploads/2660949bc8.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `catId` int(11) NOT NULL,
  `catName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`catId`, `catName`) VALUES
(3, 'Mobile Phones'),
(4, 'Accessories'),
(9, 'cover of phones');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_compare`
--

CREATE TABLE `tbl_compare` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contact`
--

INSERT INTO `tbl_contact` (`id`, `name`, `email`, `contact`, `message`, `status`, `date`) VALUES
(2, 'md.alvi islam', 'customer@gmail.com', '1622425286', 'szzss', 1, '2018-08-05 23:23:25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `zip` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`id`, `name`, `address`, `city`, `country`, `zip`, `phone`, `email`, `pass`) VALUES
(1, 'bappy', 'khilgaon, Dhaka', 'Dhaka', 'Bangladesh', '1219', '01622425286', 'customer@gmail.com', '202cb962ac59075b964b07152d234b70'),
(2, 'maic', 'kigali', 'kigali', 'rwanda', '00250', '0786091893', 'maisebac@gmail.com', '7e9b80887ab663d0edda9fb678924ed3');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `cmrId`, `productId`, `productName`, `quantity`, `price`, `image`, `date`, `status`) VALUES
(21, 1, 15, 'Lorem Ipsum is simply', 1, 505.22, 'uploads/d712a37947.png', '2018-08-01 20:45:34', 2),
(22, 1, 14, 'Lorem Ipsum is simply', 1, 505.22, 'uploads/bb49c3ce4e.png', '2018-08-01 20:45:34', 0),
(23, 1, 15, 'Lorem Ipsum is simply', 3, 1515.66, 'uploads/d712a37947.png', '2018-08-01 21:23:42', 0),
(24, 1, 11, 'Lorem ipsum dolor sit amet sed do eiusmod', 3, 1501.65, 'uploads/4ebef5562f.png', '2018-08-02 00:14:55', 0),
(25, 1, 15, 'Lorem Ipsum is simply', 1, 505.22, 'uploads/d712a37947.png', '2018-08-02 00:15:23', 0),
(26, 1, 15, 'Lorem Ipsum is simply', 1, 505.22, 'uploads/d712a37947.png', '2018-08-02 00:19:13', 0),
(27, 1, 12, 'Lorem Ipsum is simply', 2, 856.04, 'uploads/8147397401.png', '2018-08-02 00:19:45', 0),
(28, 1, 11, 'Lorem ipsum dolor sit amet sed do eiusmod', 1, 500.55, 'uploads/4ebef5562f.png', '2018-08-02 02:39:52', 0),
(29, 1, 12, 'Lorem Ipsum is simply', 1, 428.02, 'uploads/8147397401.png', '2018-08-02 02:50:52', 0),
(30, 1, 15, 'Lorem Ipsum is simply', 1, 505.22, 'uploads/d712a37947.png', '2018-08-02 02:50:52', 0),
(31, 1, 4, 'Lorem Ipsum is simply', 1, 220.97, 'uploads/fa56e62bef.jpg', '2018-08-02 02:50:52', 0),
(32, 1, 13, 'Lorem Ipsum is simply', 1, 505.22, 'uploads/bd293afbce.jpg', '2018-08-06 03:29:05', 0),
(33, 2, 8, 'fabric elastic fabric Wallet Stick mobile phone wallet', 3, 3000.00, 'uploads/aa6518640c.jpg', '2022-07-25 09:08:14', 1),
(34, 2, 19, 'DJ Headphone Professional', 1, 25000.00, 'uploads/7e8eb1c21c.jpg', '2022-07-25 21:46:24', 1),
(35, 2, 18, 'Phone Case Cover For Iphone', 1, 1891.00, 'uploads/4ad5cd7ae0.jpg', '2022-07-25 21:46:24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `catId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `body` text NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`productId`, `productName`, `catId`, `brandId`, `body`, `price`, `image`, `type`) VALUES
(1, 'Privacy TPU Screen Protector For Galaxy Samsung 20 Ultra', 4, 3, '<p>Description: Hydrogel Matte Anti-spy TPU Film, Privacy TPU Screen Protector For Galaxy Samsung 20 Ultra. (Price:2000F) minimum order:100 pieces</p>', 999.00, 'uploads/575ec59810.jpg', 0),
(2, 'Mobile Phone Case Frosted Smoke Matte Cover For Infinix Hot 12', 9, 3, '<p>Description: Fashion Translucent Protection Shock Proof Tpu Pc Mobile Phone Case Frosted Smoke Matte Cover For Infinix Hot 12. (Price:1591F) minimum order: 2 Lot and each lot contains 50 pieces</p>', 1591.00, 'uploads/3b09d9c359.jpg', 0),
(3, 'USB flash Disk', 4, 2, '<p>Description: Pendrive 1gb 2gb 4gb 8gb 16gb 32gb 64gb. (Price: 4GB 3591F minimum order: 80 pieces; 8GB 4091F minimum order: 80 pieces; 16GB 4691F minimum order: 80 pieces; 32GB 4891F minimum order: 80 pieces; 64GB 5391F minimum order: 50 pieces.</p>', 4891.00, 'uploads/48e91c77c9.jpg', 1),
(4, 'cheap magnetic mini powerbank', 4, 3, '<p>Description: 2021 high quality wholesale micro wireless charging emergency cheap magnetic mini powerbank 20000mah with usb c cable. (Price:10691F) minimum order: 20pieces</p>', 10691.00, 'uploads/46cdf3519f.jpg', 0),
(5, ' Women Printed Phones Case For Infinix Hot 10', 9, 5, '<p>19.Description: 2022 New Arrival Candy Women Printed Phones Case For Infinix Hot 10 Play Glue Dropping For Tecno Itel Epoxy DIY Diamond Cases. (Price: 1891F) minimum order: 10 lot and each lot contains 50 pieces.</p>', 1891.00, 'uploads/30140a36d4.jpg', 0),
(6, 'soft TPU PU Mobile Phone Back Cover Leather Case For techno spark 7/itel/realme 5', 9, 5, '<p>Description: Factory Africa customized soft TPU PU Mobile Phone Back Cover Leather Case For techno spark 7/itel/realme 5. (Price: 991F) minimum order: 500 pieces</p>', 991.00, 'uploads/47a0442b10.jpg', 1),
(7, 'Bluetooth Wireless Speaker', 4, 2, '<p>Description: TG117 USB Player Waterproof BT Portable Speaker Super Quality Outdoor Wireless Speaker. (Price: 6991F) minimum order: 50 pieces</p>', 6991.00, 'uploads/cc286bda30.jpg', 0),
(8, 'fabric elastic fabric Wallet Stick mobile phone wallet', 4, 2, '<p>7.Description: High quality fabric elastic fabric Wallet Stick mobile phone wallet Credit card holder with custom logo. (Price: 1000F). Minimum order:100 pieces.</p>', 1000.00, 'uploads/aa6518640c.jpg', 0),
(11, ' wireless earphones ', 4, 3, '<p>Description: Factory original Amazon 2022 hottest sell JL TWS wireless earphones HIFI music V77 usb-c type-c charging connect stereo headset. (Price:5891F). Minimum order: 100 Pieces.</p>', 5891.00, 'uploads/5048ae398c.jpg', 1),
(13, 'metal display tripod stand for phone', 9, 4, '<p>Description: Simple creative metal display tripod stand for phone accessories. (Price:1300F). Minimum order:100 pieces</p>', 1300.00, 'uploads/2660949bc8.jpg', 1),
(16, 'iPhone X - Smartphone', 3, 4, '<p>5.8 inchi old multi touched display.Hexa-core 2.39ghz processor.</p>\r\n<p>3GB RAM And 256GB ROM</p>\r\n<p>12MP Dual Rear and 7MP front camera</p>\r\n<p>Nano Sim</p>', 120500.00, 'uploads/ac7385aa6d.jpeg', 1),
(17, 'multifunction type-c charge with ethernet to rj45 hdmi 8 port type c to usb c 8 in 1 3.0 hub adapter', 3, 4, '<p>Description: best selling multifunction type-c charge with ethernet to rj45 hdmi 8 port type c to usb c 8 in 1 3.0 hub adapter laptop docking. (Price:2091F). Minimum order: 8 lot and each lot contains 10 pieces.</p>', 2091.00, 'uploads/4a166ae75b.jpg', 1),
(18, 'Phone Case Cover For Iphone', 9, 4, '<p>Description: Good Quality Wholesale Enhanced Camera Lens Protection Soft TPU Phone Accessory Phone Case Cover For Iphone 12/13 Pro Max/Pro. (Price:1891F). Minimum order: 100 pieces</p>', 1891.00, 'uploads/4ad5cd7ae0.jpg', 1),
(19, 'DJ Headphone Professional', 4, 5, '<p>Description: Oneodio Fusion Wired and Wireless BT Headphones For Phone Mic Over Ear Studio DJ Headphone Professional Recording Headset. (Price:25000F). Minimum order: 30 pieces</p>', 25000.00, 'uploads/7e8eb1c21c.jpg', 1),
(20, '3Ft Cable headset handsfree headphones', 4, 3, '<p>Description: original earphones for lightning 3Ft Cable headset handsfree headphones audifonos for apple for iphone 12 music calling talking. (Price:2000F) minimum order: 80 sets</p>', 2000.00, 'uploads/40b5846d11.jpg', 1),
(21, 'Guitar Shape Memory Storage Usb Flash Drive', 4, 3, '<p>13.Description: Pendrive 1gb 2gb 4gb 8gb 16gb 32gb 64gb. (Price: 4GB 3591F minimum order: 80 pieces; 8GB 4091F minimum order: 80 pieces; 16GB 4691F minimum order: 80 pieces; 32GB 4891F minimum order: 80 pieces; 64GB 5391F minimum order: 50 pieces.</p>', 4891.00, 'uploads/667463a27f.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transactions`
--

CREATE TABLE `tbl_transactions` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `tx_ref` text NOT NULL,
  `transaction_id` text NOT NULL,
  `status` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_transactions`
--

INSERT INTO `tbl_transactions` (`id`, `order_id`, `tx_ref`, `transaction_id`, `status`, `created_at`) VALUES
(1, 33, 'payment_0731c1baedfce4cfbc69', '', 'PENDING', '2022-07-27 09:19:55'),
(2, 34, 'payment_0731c1baedfce4cfbc69', '', 'PENDING', '2022-07-27 09:19:55'),
(3, 35, 'payment_0731c1baedfce4cfbc69', '', 'PENDING', '2022-07-27 09:19:55'),
(4, 33, 'payment_12ac526b65f43ce5f97d', '', 'PENDING', '2022-07-27 09:24:02'),
(5, 34, 'payment_12ac526b65f43ce5f97d', '', 'PENDING', '2022-07-27 09:24:02'),
(6, 35, 'payment_12ac526b65f43ce5f97d', '', 'PENDING', '2022-07-27 09:24:02'),
(7, 33, 'payment_f09cc64d5a4c047a44b6', '', 'PENDING', '2022-07-27 09:24:26'),
(8, 34, 'payment_f09cc64d5a4c047a44b6', '', 'PENDING', '2022-07-27 09:24:26'),
(9, 35, 'payment_f09cc64d5a4c047a44b6', '', 'PENDING', '2022-07-27 09:24:26'),
(10, 33, 'payment_ac3f39b712ff1b3d0af0', '', 'PENDING', '2022-07-27 09:26:59'),
(11, 34, 'payment_ac3f39b712ff1b3d0af0', '', 'PENDING', '2022-07-27 09:26:59'),
(12, 35, 'payment_ac3f39b712ff1b3d0af0', '', 'PENDING', '2022-07-27 09:26:59'),
(13, 33, 'payment_01c1b7dadfce78f8576e', '', 'PENDING', '2022-07-27 09:28:19'),
(14, 34, 'payment_01c1b7dadfce78f8576e', '', 'PENDING', '2022-07-27 09:28:19'),
(15, 35, 'payment_01c1b7dadfce78f8576e', '', 'PENDING', '2022-07-27 09:28:19'),
(16, 33, 'payment_95389f8b3faaf62317e1', '', 'PENDING', '2022-07-27 09:45:26'),
(17, 34, 'payment_95389f8b3faaf62317e1', '', 'PENDING', '2022-07-27 09:45:26'),
(18, 35, 'payment_95389f8b3faaf62317e1', '', 'PENDING', '2022-07-27 09:45:26'),
(19, 33, 'payment_78fed019937d029b4a38', '675111748', 'successful', '2022-07-27 09:47:41'),
(20, 34, 'payment_78fed019937d029b4a38', '675111748', 'successful', '2022-07-27 09:47:41'),
(21, 35, 'payment_78fed019937d029b4a38', '675111748', 'successful', '2022-07-27 09:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wlist`
--

CREATE TABLE `tbl_wlist` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_wlist`
--

INSERT INTO `tbl_wlist` (`id`, `cmrId`, `productId`, `productName`, `price`, `image`) VALUES
(6, 1, 15, 'Laundry machine ', 3200.00, 'uploads/d712a37947.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brandId`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `tbl_transactions`
--
ALTER TABLE `tbl_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_wlist`
--
ALTER TABLE `tbl_wlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_transactions`
--
ALTER TABLE `tbl_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_wlist`
--
ALTER TABLE `tbl_wlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
