-- --------------------------------------------------------
-- Host:                         192.168.10.10
-- Server version:               5.7.23-0ubuntu0.18.04.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for ecommerce_test
DROP DATABASE IF EXISTS `ecommerce_test`;
CREATE DATABASE IF NOT EXISTS `ecommerce_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `ecommerce_test`;

-- Dumping structure for table ecommerce_test.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.categories: ~2 rows (approximately)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 'Category 1', 'category-1', '2018-09-28 10:24:45', '2018-09-28 10:24:45'),
	(2, NULL, 1, 'Category 2', 'category-2', '2018-09-28 10:24:45', '2018-09-28 10:24:45');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.category
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name_unique` (`name`),
  UNIQUE KEY `category_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.category: ~8 rows (approximately)
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Laptops', 'laptops', '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(2, 'Desktops', 'desktops', '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(3, 'Mobile Phones', 'mobile-phones', '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(4, 'Tablets', 'tablets', '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(5, 'TVs', 'tvs', '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(6, 'Digital Cameras', 'digital-cameras', '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(7, 'Appliances', 'appliances', '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(8, 'Gaming Consoles', 'gaming-consoles', '2018-09-28 10:50:12', '2018-09-28 10:50:12');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.category_product
DROP TABLE IF EXISTS `category_product`;
CREATE TABLE IF NOT EXISTS `category_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_product_product_id_foreign` (`product_id`),
  KEY `category_product_category_id_foreign` (`category_id`),
  CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.category_product: ~87 rows (approximately)
DELETE FROM `category_product`;
/*!40000 ALTER TABLE `category_product` DISABLE KEYS */;
INSERT INTO `category_product` (`id`, `product_id`, `category_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, NULL, NULL),
	(2, 2, 1, NULL, NULL),
	(3, 3, 1, NULL, NULL),
	(4, 4, 1, NULL, NULL),
	(5, 5, 1, NULL, NULL),
	(6, 6, 1, NULL, NULL),
	(7, 7, 1, NULL, NULL),
	(8, 8, 1, NULL, NULL),
	(9, 9, 1, NULL, NULL),
	(10, 10, 1, NULL, NULL),
	(11, 11, 1, NULL, NULL),
	(12, 12, 1, NULL, NULL),
	(13, 13, 1, NULL, NULL),
	(14, 14, 1, NULL, NULL),
	(15, 15, 1, NULL, NULL),
	(16, 16, 1, NULL, NULL),
	(17, 17, 1, NULL, NULL),
	(18, 18, 1, NULL, NULL),
	(19, 19, 1, NULL, NULL),
	(20, 20, 1, NULL, NULL),
	(21, 21, 1, NULL, NULL),
	(22, 22, 1, NULL, NULL),
	(23, 23, 1, NULL, NULL),
	(24, 24, 1, NULL, NULL),
	(25, 25, 1, NULL, NULL),
	(26, 26, 1, NULL, NULL),
	(27, 27, 1, NULL, NULL),
	(28, 28, 1, NULL, NULL),
	(29, 29, 1, NULL, NULL),
	(30, 30, 1, NULL, NULL),
	(31, 1, 2, NULL, NULL),
	(32, 31, 2, NULL, NULL),
	(33, 32, 2, NULL, NULL),
	(34, 33, 2, NULL, NULL),
	(35, 34, 2, NULL, NULL),
	(36, 35, 2, NULL, NULL),
	(37, 36, 2, NULL, NULL),
	(38, 37, 2, NULL, NULL),
	(39, 38, 2, NULL, NULL),
	(40, 39, 2, NULL, NULL),
	(41, 40, 3, NULL, NULL),
	(42, 41, 3, NULL, NULL),
	(43, 42, 3, NULL, NULL),
	(44, 43, 3, NULL, NULL),
	(45, 44, 3, NULL, NULL),
	(46, 45, 3, NULL, NULL),
	(47, 46, 3, NULL, NULL),
	(48, 47, 3, NULL, NULL),
	(49, 48, 3, NULL, NULL),
	(50, 49, 4, NULL, NULL),
	(51, 50, 4, NULL, NULL),
	(52, 51, 4, NULL, NULL),
	(53, 52, 4, NULL, NULL),
	(54, 53, 4, NULL, NULL),
	(55, 54, 4, NULL, NULL),
	(56, 55, 4, NULL, NULL),
	(57, 56, 4, NULL, NULL),
	(58, 57, 4, NULL, NULL),
	(59, 58, 5, NULL, NULL),
	(60, 59, 5, NULL, NULL),
	(61, 60, 5, NULL, NULL),
	(62, 61, 5, NULL, NULL),
	(63, 62, 5, NULL, NULL),
	(64, 63, 5, NULL, NULL),
	(65, 64, 5, NULL, NULL),
	(66, 65, 5, NULL, NULL),
	(67, 66, 5, NULL, NULL),
	(68, 67, 6, NULL, NULL),
	(69, 68, 6, NULL, NULL),
	(70, 69, 6, NULL, NULL),
	(71, 70, 6, NULL, NULL),
	(72, 71, 6, NULL, NULL),
	(73, 72, 6, NULL, NULL),
	(74, 73, 6, NULL, NULL),
	(75, 74, 6, NULL, NULL),
	(76, 75, 6, NULL, NULL),
	(77, 76, 7, NULL, NULL),
	(78, 77, 7, NULL, NULL),
	(79, 78, 7, NULL, NULL),
	(80, 79, 7, NULL, NULL),
	(81, 80, 7, NULL, NULL),
	(82, 81, 7, NULL, NULL),
	(83, 82, 7, NULL, NULL),
	(84, 83, 7, NULL, NULL),
	(85, 84, 7, NULL, NULL),
	(86, 85, 8, NULL, NULL),
	(87, 86, 8, NULL, NULL);
