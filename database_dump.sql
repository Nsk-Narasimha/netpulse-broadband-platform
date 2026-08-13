-- NetPulse Broadband Platform Complete Database Dump
-- Generated automatically for deployment

SET FOREIGN_KEY_CHECKS = 0;

-- Table structure for `plans`
DROP TABLE IF EXISTS `plans`;
CREATE TABLE `plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `speed` varchar(50) NOT NULL,
  `data_limit` varchar(50) NOT NULL,
  `data_limit_gb` double NOT NULL,
  `validity_days` int NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table `plans`
INSERT INTO `plans` (`id`, `name`, `speed`, `data_limit`, `data_limit_gb`, `validity_days`, `price`) VALUES
(1, 'Home Basic', '50 Mbps', '500 GB', 500.0, 30, 499.0),
(2, 'Home Plus', '100 Mbps', '1000 GB', 1000.0, 30, 799.0),
(3, 'Home Pro Unlimited', '300 Mbps', 'Unlimited', 3000.0, 30, 1299.0),
(4, 'Home Gamer Ultra', '500 Mbps', '2500 GB', 2500.0, 30, 1499.0),
(5, 'Home Starter', '10mbps', '10gb', 12.0, 20, 100.0);

-- Table structure for `customers`
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `connection_id` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text,
  `plan_id` int NOT NULL,
  `start_date` date NOT NULL,
  `due_date` date NOT NULL,
  `followed_up` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `connection_id` (`connection_id`),
  UNIQUE KEY `email` (`email`),
  KEY `plan_id` (`plan_id`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table `customers`
INSERT INTO `customers` (`id`, `name`, `connection_id`, `email`, `address`, `plan_id`, `start_date`, `due_date`, `followed_up`) VALUES
(1, 'Ravi Kumar', 'BB-1001', 'ravi.kumar@example.com', '12 Gandhi Nagar', 1, '2026-06-25', '2026-08-16', 1),
(2, 'Priya Sharma', 'BB-1002', 'priya.sharma@example.com', '45 Lake View Rd', 2, '2026-05-28', '2026-08-19', 0),
(3, 'Arjun Reddy', 'BB-1003', 'arjun.reddy@example.com', '7 MG Road', 3, '2026-07-21', '2026-08-20', 0),
(4, 'Sneha Patel', 'BB-1004', 'sneha.patel@example.com', '22 Park Street', 1, '2026-06-01', '2026-07-01', 0),
(5, 'Kiran Rao', 'BB-1005', 'kiran.rao@example.com', '9 Hill View Colony', 2, '2026-07-03', '2026-08-02', 0),
(6, 'Divya Menon', 'BB-1006', 'divya.menon@example.com', '3 Church Street', 3, '2026-06-07', '2026-07-07', 0),
(8, 'nsk', 'BB-1008', 'narasimhasaikumar.kosuri@gmail.com', 'new gajuwaka', 1, '2026-08-13', '2026-10-12', 0),
(9, 'Modal Payment Test', 'BB-1009', 'modal.test@example.com', '123 Modal Way', 1, '2026-08-13', '2026-10-12', 0),
(10, 'Vikram Verma', 'BB-9999', 'vikram.verma@example.com', '123 Test St', 1, '2026-08-13', '2026-09-12', 0),
(11, 'loki', 'BB-1010', 'loki@123gamil.com', '', 2, '2026-08-13', '2026-11-11', 0),
(12, 'narasimha', 'BB-1011', 'knsknsk10@gmail.com', 'gajuwaka,visakhapatnam', 5, '2026-08-13', '2026-09-02', 0);

-- Table structure for `users`
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table `users`
INSERT INTO `users` (`id`, `username`, `password_hash`, `role`, `display_name`, `email`, `customer_id`) VALUES
(1, 'admin', 'scrypt:32768:8:1$UTScqFVp99zsyWjQ$19fc1eb6f4687ea0e92ae3cfea3e4f0b1a38feb36f9519cff0adaa10443aec5fcd650045c5c537cd92fa8fafc90ac12001f8f6f20bebb44608094a151ac6bc26', 'admin', 'Business Admin', 'admin@netpulse.com', NULL),
(2, 'staff', 'scrypt:32768:8:1$OgCVJn7TjDu9EsP0$6e659520ff7c0b2bc418af13fd2dd049089963103f7526bbf84b980c6a05f25636e9f09fb7cee0fd1d2da013248c4f3db78ce4c9bc53f844c47e35de082eef00', 'staff', 'Support Staff', 'staff@netpulse.com', NULL),
(3, 'BB-1001', 'scrypt:32768:8:1$n4c8O1L9MlZeyTQN$6ea66420e17704813af37f34acc0d6fbca5bac6dd36ae97fb4b4b037616ce52ebbe46eb9ca8b6c6a2027b196efe225bca009790152ff24dda920b000d11d3847', 'customer', 'Ravi Kumar', 'ravi.kumar@example.com', 1),
(4, 'BB-1002', 'scrypt:32768:8:1$ztaIhEXCahZcqjwX$497d3f02e753d3f7524bf7e42b937fcd94f80b2cd1e0fdb31c408076156eb2eee3870515e22ec120bf5815d06c00d26e9144ad2adbee7ba16c4520f3133d1bc3', 'customer', 'Priya Sharma', 'priya.sharma@example.com', 2),
(5, 'BB-1003', 'scrypt:32768:8:1$WQxQ7NQZPJE9wEXH$4ccec97a7da9ecf40a03df52fb8d12e0c43b44461538660b23906224c396cb5740c9867b1518b18683c8ae2cf73f2aa0b56c7bd2d51d5f794cf5e13f9031f252', 'customer', 'Arjun Reddy', 'arjun.reddy@example.com', 3),
(6, 'BB-1004', 'scrypt:32768:8:1$eEiiy3uq7mnAGlgA$624a6fa851e433d63c62c7dad4f29715ca58f577b3ee21b204c6eeee39f252b907ad85a0b5d801cea2c85596d908a72c5c40abefebe8ef01f0b38fef7d026ca5', 'customer', 'Sneha Patel', 'sneha.patel@example.com', 4),
(7, 'BB-1005', 'scrypt:32768:8:1$S5GZhw6rbfGKWr62$d2d98551ee585b8522188fdaa8700ca6184d62917f697182c3e874f11ff6ab26543122751db2f9a0c27106da8ef439b714d11bc21d9ce9737938c7ec12ebf7b7', 'customer', 'Kiran Rao', 'kiran.rao@example.com', 5),
(8, 'BB-1006', 'scrypt:32768:8:1$O5CWvuzjv58HLS0D$afc44e7cdf5c1bb76df655fbabdd3489af8cdfd86b379e3f6f55311ba8af8d12898e52a5180e4a5305c5b5ac3e68bc50b22d77517ff21c46ce863b61efffc1dd', 'customer', 'Divya Menon', 'divya.menon@example.com', 6),
(10, 'NSKk', 'scrypt:32768:8:1$6T2rbEcjIiLcjlTi$5019154ef7086e7c93f023ec9c84ef04a65cadd806f95ed669a07510bd94117cffd7e6bc2e7feb11b97e4ebafc1d8ca16f5d79a1f639dfd1d1686186e98c8b7b', 'customer', 'nsk', 'narasimhasaikumar.kosuri@gmail.com', 8),
(11, 'modaluser1009', 'scrypt:32768:8:1$SituuYbQJl3yJNcf$ac7a0911907edd19b55247ccf83ef9c70b93ab41346b4ca37c349b863f81dc5eb0037f1d12df90b0e15afce11e0da54e2df89c7c538aa7cd07a35b7663a31eb4', 'customer', 'Modal Payment Test', 'modal.test@example.com', 9),
(12, 'vikram99', 'scrypt:32768:8:1$KeRsgXGoJcqfnkAf$dc979170b2f14dda5c7f737e1340015fb3c2b5c17897a7315880f2d2fa8eee39ae0e7cd07add762e542ea5f5420f602192743891d9dbd2f4136599e5e584461c', 'customer', 'Vikram Verma', 'vikram.verma@example.com', 10),
(13, 'loki', 'scrypt:32768:8:1$AEmmOY1nRk1FGl7F$77441d0be87f1121cbf04d303d8f60391ab11645cef15332a14fca97352bb07d11b7a219645963908fa4e1690230e3d4bf4730ce459c6c40386f29aa3f7d5302', 'customer', 'loki', 'loki@123gamil.com', 11),
(14, 'suresh_staff', 'scrypt:32768:8:1$ePFMMdtdLMklbiw4$31eec51fd40ddf3845545ae046e0e8a031c2b39e44ed46b79b929b30cc6e5a150638a1d103e19b2888446afaed745f0a7ef38d551690d76c3609a216e0d79a80', 'staff', 'Suresh Kumar Staff', 'suresh@netpulse.com', NULL),
(15, 'tyh', 'scrypt:32768:8:1$hvihOsyBmpwoSrpk$b4203f8fdc664265fe4b647eb59ef59c0d279b3c53086109c645dc07e36150a93aed3c499d55ec7efd19bfc438e8374a62021d7069ba58c64eb117fe8e824812', 'customer', 'narasimha', 'knsknsk10@gmail.com', 12);

-- Table structure for `transactions`
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `plan_id` int NOT NULL,
  `amount` double NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `plan_id` (`plan_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table `transactions`
