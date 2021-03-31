
CREATE TABLE `part` (
  `part_id` int(11) NOT NULL COMMENT 'รหัสส่วนประกอบ',
  `part_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อส่วนประกอบ',
  `part_type_id` int(11) NOT NULL COMMENT 'รหัสประเภทส่วนประกอบ',
  `qty` int(11) NOT NULL COMMENT 'จำนวนที่มีอยู่',
  `unit_count_id` int(11) NOT NULL COMMENT 'รหัสหน่วยนับ',
  `buy_cost` int(11) NOT NULL COMMENT 'ราคาซื้อ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `part`
--

INSERT INTO `part` (`part_id`, `part_name`, `part_type_id`, `qty`, `unit_count_id`, `buy_cost`) VALUES
(5, 'ตะปูตอกไม้ 11/2*14', 4, 445, 11, 540),
(6, 'น๊อตใหญ่', 6, 99563, 11, 100),
(7, 'ตะปูตอกไม้ 1*16', 4, -38, 11, 590),
(8, 'ตะปูตอกไม้ 21/2*12', 4, 3, 11, 490),
(9, 'ตะปูตอกไม้', 4, 1, 11, 520),
(13, 'ตะปูตอกไม้ 4*7', 4, 1, 11, 490),
(14, 'ตะปูยิงไม้ขาเดียว F-25', 4, 1, 11, 85),
(17, 'ตะปูเกลียวยิงสมาร์ทบอร์ด', 4, 1, 11, 330),
(18, 'ตะปูเกลียวยิงฝ้า (ไดร์วอลล์) 1', 4, 1, 11, 65),
(19, 'ตะปูเกลียวยิงฝ้า (ไดร์วอลล์)2', 4, 1, 11, 65),
(21, 'น๊อตขันเหล็กฉาก', 6, 197987, 11, 30);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL COMMENT 'รหัสสินค้า',
  `product_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อสินค้า',
  `cost` int(11) NOT NULL COMMENT 'ราคาขาย',
  `product_type_id` int(11) NOT NULL COMMENT 'รหัสประเภทสินค้า'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `cost`, `product_type_id`) VALUES
(12, 'ตู้เสื้อผ้า', 150, 8),
(13, 'เตียงเดี่ยว', 12000, 7),
(14, 'โซฟายาว', 10000, 9);

-- --------------------------------------------------------

--
-- Table structure for table `product_part`
--

CREATE TABLE `product_part` (
  `product_part_id` int(11) NOT NULL COMMENT 'รหัสรายละเอียดการประกอบ',
  `product_id` int(11) NOT NULL COMMENT 'รหัสสินค้า',
  `part_id` int(11) NOT NULL COMMENT 'รหัสส่วนประกอบ',
  `qty` float NOT NULL COMMENT 'จำนวนที่ใช้'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_part`
--

INSERT INTO `product_part` (`product_part_id`, `product_id`, `part_id`, `qty`) VALUES
(6, 12, 6, 7),
(7, 13, 5, 2),
(8, 13, 7, 3),
(9, 13, 6, 2),
(10, 13, 21, 5),
(12, 14, 6, 10),
(13, 14, 21, 20),
(14, 12, 21, 2);

-- --------------------------------------------------------

--
-- Table structure for table `unit_count`
--

CREATE TABLE `unit_count` (
  `unit_count_id` int(11) NOT NULL COMMENT 'รหัสหน่วยนับ',
  `unit_count_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อหน่วยนับ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `unit_count`
--

INSERT INTO `unit_count` (`unit_count_id`, `unit_count_name`) VALUES
(10, 'ตารางเมตร'),
(18, 'ผืน'),
(12, 'ม้วน'),
(21, 'รีม'),
(11, 'อัน'),
(15, 'แกลลอน');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `part`
--
ALTER TABLE `part`
  ADD PRIMARY KEY (`part_id`),
  ADD UNIQUE KEY `part_name` (`part_name`),
  ADD KEY `part_type_id` (`part_type_id`),
  ADD KEY `unit_count_id` (`unit_count_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product_name` (`product_name`),
  ADD KEY `product_type_id` (`product_type_id`);

--
-- Indexes for table `product_part`
--
ALTER TABLE `product_part`
  ADD PRIMARY KEY (`product_part_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `part_id` (`part_id`);

--
-- Indexes for table `unit_count`
--
ALTER TABLE `unit_count`
  ADD PRIMARY KEY (`unit_count_id`),
  ADD UNIQUE KEY `unit_count_name` (`unit_count_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `part`
--
ALTER TABLE `part`
  MODIFY `part_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสส่วนประกอบ', AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสสินค้า', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_part`
--
ALTER TABLE `product_part`
  MODIFY `product_part_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสรายละเอียดการประกอบ', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `unit_count`
--
ALTER TABLE `unit_count`
  MODIFY `unit_count_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสหน่วยนับ', AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `part`
--
ALTER TABLE `part`
  ADD CONSTRAINT `part_ibfk_1` FOREIGN KEY (`part_type_id`) REFERENCES `part_type` (`part_type_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `part_ibfk_2` FOREIGN KEY (`unit_count_id`) REFERENCES `unit_count` (`unit_count_id`) ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`product_type_id`) ON UPDATE CASCADE;

--
-- Constraints for table `product_part`
--
ALTER TABLE `product_part`
  ADD CONSTRAINT `product_part_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_part_ibfk_2` FOREIGN KEY (`part_id`) REFERENCES `part` (`part_id`) ON UPDATE CASCADE;