/*!40000 ALTER TABLE `category_product` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.coupons
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) DEFAULT NULL,
  `percent_off` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.coupons: ~2 rows (approximately)
DELETE FROM `coupons`;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `percent_off`, `created_at`, `updated_at`) VALUES
	(1, 'ABC123', 'fixed', 3000, NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(2, 'DEF456', 'percent', NULL, 50, '2018-09-28 10:50:13', '2018-09-28 10:50:13');
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.data_rows
DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.data_rows: ~101 rows (approximately)
DELETE FROM `data_rows`;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
	(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
	(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '', 3),
	(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '', 4),
	(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '', 5),
	(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '', 6),
	(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 7),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '', 8),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":"0"}', 10),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
	(11, 1, 'locale', 'text', 'Locale', 0, 1, 1, 1, 1, 0, '', 12),
	(12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '', 12),
	(13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
	(14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
	(15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
	(16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
	(17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
	(18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
	(19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
	(20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
	(21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '', 5),
	(22, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, '', 9),
	(23, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
	(24, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', 2),
	(25, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{"default":1}', 3),
	(26, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 4),
	(27, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{"slugify":{"origin":"name"}}', 5),
	(28, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '', 6),
	(29, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 7),
	(30, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
	(31, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, '', 2),
	(32, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, '', 3),
	(33, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '', 4),
	(34, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, '', 5),
	(35, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '', 6),
	(36, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', 7),
	(37, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:posts,slug"}}', 8),
	(38, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, '', 9),
	(39, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, '', 10),
	(40, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}', 11),
	(41, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '', 12),
	(42, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 13),
	(43, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, '', 14),
	(44, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, '', 15),
	(45, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
	(46, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, '', 2),
	(47, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '', 3),
	(48, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, '', 4),
	(49, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '', 5),
	(50, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title"},"validation":{"rule":"unique:pages,slug"}}', 6),
	(51, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, '', 7),
	(52, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, '', 8),
	(53, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', 9),
	(54, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, '', 10),
	(55, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '', 11),
	(56, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, '', 12),
	(57, 7, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 0, NULL, 1),
	(58, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(59, 7, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, NULL, 3),
	(60, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(61, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
	(62, 8, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 0, NULL, 1),
	(63, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"max:100"}}', 2),
	(64, 8, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, NULL, 3),
	(65, 8, 'details', 'text', 'Details', 0, 1, 1, 1, 1, 1, NULL, 5),
	(66, 8, 'price', 'number', 'Price', 1, 1, 1, 1, 1, 1, NULL, 6),
	(67, 8, 'description', 'rich_text_box', 'Description', 1, 1, 1, 1, 1, 1, NULL, 7),
	(68, 8, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, '{"on":"Yes","off":"No"}', 8),
	(69, 8, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{"quality":"70%","thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', 9),
	(70, 8, 'images', 'multiple_images', 'Images', 0, 1, 1, 1, 1, 1, NULL, 10),
	(71, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 11),
	(72, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 12),
	(73, 8, 'product_belongstomany_category_relationship', 'relationship', 'category', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Category","table":"category","type":"belongsToMany","column":"id","key":"id","label":"name","pivot_table":"category_product","pivot":"1","taggable":"0"}', 4),
	(74, 9, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 0, NULL, 1),
	(75, 9, 'code', 'text', 'Code', 1, 1, 1, 1, 1, 1, NULL, 2),
	(76, 9, 'type', 'select_dropdown', 'Type', 1, 1, 1, 1, 1, 1, '{"default":"fixed","options":{"fixed":"Fixed Value","percent":"Percent Off"}}', 3),
	(77, 9, 'value', 'number', 'Value', 0, 1, 1, 1, 1, 1, '{"null":""}', 4),
	(78, 9, 'percent_off', 'number', 'Percent Off', 0, 1, 1, 1, 1, 1, '{"null":""}', 5),
	(79, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 6),
	(80, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(81, 11, 'id', 'hidden', 'Id', 1, 1, 1, 0, 0, 0, '{}', 1),
	(82, 11, 'user_id', 'number', 'User Id', 0, 1, 1, 0, 0, 0, '{}', 2),
	(83, 11, 'billing_email', 'text', 'Email', 0, 1, 1, 1, 1, 0, '{}', 3),
	(84, 11, 'billing_name', 'text', 'Name', 0, 1, 1, 1, 1, 0, '{}', 4),
	(85, 11, 'billing_address', 'text', 'Address', 0, 1, 1, 1, 1, 0, '{}', 5),
	(86, 11, 'billing_city', 'text', 'City', 0, 1, 1, 1, 1, 0, '{}', 6),
	(87, 11, 'billing_province', 'text', 'Province', 0, 0, 0, 0, 0, 0, '{}', 7),
	(88, 11, 'billing_postalcode', 'text', 'Postalcode', 0, 0, 1, 1, 1, 0, '{}', 8),
	(89, 11, 'billing_phone', 'text', 'Phone', 0, 0, 1, 1, 1, 0, '{}', 9),
	(90, 11, 'billing_name_on_card', 'text', 'Name On Card', 0, 1, 1, 1, 1, 0, '{}', 10),
	(91, 11, 'billing_discount', 'number', 'Discount', 1, 1, 1, 0, 0, 0, '{}', 11),
	(92, 11, 'billing_discount_code', 'text', 'Discount Code', 0, 1, 1, 0, 0, 0, '{}', 12),
	(93, 11, 'billing_subtotal', 'number', 'Subtotal', 1, 1, 1, 0, 0, 0, '{}', 14),
	(94, 11, 'billing_tax', 'number', 'Tax', 1, 1, 1, 0, 0, 0, '{}', 15),
	(95, 11, 'billing_total', 'number', 'Total', 1, 1, 1, 0, 0, 0, '{}', 16),
	(96, 11, 'payment_gateway', 'text', 'Payment Gateway', 1, 0, 1, 0, 0, 0, '{}', 17),
	(97, 11, 'shipped', 'checkbox', 'Shipped', 1, 1, 1, 1, 0, 0, '{"on":"Yes","off":"No"}', 18),
	(98, 11, 'error', 'text', 'Error', 0, 1, 1, 0, 0, 0, '{}', 19),
	(99, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 20),
	(100, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 21),
	(101, 11, 'order_belongstomany_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Product","table":"products","type":"belongsToMany","column":"id","key":"id","label":"name","pivot_table":"order_product","pivot":"1","taggable":"on"}', 13);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.data_types
DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.data_types: ~11 rows (approximately)
DELETE FROM `data_types`;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', 1, 0, NULL, '2018-09-28 10:24:42', '2018-09-28 10:24:42'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2018-09-28 10:24:45', '2018-09-28 10:24:45'),
	(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(7, 'category', 'category', 'Category', 'Categories', 'voyager-categories', 'App\\Models\\Category', NULL, NULL, NULL, 1, 1, '{"order_column":null,"order_display_column":null}', '2018-09-28 10:36:22', '2018-09-28 10:36:22'),
	(8, 'products', 'products', 'Product', 'Products', 'voyager-bag', 'App\\Models\\Product', NULL, NULL, NULL, 1, 1, '{"order_column":null,"order_display_column":null}', '2018-09-28 10:43:19', '2018-09-28 10:43:19'),
	(9, 'coupons', 'coupons', 'Coupon', 'Coupons', 'voyager-dollar', 'App\\Models\\Coupon', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null}', '2018-09-28 10:46:45', '2018-09-28 10:46:45'),
	(11, 'orders', 'orders', 'Order', 'Orders', 'voyager-documentation', 'App\\Models\\Order', NULL, NULL, NULL, 1, 1, '{"order_column":null,"order_display_column":null}', '2018-11-11 10:28:11', '2018-11-11 10:38:50');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.menus
DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.menus: ~2 rows (approximately)
DELETE FROM `menus`;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(2, 'main', '2018-09-28 10:47:56', '2018-09-28 10:48:09');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.menu_items
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.menu_items: ~21 rows (approximately)
DELETE FROM `menu_items`;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2018-09-28 10:24:43', '2018-09-28 10:24:43', 'voyager.dashboard', NULL),
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 8, '2018-09-28 10:24:43', '2018-11-11 10:28:40', 'voyager.media.index', NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 7, '2018-09-28 10:24:43', '2018-11-11 10:28:40', 'voyager.users.index', NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 6, '2018-09-28 10:24:43', '2018-11-11 10:28:40', 'voyager.roles.index', NULL),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 12, '2018-09-28 10:24:43', '2018-11-11 10:28:40', NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2018-09-28 10:24:43', '2018-09-28 10:47:24', 'voyager.menus.index', NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2018-09-28 10:24:43', '2018-09-28 10:47:24', 'voyager.database.index', NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2018-09-28 10:24:43', '2018-09-28 10:47:24', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2018-09-28 10:24:43', '2018-09-28 10:47:24', 'voyager.bread.index', NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 13, '2018-09-28 10:24:43', '2018-11-11 10:28:40', 'voyager.settings.index', NULL),
	(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 11, '2018-09-28 10:24:45', '2018-11-11 10:28:40', 'voyager.categories.index', NULL),
	(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 9, '2018-09-28 10:24:46', '2018-11-11 10:28:40', 'voyager.posts.index', NULL),
	(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 10, '2018-09-28 10:24:46', '2018-11-11 10:28:40', 'voyager.pages.index', NULL),
	(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2018-09-28 10:24:46', '2018-09-28 10:47:24', 'voyager.hooks', NULL),
	(15, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 3, '2018-09-28 10:36:23', '2018-11-11 10:28:39', 'voyager.category.index', NULL),
	(16, 1, 'Products', '', '_self', 'voyager-bag', NULL, NULL, 4, '2018-09-28 10:43:20', '2018-11-11 10:28:40', 'voyager.products.index', NULL),
	(17, 1, 'Coupons', '', '_self', 'voyager-dollar', NULL, NULL, 5, '2018-09-28 10:46:45', '2018-11-11 10:28:40', 'voyager.coupons.index', NULL),
	(18, 2, 'Shop', '', '_self', NULL, '#000000', NULL, 13, '2018-09-28 10:48:34', '2018-09-28 10:48:34', 'shop.index', NULL),
	(19, 2, 'About', '#', '_self', NULL, '#000000', NULL, 14, '2018-09-28 10:48:46', '2018-09-28 10:48:46', NULL, ''),
	(20, 2, 'Blog', '#', '_self', NULL, '#000000', NULL, 15, '2018-09-28 10:48:58', '2018-09-28 10:48:58', NULL, ''),
	(21, 1, 'Orders', '', '_self', 'voyager-documentation', NULL, NULL, 2, '2018-11-11 10:28:11', '2018-11-11 10:28:39', 'voyager.orders.index', NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.migrations: ~30 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_01_01_000000_add_voyager_user_fields', 1),
	(4, '2016_01_01_000000_create_data_types_table', 1),
	(5, '2016_05_19_173453_create_menu_table', 1),
	(6, '2016_10_21_190000_create_roles_table', 1),
	(7, '2016_10_21_190000_create_settings_table', 1),
	(8, '2016_11_30_135954_create_permission_table', 1),
	(9, '2016_11_30_141208_create_permission_role_table', 1),
	(10, '2016_12_26_201236_data_types__add__server_side', 1),
	(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
	(12, '2017_01_14_005015_create_translations_table', 1),
	(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
	(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
	(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
	(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
	(17, '2017_08_05_000000_add_group_to_settings_table', 1),
	(18, '2017_11_26_013050_add_user_role_relationship', 1),
	(19, '2017_11_26_015000_create_user_roles_table', 1),
	(20, '2018_03_11_000000_add_user_settings', 1),
	(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
	(22, '2018_03_16_000000_make_settings_value_nullable', 1),
	(23, '2018_09_03_174356_create_products_table', 1),
	(24, '2018_09_03_174731_create_category_table', 1),
	(25, '2018_09_19_140617_create_category_product_table', 1),
	(26, '2018_09_21_230208_create_coupons_table', 1),
	(27, '2016_01_01_000000_create_pages_table', 2),
	(28, '2016_01_01_000000_create_posts_table', 2),
	(29, '2016_02_15_204651_create_categories_table', 2),
	(30, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
	(31, '2018_11_10_115739_create_orders_table', 3),
	(32, '2018_11_10_121757_create_order_product_table', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `billing_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_province` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_postalcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name_on_card` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_discount` int(11) NOT NULL DEFAULT '0',
  `billing_discount_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_subtotal` int(11) NOT NULL,
  `billing_tax` int(11) NOT NULL,
  `billing_total` int(11) NOT NULL,
  `payment_gateway` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stripe',
  `shipped` tinyint(1) NOT NULL DEFAULT '0',
  `error` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.orders: ~5 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `user_id`, `billing_email`, `billing_name`, `billing_address`, `billing_city`, `billing_province`, `billing_postalcode`, `billing_phone`, `billing_name_on_card`, `billing_discount`, `billing_discount_code`, `billing_subtotal`, `billing_tax`, `billing_total`, `payment_gateway`, `shipped`, `error`, `created_at`, `updated_at`) VALUES
	(1, 2, 'rehansyed89@gmail.com', 'Rehan Syed  MAZHAR', '103, Avenue victor hugo', 'Aubervilliers', 'ile-de-france', '93300', '758726157', 'Rehan Syed  MAZHAR', 3000, NULL, 297150, 59430, 356580, 'stripe', 0, NULL, '2018-11-11 10:00:09', '2018-11-11 10:00:09'),
	(2, NULL, 'test@gmail.com', 'Rehan Syed  MAZHAR', '103, Avenue victor hugo', 'Aubervilliers', 'ile-de-france', '93300', '758726157', 'TEST', 42820, NULL, 42819, 8564, 51383, 'stripe', 0, NULL, '2018-11-11 10:06:09', '2018-11-11 10:06:09'),
	(3, NULL, 'test@test.com', 'Rehan Syed  MAZHAR', '103, Avenue victor hugo', 'Aubervilliers', 'ile-de-france', '93300', '758726157', 'Rehan Syed  MAZHAR', 3000, 'ABC123', 137917, 27583, 165500, 'stripe', 0, NULL, '2018-11-11 10:13:09', '2018-11-11 10:13:09'),
	(4, NULL, 'test@y.com', 'Rehan Syed  MAZHAR', '103, Avenue victor hugo', 'Aubervilliers', 'Islamabad Capital Territory', '93300', '758726157', 'Rehan Syed  MAZHAR', 65056, 'DEF456', 65055, 13011, 78066, 'stripe', 0, NULL, '2018-11-11 10:14:53', '2018-11-11 10:14:53'),
	(5, 2, 'rehansyed89@gmail.com', 'Rehan Syed  MAZHAR', '68 Rue des Cévennes, Decasoft', 'Paris', 'ile-de-france', '75015', '758726157', 'Rehan Syed  MAZHAR', 25000, 'DEF456', 25000, 5000, 30000, 'stripe', 0, 'Your card has expired.', '2018-11-11 10:16:38', '2018-11-11 10:16:38');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.order_product
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE IF NOT EXISTS `order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product_order_id_foreign` (`order_id`),
  KEY `order_product_product_id_foreign` (`product_id`),
  CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.order_product: ~6 rows (approximately)
DELETE FROM `order_product`;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, '2018-11-11 10:00:09', '2018-11-11 10:00:09'),
	(2, 1, 72, 1, '2018-11-11 10:00:09', '2018-11-11 10:00:09'),
	(3, 2, 76, 1, '2018-11-11 10:06:09', '2018-11-11 10:06:09'),
	(4, 3, 82, 1, '2018-11-11 10:13:09', '2018-11-11 10:13:09'),
	(5, 4, 67, 1, '2018-11-11 10:14:53', '2018-11-11 10:14:53'),
	(6, 5, 85, 1, '2018-11-11 10:16:38', '2018-11-11 10:16:38');
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.pages
DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.pages: ~0 rows (approximately)
DELETE FROM `pages`;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
	(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2018-09-28 10:24:46', '2018-09-28 10:24:46');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
	('rehansyed89@gmail.com', '$2y$10$codRy9jm1AINfyb8LR0S1uqLXoKhJqSe4vcPB9cM9EnbXQ5uKtNmy', '2018-09-30 18:49:59');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.permissions: ~61 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(2, 'browse_bread', NULL, '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(3, 'browse_database', NULL, '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(4, 'browse_media', NULL, '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(5, 'browse_compass', NULL, '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(6, 'browse_menus', 'menus', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(7, 'read_menus', 'menus', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(8, 'edit_menus', 'menus', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(9, 'add_menus', 'menus', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(10, 'delete_menus', 'menus', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(11, 'browse_roles', 'roles', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(12, 'read_roles', 'roles', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(13, 'edit_roles', 'roles', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(14, 'add_roles', 'roles', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(15, 'delete_roles', 'roles', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(16, 'browse_users', 'users', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(17, 'read_users', 'users', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(18, 'edit_users', 'users', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(19, 'add_users', 'users', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(20, 'delete_users', 'users', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(21, 'browse_settings', 'settings', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(22, 'read_settings', 'settings', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(23, 'edit_settings', 'settings', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(24, 'add_settings', 'settings', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(25, 'delete_settings', 'settings', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(26, 'browse_categories', 'categories', '2018-09-28 10:24:45', '2018-09-28 10:24:45'),
	(27, 'read_categories', 'categories', '2018-09-28 10:24:45', '2018-09-28 10:24:45'),
	(28, 'edit_categories', 'categories', '2018-09-28 10:24:45', '2018-09-28 10:24:45'),
	(29, 'add_categories', 'categories', '2018-09-28 10:24:45', '2018-09-28 10:24:45'),
	(30, 'delete_categories', 'categories', '2018-09-28 10:24:45', '2018-09-28 10:24:45'),
	(31, 'browse_posts', 'posts', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(32, 'read_posts', 'posts', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(33, 'edit_posts', 'posts', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(34, 'add_posts', 'posts', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(35, 'delete_posts', 'posts', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(36, 'browse_pages', 'pages', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(37, 'read_pages', 'pages', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(38, 'edit_pages', 'pages', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(39, 'add_pages', 'pages', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(40, 'delete_pages', 'pages', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(41, 'browse_hooks', NULL, '2018-09-28 10:24:47', '2018-09-28 10:24:47'),
	(42, 'browse_category', 'category', '2018-09-28 10:36:23', '2018-09-28 10:36:23'),
	(43, 'read_category', 'category', '2018-09-28 10:36:23', '2018-09-28 10:36:23'),
	(44, 'edit_category', 'category', '2018-09-28 10:36:23', '2018-09-28 10:36:23'),
	(45, 'add_category', 'category', '2018-09-28 10:36:23', '2018-09-28 10:36:23'),
	(46, 'delete_category', 'category', '2018-09-28 10:36:23', '2018-09-28 10:36:23'),
	(47, 'browse_products', 'products', '2018-09-28 10:43:19', '2018-09-28 10:43:19'),
	(48, 'read_products', 'products', '2018-09-28 10:43:19', '2018-09-28 10:43:19'),
	(49, 'edit_products', 'products', '2018-09-28 10:43:19', '2018-09-28 10:43:19'),
	(50, 'add_products', 'products', '2018-09-28 10:43:20', '2018-09-28 10:43:20'),
	(51, 'delete_products', 'products', '2018-09-28 10:43:20', '2018-09-28 10:43:20'),
	(52, 'browse_coupons', 'coupons', '2018-09-28 10:46:45', '2018-09-28 10:46:45'),
	(53, 'read_coupons', 'coupons', '2018-09-28 10:46:45', '2018-09-28 10:46:45'),
	(54, 'edit_coupons', 'coupons', '2018-09-28 10:46:45', '2018-09-28 10:46:45'),
	(55, 'add_coupons', 'coupons', '2018-09-28 10:46:45', '2018-09-28 10:46:45'),
	(56, 'delete_coupons', 'coupons', '2018-09-28 10:46:45', '2018-09-28 10:46:45'),
	(57, 'browse_orders', 'orders', '2018-11-11 10:28:11', '2018-11-11 10:28:11'),
	(58, 'read_orders', 'orders', '2018-11-11 10:28:11', '2018-11-11 10:28:11'),
	(59, 'edit_orders', 'orders', '2018-11-11 10:28:11', '2018-11-11 10:28:11'),
	(60, 'add_orders', 'orders', '2018-11-11 10:28:11', '2018-11-11 10:28:11'),
	(61, 'delete_orders', 'orders', '2018-11-11 10:28:11', '2018-11-11 10:28:11');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.permission_role
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.permission_role: ~60 rows (approximately)
DELETE FROM `permission_role`;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 1),
	(31, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(35, 1),
	(36, 1),
	(37, 1),
	(38, 1),
	(39, 1),
	(40, 1),
	(42, 1),
	(43, 1),
	(44, 1),
	(45, 1),
	(46, 1),
	(47, 1),
	(48, 1),
	(49, 1),
	(50, 1),
	(51, 1),
	(52, 1),
	(53, 1),
	(54, 1),
	(55, 1),
	(56, 1),
	(57, 1),
	(58, 1),
	(59, 1),
	(60, 1),
	(61, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.posts
DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.posts: ~4 rows (approximately)
DELETE FROM `posts`;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
	(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-09-28 10:24:46', '2018-09-28 10:24:46');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_name_unique` (`name`),
  UNIQUE KEY `products_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.products: ~86 rows (approximately)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `slug`, `details`, `price`, `description`, `featured`, `image`, `images`, `created_at`, `updated_at`) VALUES
	(1, 'Laptop 1', 'laptop-1', '15 inch, 1 TB SSD, 32GB RAM', 214312, '<p>Lorem 1 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!</p>', 1, 'products/November2018/Liy1t2cTc0ZZBB1pMzJC.jpg', '["products\\/September2018\\/bizUcCJrB6jhJItv0OQa.jpg","products\\/September2018\\/qmcvURHDQ7DIohvGjzrS.jpg","products\\/September2018\\/6sEypgV0SZ2wqBXOvB7q.jpg","products\\/September2018\\/dGcMOYnVhwSvP62vUhiL.jpg","products\\/November2018\\/gaKmmxgxwLeGB9EWSili.jpg"]', '2018-09-28 10:50:12', '2018-11-02 16:00:17'),
	(2, 'Laptop 2', 'laptop-2', '15 inch, 1 TB SSD, 32GB RAM', 176400, '<p>Lorem 2 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!</p>', 1, 'products/September2018/3xSIHz4IoWU3rmed78Op.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 11:14:05'),
	(3, 'Laptop 3', 'laptop-3', '13 inch, 1 TB SSD, 32GB RAM', 182880, '<p>Lorem 3 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!</p>', 1, 'products/September2018/qYwYjoHh6CTCAMWjWxfu.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 11:17:46'),
	(4, 'Laptop 4', 'laptop-4', '14 inch, 1 TB SSD, 32GB RAM', 165398, '<p>Lorem 4 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!</p>', 1, 'products/September2018/rwvh1Z6DyyRYKSIMWVWo.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 11:18:02'),
	(5, 'Laptop 5', 'laptop-5', '13 inch, 1 TB SSD, 32GB RAM', 150586, 'Lorem 5 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-5.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(6, 'Laptop 6', 'laptop-6', '13 inch, 3 TB SSD, 32GB RAM', 249454, 'Lorem 6 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-6.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(7, 'Laptop 7', 'laptop-7', '15 inch, 2 TB SSD, 32GB RAM', 241670, '<p>Lorem 7 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!</p>', 0, 'products/September2018/nrBKuWkkygF6L66wtGom.jpg', NULL, '2018-09-28 10:50:12', '2018-09-30 13:41:05'),
	(8, 'Laptop 8', 'laptop-8', '15 inch, 2 TB SSD, 32GB RAM', 196081, 'Lorem 8 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-8.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(9, 'Laptop 9', 'laptop-9', '13 inch, 2 TB SSD, 32GB RAM', 163637, 'Lorem 9 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-9.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(10, 'Laptop 10', 'laptop-10', '15 inch, 3 TB SSD, 32GB RAM', 174448, 'Lorem 10 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-10.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(11, 'Laptop 11', 'laptop-11', '15 inch, 1 TB SSD, 32GB RAM', 215441, 'Lorem 11 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-11.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(12, 'Laptop 12', 'laptop-12', '13 inch, 3 TB SSD, 32GB RAM', 181967, 'Lorem 12 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-12.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(13, 'Laptop 13', 'laptop-13', '15 inch, 3 TB SSD, 32GB RAM', 159546, 'Lorem 13 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-13.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(14, 'Laptop 14', 'laptop-14', '15 inch, 3 TB SSD, 32GB RAM', 210391, 'Lorem 14 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-14.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(15, 'Laptop 15', 'laptop-15', '14 inch, 3 TB SSD, 32GB RAM', 205026, 'Lorem 15 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-15.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(16, 'Laptop 16', 'laptop-16', '14 inch, 3 TB SSD, 32GB RAM', 213475, 'Lorem 16 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-16.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(17, 'Laptop 17', 'laptop-17', '13 inch, 3 TB SSD, 32GB RAM', 190800, 'Lorem 17 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-17.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(18, 'Laptop 18', 'laptop-18', '15 inch, 3 TB SSD, 32GB RAM', 229966, 'Lorem 18 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-18.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(19, 'Laptop 19', 'laptop-19', '14 inch, 1 TB SSD, 32GB RAM', 156483, 'Lorem 19 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-19.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(20, 'Laptop 20', 'laptop-20', '15 inch, 2 TB SSD, 32GB RAM', 174460, 'Lorem 20 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-20.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(21, 'Laptop 21', 'laptop-21', '14 inch, 2 TB SSD, 32GB RAM', 223842, 'Lorem 21 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-21.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(22, 'Laptop 22', 'laptop-22', '13 inch, 3 TB SSD, 32GB RAM', 171758, 'Lorem 22 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-22.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(23, 'Laptop 23', 'laptop-23', '14 inch, 3 TB SSD, 32GB RAM', 172386, 'Lorem 23 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-23.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(24, 'Laptop 24', 'laptop-24', '13 inch, 1 TB SSD, 32GB RAM', 156593, 'Lorem 24 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-24.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(25, 'Laptop 25', 'laptop-25', '14 inch, 3 TB SSD, 32GB RAM', 183111, 'Lorem 25 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-25.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(26, 'Laptop 26', 'laptop-26', '13 inch, 3 TB SSD, 32GB RAM', 202852, 'Lorem 26 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-26.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(27, 'Laptop 27', 'laptop-27', '13 inch, 1 TB SSD, 32GB RAM', 176055, 'Lorem 27 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-27.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(28, 'Laptop 28', 'laptop-28', '15 inch, 3 TB SSD, 32GB RAM', 247878, 'Lorem 28 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-28.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(29, 'Laptop 29', 'laptop-29', '14 inch, 3 TB SSD, 32GB RAM', 237051, 'Lorem 29 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-29.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(30, 'Laptop 30', 'laptop-30', '13 inch, 3 TB SSD, 32GB RAM', 204572, 'Lorem 30 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/laptop-30.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(31, 'Desktop 1', 'desktop-1', '13 inch, 1 TB SSD, 32GB RAM', 163869, 'Lorem 1 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/desktop-1.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(32, 'Desktop 2', 'desktop-2', '13 inch, 1 TB SSD, 32GB RAM', 211259, 'Lorem 2 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/desktop-2.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(33, 'Desktop 3', 'desktop-3', '13 inch, 3 TB SSD, 32GB RAM', 212209, 'Lorem 3 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/desktop-3.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(34, 'Desktop 4', 'desktop-4', '15 inch, 2 TB SSD, 32GB RAM', 249077, 'Lorem 4 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/desktop-4.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(35, 'Desktop 5', 'desktop-5', '15 inch, 2 TB SSD, 32GB RAM', 202330, 'Lorem 5 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/desktop-5.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(36, 'Desktop 6', 'desktop-6', '13 inch, 1 TB SSD, 32GB RAM', 219548, 'Lorem 6 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/desktop-6.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(37, 'Desktop 7', 'desktop-7', '13 inch, 1 TB SSD, 32GB RAM', 241147, 'Lorem 7 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/desktop-7.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(38, 'Desktop 8', 'desktop-8', '15 inch, 1 TB SSD, 32GB RAM', 166309, 'Lorem 8 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/desktop-8.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(39, 'Desktop 9', 'desktop-9', '15 inch, 2 TB SSD, 32GB RAM', 173351, 'Lorem 9 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/desktop-9.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(40, 'Phone 1', 'phone-1', '16GB, 5.8 inch screen, 4GHz Quad Core', 139505, 'Lorem 1 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/phone-1.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(41, 'Phone 2', 'phone-2', '16GB, 5.7 inch screen, 4GHz Quad Core', 122094, 'Lorem 2 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/phone-2.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(42, 'Phone 3', 'phone-3', '64GB, 5.8 inch screen, 4GHz Quad Core', 118320, 'Lorem 3 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/phone-3.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(43, 'Phone 4', 'phone-4', '32GB, 5.8 inch screen, 4GHz Quad Core', 94125, 'Lorem 4 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/phone-4.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(44, 'Phone 5', 'phone-5', '64GB, 5.8 inch screen, 4GHz Quad Core', 131371, 'Lorem 5 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/phone-5.jpg', NULL, '2018-09-28 10:50:12', '2018-09-28 10:50:12'),
	(45, 'Phone 6', 'phone-6', '16GB, 5.8 inch screen, 4GHz Quad Core', 86677, '<p>Lorem 6 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!</p>', 1, 'products/September2018/QrGPyiyJCn6bIwZpvtfG.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 11:14:29'),
	(46, 'Phone 7', 'phone-7', '64GB, 5.8 inch screen, 4GHz Quad Core', 103574, 'Lorem 7 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/phone-7.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(47, 'Phone 8', 'phone-8', '64GB, 5.9 inch screen, 4GHz Quad Core', 116909, 'Lorem 8 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/phone-8.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(48, 'Phone 9', 'phone-9', '64GB, 5.7 inch screen, 4GHz Quad Core', 89884, 'Lorem 9 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/phone-9.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(49, 'Tablet 1', 'tablet-1', '16GB, 5.11 inch screen, 4GHz Quad Core', 58915, 'Lorem 1 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/tablet-1.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(50, 'Tablet 2', 'tablet-2', '16GB, 5.12 inch screen, 4GHz Quad Core', 87635, 'Lorem 2 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/tablet-2.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(51, 'Tablet 3', 'tablet-3', '32GB, 5.10 inch screen, 4GHz Quad Core', 90629, '<p>Lorem 3 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!</p>', 1, 'products/September2018/U7BvCgEmwHyzMo28rPQg.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 11:14:51'),
	(52, 'Tablet 4', 'tablet-4', '16GB, 5.10 inch screen, 4GHz Quad Core', 69020, 'Lorem 4 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/tablet-4.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(53, 'Tablet 5', 'tablet-5', '32GB, 5.11 inch screen, 4GHz Quad Core', 121683, 'Lorem 5 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/tablet-5.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(54, 'Tablet 6', 'tablet-6', '32GB, 5.12 inch screen, 4GHz Quad Core', 92125, 'Lorem 6 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/tablet-6.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(55, 'Tablet 7', 'tablet-7', '32GB, 5.12 inch screen, 4GHz Quad Core', 57991, 'Lorem 7 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/tablet-7.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(56, 'Tablet 8', 'tablet-8', '16GB, 5.12 inch screen, 4GHz Quad Core', 145639, 'Lorem 8 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/tablet-8.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(57, 'Tablet 9', 'tablet-9', '16GB, 5.12 inch screen, 4GHz Quad Core', 107532, 'Lorem 9 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/tablet-9.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(58, 'TV 1', 'tv-1', '50 inch screen, Smart TV, 4K', 124343, '<p>Lorem 1 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!</p>', 1, 'products/September2018/fyxRWjsAbONC6h9xX9mR.jpg', '["products\\/September2018\\/0mdU2PDT5d9yOy7yKCKE.jpg","products\\/September2018\\/fPaa90WXXLaFINu5T6By.jpg","products\\/September2018\\/va5tI1X3vcLmuhzqkWwz.jpg","products\\/September2018\\/p3f1p1O1iSSjYRvryyP1.jpg","products\\/September2018\\/HjVJPcX118zSDJWUpEWH.jpg"]', '2018-09-28 10:50:13', '2018-09-30 18:29:56'),
	(59, 'TV 2', 'tv-2', '60 inch screen, Smart TV, 4K', 146315, 'Lorem 2 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/tv-2.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(60, 'TV 3', 'tv-3', '60 inch screen, Smart TV, 4K', 133731, 'Lorem 3 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/tv-3.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(61, 'TV 4', 'tv-4', '46 inch screen, Smart TV, 4K', 88748, 'Lorem 4 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/tv-4.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(62, 'TV 5', 'tv-5', '46 inch screen, Smart TV, 4K', 89026, 'Lorem 5 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/tv-5.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(63, 'TV 6', 'tv-6', '46 inch screen, Smart TV, 4K', 141876, 'Lorem 6 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/tv-6.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(64, 'TV 7', 'tv-7', '50 inch screen, Smart TV, 4K', 107165, 'Lorem 7 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/tv-7.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(65, 'TV 8', 'tv-8', '60 inch screen, Smart TV, 4K', 112547, 'Lorem 8 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/tv-8.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(66, 'TV 9', 'tv-9', '60 inch screen, Smart TV, 4K', 125541, 'Lorem 9 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/tv-9.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(67, 'Camera 1', 'camera-1', 'Full Frame DSLR, with 18-55mm kit lens.', 130111, '<p>Lorem 1 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!</p>', 1, 'products/September2018/VanSEMrbY5refAmN59gV.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 11:18:24'),
	(68, 'Camera 2', 'camera-2', 'Full Frame DSLR, with 18-55mm kit lens.', 227720, 'Lorem 2 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/camera-2.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(69, 'Camera 3', 'camera-3', 'Full Frame DSLR, with 18-55mm kit lens.', 247303, 'Lorem 3 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/camera-3.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(70, 'Camera 4', 'camera-4', 'Full Frame DSLR, with 18-55mm kit lens.', 167183, 'Lorem 4 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/camera-4.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(71, 'Camera 5', 'camera-5', 'Full Frame DSLR, with 18-55mm kit lens.', 137660, 'Lorem 5 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/camera-5.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(72, 'Camera 6', 'camera-6', 'Full Frame DSLR, with 18-55mm kit lens.', 85838, 'Lorem 6 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/camera-6.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(73, 'Camera 7', 'camera-7', 'Full Frame DSLR, with 18-55mm kit lens.', 227978, 'Lorem 7 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/camera-7.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(74, 'Camera 8', 'camera-8', 'Full Frame DSLR, with 18-55mm kit lens.', 191834, 'Lorem 8 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/camera-8.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(75, 'Camera 9', 'camera-9', 'Full Frame DSLR, with 18-55mm kit lens.', 241172, 'Lorem 9 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/camera-9.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(76, 'Appliance 1', 'appliance-1', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis, dolorum!', 85639, '<p>Lorem 1 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!</p>', 1, 'products/September2018/7aHok1cqW2x57lyPvcKb.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 11:18:13'),
	(77, 'Appliance 2', 'appliance-2', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis, dolorum!', 80485, 'Lorem 2 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/appliance-2.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(78, 'Appliance 3', 'appliance-3', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis, dolorum!', 119516, 'Lorem 3 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/appliance-3.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(79, 'Appliance 4', 'appliance-4', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis, dolorum!', 131601, 'Lorem 4 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/appliance-4.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(80, 'Appliance 5', 'appliance-5', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis, dolorum!', 128208, 'Lorem 5 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/appliance-5.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(81, 'Appliance 6', 'appliance-6', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis, dolorum!', 142476, 'Lorem 6 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/appliance-6.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(82, 'Appliance 7', 'appliance-7', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis, dolorum!', 140917, 'Lorem 7 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/appliance-7.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(83, 'Appliance 8', 'appliance-8', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis, dolorum!', 91993, 'Lorem 8 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/appliance-8.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(84, 'Appliance 9', 'appliance-9', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis, dolorum!', 134077, 'Lorem 9 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 'products/September2018/appliance-9.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 10:50:13'),
	(85, 'PS4', 'ps4', 'This is a PS4 details', 50000, '<p>This is a PS4 description</p>', 1, 'products/September2018/DjhZPEG1ns6qRPwC2wfh.jpg', NULL, '2018-09-28 10:50:13', '2018-09-28 11:18:46'),
	(86, 'Xbox one', 'xbox-one', 'Xbox one details', 50000, '<p><strong>Xbox</strong> one descriptions</p>', 1, 'products/September2018/mlkjOjoeWhkwNLlnNAp9.jpg', NULL, '2018-09-28 11:20:27', '2018-09-28 11:20:27');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.roles: ~2 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2018-09-28 10:24:43', '2018-09-28 10:24:43'),
	(2, 'user', 'Normal User', '2018-09-28 10:24:43', '2018-09-28 10:24:43');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.settings
DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.settings: ~10 rows (approximately)
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
	(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
	(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
	(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
	(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
	(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
	(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
	(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
	(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
	(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
	(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.translations
DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.translations: ~30 rows (approximately)
DELETE FROM `translations`;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(21, 'menu_items', 'title', 2, 'pt', 'Media', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2018-09-28 10:24:46', '2018-09-28 10:24:46'),
	(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2018-09-28 10:24:46', '2018-09-28 10:24:46');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.users: ~2 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', '$2y$10$A4NYTGvEbKvEEX8U8o1YAu748hgYtXJUQXvf/7fcmD3DOsr/7T7ae', 'hynTyqfh6zo248b9TucTXaCVNhNq3OpM7hCuTFkMFxSPRvED8Gn7nGA5Mkqg', NULL, '2018-09-28 10:24:45', '2018-09-28 10:24:45'),
	(2, 2, 'Rehan', 'rehansyed89@gmail.com', 'users/September2018/hKStUAcQOrA5yDjkQoyg.jpg', '$2y$10$e.pCKt09THnE1CPSFQjvLemJVXgByIzezPVCWtPt30yogdN19FTxe', 'F0YimeNsVfdFHupL8l6uxn1Ht2DujutP9fEie753odpFp9KmeuxmQw36wJEq', '{"locale":"en"}', '2018-09-30 18:42:18', '2018-09-30 18:45:44');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table ecommerce_test.user_roles
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ecommerce_test.user_roles: ~0 rows (approximately)
DELETE FROM `user_roles`;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