INSERT INTO `transactions` (`id`, `customer_id`, `plan_id`, `amount`, `payment_mode`, `date`, `status`) VALUES
(1, 1, 1, 499.0, 'Net Banking', '2026-08-09', 'Success'),
(2, 1, 1, 499.0, 'Card', '2026-07-10', 'Success'),
(3, 1, 1, 499.0, 'Card', '2026-06-11', 'Success'),
(4, 1, 1, 499.0, 'UPI', '2026-05-15', 'Success'),
(5, 1, 1, 499.0, 'UPI', '2026-04-14', 'Success'),
(6, 2, 2, 799.0, 'UPI', '2026-08-10', 'Success'),
(7, 2, 2, 799.0, 'UPI', '2026-07-11', 'Failed'),
(8, 2, 2, 799.0, 'Net Banking', '2026-06-12', 'Success'),
(9, 2, 2, 799.0, 'UPI', '2026-05-15', 'Success'),
(10, 2, 2, 799.0, 'Net Banking', '2026-04-12', 'Success'),
(11, 3, 3, 1299.0, 'UPI', '2026-08-12', 'Success'),
(12, 3, 3, 1299.0, 'Card', '2026-07-10', 'Success'),
(13, 3, 3, 1299.0, 'Card', '2026-06-11', 'Success'),
(14, 3, 3, 1299.0, 'Card', '2026-05-10', 'Success'),
(15, 3, 3, 1299.0, 'Net Banking', '2026-04-13', 'Success'),
(16, 4, 1, 499.0, 'Card', '2026-08-13', 'Success'),
(17, 4, 1, 499.0, 'Net Banking', '2026-07-09', 'Success'),
(18, 4, 1, 499.0, 'UPI', '2026-06-14', 'Success'),
(19, 4, 1, 499.0, 'Net Banking', '2026-05-14', 'Success'),
(20, 4, 1, 499.0, 'Net Banking', '2026-04-11', 'Failed'),
(21, 5, 2, 799.0, 'Card', '2026-08-08', 'Success'),
(22, 5, 2, 799.0, 'Card', '2026-07-10', 'Success'),
(23, 5, 2, 799.0, 'Net Banking', '2026-06-13', 'Success'),
(24, 5, 2, 799.0, 'Net Banking', '2026-05-13', 'Success'),
(25, 5, 2, 799.0, 'Card', '2026-04-14', 'Failed'),
(26, 6, 3, 1299.0, 'Net Banking', '2026-08-13', 'Success'),
(27, 6, 3, 1299.0, 'Card', '2026-07-09', 'Success'),
(28, 6, 3, 1299.0, 'Card', '2026-06-13', 'Success'),
(29, 6, 3, 1299.0, 'UPI', '2026-05-14', 'Success'),
(30, 6, 3, 1299.0, 'Card', '2026-04-11', 'Success'),
(31, 8, 1, 499.0, 'UPI', '2026-08-13', 'Success'),
(32, 8, 1, 499.0, 'UPI', '2026-08-13', 'Success'),
(33, 9, 1, 499.0, 'UPI', '2026-08-13', 'Success'),
(34, 11, 1, 499.0, 'UPI', '2026-08-13', 'Success'),
(35, 11, 2, 799.0, 'UPI', '2026-08-13', 'Success'),
(36, 12, 5, 100.0, 'UPI', '2026-08-13', 'Success'),
(37, 12, 5, 100.0, 'Card', '2026-08-13', 'Success');

-- Table structure for `usage_logs`
DROP TABLE IF EXISTS `usage_logs`;
CREATE TABLE `usage_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `date` date NOT NULL,
  `data_consumed` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `usage_logs_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table `usage_logs`
INSERT INTO `usage_logs` (`id`, `customer_id`, `date`, `data_consumed`) VALUES
(1, 1, '2026-08-14', 71.7),
(2, 1, '2026-08-09', 71.7),
(3, 1, '2026-08-04', 71.7),
(4, 1, '2026-07-30', 71.7),
(5, 1, '2026-07-25', 71.7),
(6, 1, '2026-07-20', 71.7),
(7, 2, '2026-08-14', 148.3),
(8, 2, '2026-08-09', 148.3),
(9, 2, '2026-08-04', 148.3),
(10, 2, '2026-07-30', 148.3),
(11, 2, '2026-07-25', 148.3),
(12, 2, '2026-07-20', 148.3),
(13, 3, '2026-08-14', 241.7),
(14, 3, '2026-08-09', 241.7),
(15, 3, '2026-08-04', 241.7),
(16, 3, '2026-07-30', 241.7),
(17, 3, '2026-07-25', 241.7),
(18, 3, '2026-07-20', 241.7),
(19, 4, '2026-08-14', 51.7),
(20, 4, '2026-08-09', 51.7),
(21, 4, '2026-08-04', 51.7),
(22, 4, '2026-07-30', 51.7),
(23, 4, '2026-07-25', 51.7),
(24, 4, '2026-07-20', 51.7),
(25, 5, '2026-08-14', 35.0),
(26, 5, '2026-08-09', 35.0),
(27, 5, '2026-08-04', 35.0),
(28, 5, '2026-07-30', 35.0),
(29, 5, '2026-07-25', 35.0),
(30, 5, '2026-07-20', 35.0),
(31, 6, '2026-08-14', 96.7),
(32, 6, '2026-08-09', 96.7),
(33, 6, '2026-08-04', 96.7),
(34, 6, '2026-07-30', 96.7),
(35, 6, '2026-07-25', 96.7),
(36, 6, '2026-07-20', 96.7),
(37, 8, '2026-08-14', 74.2),
(38, 8, '2026-08-09', 74.2),
(39, 8, '2026-08-04', 74.2),
(40, 8, '2026-07-30', 74.2),
(41, 8, '2026-07-25', 74.2),
(42, 8, '2026-07-20', 74.2),
(43, 9, '2026-08-14', 46.7),
(44, 9, '2026-08-09', 46.7),
(45, 9, '2026-08-04', 46.7),
(46, 9, '2026-07-30', 46.7),
(47, 9, '2026-07-25', 46.7),
(48, 9, '2026-07-20', 46.7),
(49, 10, '2026-08-14', 14.2),
(50, 10, '2026-08-09', 14.2),
(51, 10, '2026-08-04', 14.2),
(52, 10, '2026-07-30', 14.2),
(53, 10, '2026-07-25', 14.2),
(54, 10, '2026-07-20', 14.2),
(55, 11, '2026-08-14', 186.7),
(56, 11, '2026-08-09', 186.7),
(57, 11, '2026-08-04', 186.7),
(58, 11, '2026-07-30', 186.7),
(59, 11, '2026-07-25', 186.7),
(60, 11, '2026-07-20', 186.7),
(61, 12, '2026-08-14', 1.9),
(62, 12, '2026-08-09', 1.9),
(63, 12, '2026-08-04', 1.9),
(64, 12, '2026-07-30', 1.9),
(65, 12, '2026-07-25', 1.9),
(66, 12, '2026-07-20', 1.9);

-- Table structure for `renewal_alert_logs`
DROP TABLE IF EXISTS `renewal_alert_logs`;
CREATE TABLE `renewal_alert_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `due_date` date NOT NULL,
  `alert_type` varchar(20) NOT NULL,
  `sent_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cust_due_type` (`customer_id`,`due_date`,`alert_type`),
  CONSTRAINT `renewal_alert_logs_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table `renewal_alert_logs`
INSERT INTO `renewal_alert_logs` (`id`, `customer_id`, `due_date`, `alert_type`, `sent_at`) VALUES
(1, 3, '2026-08-20', '7_day', '2026-08-13');

-- Table structure for `password_resets`
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `otp` varchar(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;
