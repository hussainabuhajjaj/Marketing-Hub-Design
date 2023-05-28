-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table marketinghub.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.categories: ~2 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT IGNORE INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 'Category 1', 'category-1', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(2, NULL, 1, 'Category 2', 'category-2', '2023-05-25 21:15:17', '2023-05-25 21:15:17');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table marketinghub.clients
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.clients: ~1 rows (approximately)
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT IGNORE INTO `clients` (`id`, `logo`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'clients\\May2023\\MDRBuAzzW6u2RUlObFBb.png', '2023-05-27 20:50:14', '2023-05-27 20:50:14', NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;

-- Dumping structure for table marketinghub.data_rows
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.data_rows: ~101 rows (approximately)
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT IGNORE INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
	(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
	(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
	(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
	(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":0}', 10),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
	(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
	(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
	(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
	(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', 2),
	(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{"default":1}', 3),
	(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
	(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{"slugify":{"origin":"name"}}', 5),
	(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
	(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
	(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
	(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
	(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
	(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
	(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', 7),
	(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:posts,slug"}}', 8),
	(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
	(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
	(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}', 11),
	(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
	(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
	(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
	(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
	(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
	(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
	(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
	(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
	(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title"},"validation":{"rule":"unique:pages,slug"}}', 6),
	(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
	(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
	(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', 9),
	(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
	(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
	(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
	(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(57, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 2),
	(58, 7, 'description', 'rich_text_box', 'Description', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 3),
	(59, 7, 'image', 'multiple_images', 'Images', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 4),
	(60, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 0, 0, 0, 0, '{}', 5),
	(61, 7, 'updated_at', 'timestamp', 'Updated At', 0, 1, 0, 0, 0, 0, '{}', 6),
	(62, 7, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 0, 0, 0, '{}', 7),
	(63, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(64, 8, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 2),
	(65, 8, 'colored_text', 'text', 'Colored Text', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 3),
	(66, 8, 'sub_title', 'text', 'Sub Title', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 4),
	(67, 8, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 5),
	(68, 8, 'button_text', 'text', 'Button Text', 0, 1, 1, 1, 1, 1, '{}', 6),
	(69, 8, 'redirect_to', 'text', 'Redirect To', 0, 1, 1, 1, 1, 1, '{}', 7),
	(70, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
	(71, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
	(72, 8, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 0, 0, 0, '{}', 11),
	(73, 8, 'image', 'image', 'Image', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 8),
	(74, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(75, 9, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
	(76, 9, 'description', 'rich_text_box', 'Description', 1, 1, 1, 1, 1, 1, '{}', 3),
	(77, 9, 'bullets', 'text', 'Bullets', 0, 1, 1, 1, 1, 1, '{}', 4),
	(78, 9, 'image', 'image', 'Image', 1, 1, 1, 1, 1, 1, '{}', 5),
	(79, 9, 'icon', 'image', 'Icon', 1, 1, 1, 1, 1, 1, '{}', 6),
	(80, 9, 'service_id', 'select_dropdown', 'Service Id', 1, 1, 1, 1, 1, 1, '{}', 7),
	(81, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 8),
	(82, 9, 'updated_at', 'timestamp', 'Updated At', 0, 1, 1, 0, 0, 0, '{}', 9),
	(83, 9, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 0, 0, 0, '{}', 10),
	(84, 9, 'service_belongsto_main_service_relationship', 'relationship', 'main_services', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\MainService","table":"main_services","type":"belongsTo","column":"service_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":null}', 11),
	(85, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(86, 11, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 2),
	(87, 11, 'brief', 'rich_text_box', 'Brief', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 3),
	(88, 11, 'icon', 'image', 'Icon', 0, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 4),
	(89, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 5),
	(90, 11, 'updated_at', 'timestamp', 'Updated At', 0, 1, 1, 0, 0, 0, '{}', 6),
	(91, 11, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 0, 0, 0, '{}', 7),
	(92, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(93, 12, 'logo', 'image', 'Logo', 1, 1, 1, 1, 1, 1, '{}', 2),
	(94, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 3),
	(95, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
	(96, 12, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 0, 0, 0, '{}', 5),
	(107, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(110, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
	(111, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
	(112, 15, 'latitude', 'coordinates', 'Latitude', 0, 1, 1, 1, 1, 1, '{}', 2),
	(113, 15, 'longitude', 'coordinates', 'Longitude', 0, 1, 1, 1, 1, 1, '{}', 3);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Dumping structure for table marketinghub.data_types
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.data_types: ~12 rows (approximately)
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT IGNORE INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(7, 'main_services', 'main-services', 'Main Service', 'Main Services', 'voyager-paperclip', 'App\\MainService', NULL, NULL, NULL, 1, 1, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":"name","scope":null}', '2023-05-25 21:26:33', '2023-05-25 21:34:26'),
	(8, 'sliders', 'sliders', 'Slider', 'Sliders', 'voyager-photosvoyager-photos', 'App\\Slider', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2023-05-27 12:55:19', '2023-05-27 12:55:19'),
	(9, 'services', 'services', 'Service', 'Services', 'voyager-categories', 'App\\Models\\Service', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2023-05-27 17:49:11', '2023-05-27 17:49:11'),
	(11, 'our_progress', 'our-progress', 'Our Progress', 'Our Progresses', 'voyager-compass', 'App\\Models\\OurProgress', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2023-05-27 20:41:23', '2023-05-27 20:41:23'),
	(12, 'clients', 'clients', 'Client', 'Clients', 'voyager-user', 'App\\Models\\Client', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2023-05-27 20:49:43', '2023-05-27 20:49:43'),
	(15, 'maps', 'maps', 'Map', 'Maps', 'voyager-map', 'App\\Models\\Map', NULL, NULL, NULL, 1, 1, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2023-05-27 22:10:08', '2023-05-27 22:14:42');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Dumping structure for table marketinghub.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table marketinghub.main_services
CREATE TABLE IF NOT EXISTS `main_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.main_services: ~4 rows (approximately)
/*!40000 ALTER TABLE `main_services` DISABLE KEYS */;
INSERT IGNORE INTO `main_services` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Corporate Identity', '<p>Corporate identity refers to the visual and psychological representation of a company or organization. It encompasses the overall image, personality, and reputation that a company projects to its stakeholders, including customers, employees, investors, and the general public. A well-defined corporate identity helps create a distinct and recognizable brand that sets the company apart from its competitors.</p>\r\n<p>Corporate identity is often expressed through various elements, including:</p>\r\n<p>1. Logo: The logo is a graphical symbol or emblem that represents the company. It is a key component of the corporate identity and is typically displayed on all company materials, products, and communications.</p>\r\n<p>2. Visual Identity: This includes the color scheme, typography, and design elements used consistently across all company materials, such as business cards, letterheads, packaging, website, and advertisements. Consistency in visual elements helps create a cohesive and recognizable brand image.</p>\r\n<p>3. Slogan or Tagline: A short and memorable phrase that encapsulates the company\'s value proposition or brand promise. It is often used in advertising campaigns to reinforce the company\'s identity.</p>\r\n<p>4. Mission, Vision, and Values: These statements define the purpose, aspirations, and guiding principles of the company. They communicate the company\'s goals, beliefs, and commitment to its stakeholders.</p>\r\n<p>5. Communication Style: The tone, language, and style of communication used by the company in its marketing materials, advertisements, and customer interactions. This includes both verbal and written communication, such as the company\'s website content, social media posts, and customer service interactions.</p>\r\n<p>6. Corporate Culture: The shared values, attitudes, and behaviors that shape the company\'s internal environment. It includes aspects like employee dress code, office layout, work atmosphere, and employee interactions. The corporate culture contributes to the overall perception of the company\'s identity.</p>\r\n<p>7. Brand Guidelines: A set of rules and standards that govern the usage of the company\'s visual and verbal elements. Brand guidelines ensure consistency in the application of the corporate identity across various platforms and help maintain a cohesive brand image.</p>\r\n<p>An effective corporate identity strategy aligns all these elements to create a strong and consistent brand image that resonates with the company\'s target audience. It helps build trust, recognition, and loyalty among customers and stakeholders, ultimately contributing to the success and competitiveness of the company.</p>', '["main-services\\\\May2023\\\\3IUxIPLk2zAq26j5P4HU.png"]', '2023-05-25 21:29:02', '2023-05-25 21:29:02', NULL),
	(2, 'Website & Mobile Apps Development', '<p>Ignite Your Online Presence: Stunning Websites and Mobile Apps!</p>\r\n<p>Elevate your business with captivating websites and mobile apps. Our experts combine striking designs, seamless functionality, and a user-friendly experience to captivate your target audience.</p>\r\n<p>Tailored Perfection: Customized solutions that meet your unique needs. From dynamic e-commerce sites to sleek portfolios and feature-rich apps, we bring your ideas to life, exceeding expectations.</p>\r\n<p>Uncompromising Quality: Meticulous testing ensures flawless performance, speed, and security. Every detail is fine-tuned for a remarkable user experience that leaves a lasting impression.</p>\r\n<p>Ahead of the Curve: Stay at the forefront of technology. We embrace the latest trends, innovative features, and industry standards to future-proof your digital presence.</p>\r\n<p>Unlock Your Potential: Partner with us for a transformative journey. Stand out, captivate, and watch your online presence flourish. Contact us now to turn your vision into reality.</p>', '["main-services\\\\May2023\\\\drKnntHre3UDSOEFqbkT.png","main-services\\\\May2023\\\\XTHv9MTDndbfAlqNGJl3.jpg"]', '2023-05-25 21:31:34', '2023-05-27 20:00:03', NULL),
	(3, 'Social Media Management', '<p>Supercharge Your Social Media Presence: Unlock the Power of Effective Social Media Management!</p>\r\n<p>In today\'s digital age, social media has become a game-changer for businesses. Are you ready to leverage the full potential of social platforms and skyrocket your brand awareness? Look no further! Our expert team specializes in comprehensive social media management to help you connect, engage, and thrive in the ever-evolving social landscape.</p>\r\n<p>Strategic Social Media Planning: We understand the importance of a well-defined social media strategy. Our team works closely with you to develop a tailored plan that aligns with your brand, objectives, and target audience. From content creation to posting schedules, we ensure your social media presence is strategic and impactful.</p>\r\n<p>Compelling Content Creation: Stand out from the crowd with captivating and relevant content that resonates with your audience. Our talented content creators craft compelling posts, striking visuals, and engaging videos that spark conversations, drive engagement, and build a loyal following.</p>\r\n<p>Audience Engagement and Community Management: Building a strong online community is vital for your brand\'s success. We actively engage with your audience, respond to comments and messages promptly, and foster meaningful conversations. By cultivating a thriving online community, we enhance customer loyalty and create brand advocates.</p>\r\n<p>Data-Driven Insights: We don\'t rely on guesswork. Our social media management is backed by data-driven insights. We analyze key metrics, track performance, and provide you with detailed reports. These insights help us optimize your strategy, identify trends, and make informed decisions to maximize your social media impact.</p>\r\n<p>Brand Consistency: Your brand\'s identity matters. We ensure consistent branding across all social media platforms, maintaining your unique voice, tone, and visual aesthetics. From profile optimization to personalized cover photos, we create a cohesive and recognizable brand identity that leaves a lasting impression.</p>\r\n<p>Stay Ahead of Trends: Social media is ever-evolving, and we stay at the forefront of the latest trends and platform updates. Our team is well-versed in emerging features, algorithms, and best practices. We harness these trends to keep your brand relevant and adaptable in the dynamic social media landscape.</p>\r\n<p>Unlock the full potential of social media for your business. Partner with us to supercharge your social media presence, increase brand visibility, and foster meaningful connections with your target audience. Contact us now to embark on an exciting journey of social media success!</p>', '["main-services\\\\May2023\\\\5mn0Pf22InsJch5qrASL.png"]', '2023-05-25 21:35:46', '2023-05-25 21:35:46', NULL),
	(4, 'Campaign Management', '<p>Effortless Campaign Management: Boost Your Marketing, Reach Your Goals!</p>\r\n<p>Simplify your marketing efforts with our expert campaign management. We create customized strategies, compelling creatives, and reach your audience across multiple channels. With continuous optimization and comprehensive reporting, achieving outstanding results has never been easier. Supercharge your campaigns today! Contact us to get started.</p>', '["main-services\\\\May2023\\\\zFq1zjYPfvCGNweOxMtV.png"]', '2023-05-25 21:39:27', '2023-05-25 21:39:27', NULL),
	(5, 'Customer Support Solutions', '<p>Seamless Customer Support Solutions: Elevate Experiences, Drive Satisfaction!</p>\r\n<p>Deliver exceptional customer support with our tailored solutions. From multichannel availability to personalized assistance and prompt issue resolution, we empower your support team to provide outstanding service. Continuous improvement and customer feedback drive our success. Elevate your support today! Contact us to get started.</p>', '["main-services\\\\May2023\\\\TK5DW5uboXtYnm3CTc0E.jpg"]', '2023-05-25 21:40:58', '2023-05-27 20:01:21', NULL);
/*!40000 ALTER TABLE `main_services` ENABLE KEYS */;

-- Dumping structure for table marketinghub.maps
CREATE TABLE IF NOT EXISTS `maps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.maps: ~0 rows (approximately)
/*!40000 ALTER TABLE `maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `maps` ENABLE KEYS */;

-- Dumping structure for table marketinghub.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.menus: ~0 rows (approximately)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT IGNORE INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2023-05-25 21:15:16', '2023-05-25 21:15:16');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping structure for table marketinghub.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.menu_items: ~19 rows (approximately)
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT IGNORE INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2023-05-25 21:15:16', '2023-05-25 21:15:16', 'voyager.dashboard', NULL),
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2023-05-25 21:15:16', '2023-05-25 21:15:16', 'voyager.media.index', NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2023-05-25 21:15:16', '2023-05-25 21:15:16', 'voyager.users.index', NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2023-05-25 21:15:16', '2023-05-25 21:15:16', 'voyager.roles.index', NULL),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2023-05-25 21:15:16', '2023-05-25 21:15:16', NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2023-05-25 21:15:16', '2023-05-25 21:15:16', 'voyager.menus.index', NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2023-05-25 21:15:16', '2023-05-25 21:15:16', 'voyager.database.index', NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2023-05-25 21:15:16', '2023-05-25 21:15:16', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2023-05-25 21:15:16', '2023-05-25 21:15:16', 'voyager.bread.index', NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2023-05-25 21:15:16', '2023-05-25 21:15:16', 'voyager.settings.index', NULL),
	(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2023-05-25 21:15:17', '2023-05-25 21:15:17', 'voyager.categories.index', NULL),
	(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2023-05-25 21:15:17', '2023-05-25 21:15:17', 'voyager.posts.index', NULL),
	(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2023-05-25 21:15:17', '2023-05-25 21:15:17', 'voyager.pages.index', NULL),
	(14, 1, 'Main Services', '', '_self', 'voyager-paperclip', NULL, NULL, 15, '2023-05-25 21:26:33', '2023-05-25 21:26:33', 'voyager.main-services.index', NULL),
	(15, 1, 'Sliders', '', '_self', 'voyager-photosvoyager-photos', NULL, NULL, 16, '2023-05-27 12:55:19', '2023-05-27 12:55:19', 'voyager.sliders.index', NULL),
	(16, 1, 'Services', '', '_self', 'voyager-categories', NULL, NULL, 17, '2023-05-27 17:49:11', '2023-05-27 17:49:11', 'voyager.services.index', NULL),
	(18, 1, 'Our Progresses', '', '_self', 'voyager-compass', NULL, NULL, 18, '2023-05-27 20:41:23', '2023-05-27 20:41:23', 'voyager.our-progress.index', NULL),
	(19, 1, 'Clients', '', '_self', 'voyager-user', NULL, NULL, 19, '2023-05-27 20:49:43', '2023-05-27 20:49:43', 'voyager.clients.index', NULL),
	(22, 1, 'Maps', '', '_self', 'voyager-map', NULL, NULL, 20, '2023-05-27 22:10:08', '2023-05-27 22:10:08', 'voyager.maps.index', NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Dumping structure for table marketinghub.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.migrations: ~29 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT IGNORE INTO `migrations` (`id`, `migration`, `batch`) VALUES
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
	(23, '2019_08_19_000000_create_failed_jobs_table', 1),
	(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(25, '2016_01_01_000000_create_pages_table', 2),
	(26, '2016_01_01_000000_create_posts_table', 2),
	(27, '2016_02_15_204651_create_categories_table', 2),
	(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
	(30, '2023_05_27_213548_add_coordinates_to_settings_table', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table marketinghub.our_progress
CREATE TABLE IF NOT EXISTS `our_progress` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brief` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.our_progress: ~1 rows (approximately)
/*!40000 ALTER TABLE `our_progress` DISABLE KEYS */;
INSERT IGNORE INTO `our_progress` (`id`, `title`, `brief`, `icon`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Problem', '<p>this is just text to describe the progress</p>', 'our-progress\\May2023\\rgmgBWSdujrmtjwP7IIR.svg', '2023-05-27 20:42:45', '2023-05-27 20:43:50', NULL);
/*!40000 ALTER TABLE `our_progress` ENABLE KEYS */;

-- Dumping structure for table marketinghub.our_progresses
CREATE TABLE IF NOT EXISTS `our_progresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brief` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.our_progresses: ~0 rows (approximately)
/*!40000 ALTER TABLE `our_progresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `our_progresses` ENABLE KEYS */;

-- Dumping structure for table marketinghub.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.pages: ~0 rows (approximately)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT IGNORE INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
	(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2023-05-25 21:15:17', '2023-05-25 21:15:17');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Dumping structure for table marketinghub.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table marketinghub.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.permissions: ~70 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT IGNORE INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(2, 'browse_bread', NULL, '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(3, 'browse_database', NULL, '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(4, 'browse_media', NULL, '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(5, 'browse_compass', NULL, '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(6, 'browse_menus', 'menus', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(7, 'read_menus', 'menus', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(8, 'edit_menus', 'menus', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(9, 'add_menus', 'menus', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(10, 'delete_menus', 'menus', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(11, 'browse_roles', 'roles', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(12, 'read_roles', 'roles', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(13, 'edit_roles', 'roles', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(14, 'add_roles', 'roles', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(15, 'delete_roles', 'roles', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(16, 'browse_users', 'users', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(17, 'read_users', 'users', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(18, 'edit_users', 'users', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(19, 'add_users', 'users', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(20, 'delete_users', 'users', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(21, 'browse_settings', 'settings', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(22, 'read_settings', 'settings', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(23, 'edit_settings', 'settings', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(24, 'add_settings', 'settings', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(25, 'delete_settings', 'settings', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(26, 'browse_categories', 'categories', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(27, 'read_categories', 'categories', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(28, 'edit_categories', 'categories', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(29, 'add_categories', 'categories', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(30, 'delete_categories', 'categories', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(31, 'browse_posts', 'posts', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(32, 'read_posts', 'posts', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(33, 'edit_posts', 'posts', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(34, 'add_posts', 'posts', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(35, 'delete_posts', 'posts', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(36, 'browse_pages', 'pages', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(37, 'read_pages', 'pages', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(38, 'edit_pages', 'pages', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(39, 'add_pages', 'pages', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(40, 'delete_pages', 'pages', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(41, 'browse_main_services', 'main_services', '2023-05-25 21:26:33', '2023-05-25 21:26:33'),
	(42, 'read_main_services', 'main_services', '2023-05-25 21:26:33', '2023-05-25 21:26:33'),
	(43, 'edit_main_services', 'main_services', '2023-05-25 21:26:33', '2023-05-25 21:26:33'),
	(44, 'add_main_services', 'main_services', '2023-05-25 21:26:33', '2023-05-25 21:26:33'),
	(45, 'delete_main_services', 'main_services', '2023-05-25 21:26:33', '2023-05-25 21:26:33'),
	(46, 'browse_sliders', 'sliders', '2023-05-27 12:55:19', '2023-05-27 12:55:19'),
	(47, 'read_sliders', 'sliders', '2023-05-27 12:55:19', '2023-05-27 12:55:19'),
	(48, 'edit_sliders', 'sliders', '2023-05-27 12:55:19', '2023-05-27 12:55:19'),
	(49, 'add_sliders', 'sliders', '2023-05-27 12:55:19', '2023-05-27 12:55:19'),
	(50, 'delete_sliders', 'sliders', '2023-05-27 12:55:19', '2023-05-27 12:55:19'),
	(51, 'browse_services', 'services', '2023-05-27 17:49:11', '2023-05-27 17:49:11'),
	(52, 'read_services', 'services', '2023-05-27 17:49:11', '2023-05-27 17:49:11'),
	(53, 'edit_services', 'services', '2023-05-27 17:49:11', '2023-05-27 17:49:11'),
	(54, 'add_services', 'services', '2023-05-27 17:49:11', '2023-05-27 17:49:11'),
	(55, 'delete_services', 'services', '2023-05-27 17:49:11', '2023-05-27 17:49:11'),
	(61, 'browse_our_progress', 'our_progress', '2023-05-27 20:41:23', '2023-05-27 20:41:23'),
	(62, 'read_our_progress', 'our_progress', '2023-05-27 20:41:23', '2023-05-27 20:41:23'),
	(63, 'edit_our_progress', 'our_progress', '2023-05-27 20:41:23', '2023-05-27 20:41:23'),
	(64, 'add_our_progress', 'our_progress', '2023-05-27 20:41:23', '2023-05-27 20:41:23'),
	(65, 'delete_our_progress', 'our_progress', '2023-05-27 20:41:23', '2023-05-27 20:41:23'),
	(66, 'browse_clients', 'clients', '2023-05-27 20:49:43', '2023-05-27 20:49:43'),
	(67, 'read_clients', 'clients', '2023-05-27 20:49:43', '2023-05-27 20:49:43'),
	(68, 'edit_clients', 'clients', '2023-05-27 20:49:43', '2023-05-27 20:49:43'),
	(69, 'add_clients', 'clients', '2023-05-27 20:49:43', '2023-05-27 20:49:43'),
	(70, 'delete_clients', 'clients', '2023-05-27 20:49:43', '2023-05-27 20:49:43'),
	(81, 'browse_maps', 'maps', '2023-05-27 22:10:08', '2023-05-27 22:10:08'),
	(82, 'read_maps', 'maps', '2023-05-27 22:10:08', '2023-05-27 22:10:08'),
	(83, 'edit_maps', 'maps', '2023-05-27 22:10:08', '2023-05-27 22:10:08'),
	(84, 'add_maps', 'maps', '2023-05-27 22:10:08', '2023-05-27 22:10:08'),
	(85, 'delete_maps', 'maps', '2023-05-27 22:10:08', '2023-05-27 22:10:08');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table marketinghub.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.permission_role: ~70 rows (approximately)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT IGNORE INTO `permission_role` (`permission_id`, `role_id`) VALUES
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
	(41, 1),
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
	(61, 1),
	(62, 1),
	(63, 1),
	(64, 1),
	(65, 1),
	(66, 1),
	(67, 1),
	(68, 1),
	(69, 1),
	(70, 1),
	(81, 1),
	(82, 1),
	(83, 1),
	(84, 1),
	(85, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table marketinghub.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.personal_access_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table marketinghub.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.posts: ~4 rows (approximately)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT IGNORE INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
	(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-05-25 21:15:17', '2023-05-25 21:15:17');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Dumping structure for table marketinghub.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT IGNORE INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2023-05-25 21:15:16', '2023-05-25 21:15:16'),
	(2, 'user', 'Normal User', '2023-05-25 21:15:16', '2023-05-25 21:15:16');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table marketinghub.services
CREATE TABLE IF NOT EXISTS `services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bullets` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.services: ~2 rows (approximately)
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT IGNORE INTO `services` (`id`, `title`, `description`, `bullets`, `image`, `icon`, `service_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Branding', '<p>Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain</p>', 'test,test', '0', '0', 1, '2023-05-27 18:00:43', '2023-05-27 19:09:14', NULL),
	(2, 'this is just service', '<p>this is just service this is just service this is just service this is just service this is just service this is just service this is just service this is just service this is just service</p>', NULL, 'services\\May2023\\ce30dHVLazGPNwhRoxtr.jpg', 'services\\May2023\\ipf4uh6SIb8y0oNsSUjY.svg', 2, '2023-05-27 20:20:46', '2023-05-27 20:20:46', NULL);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;

-- Dumping structure for table marketinghub.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.settings: ~17 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT IGNORE INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`, `latitude`, `longitude`) VALUES
	(1, 'site.title', 'Site Title', 'Marketing Hub', '', 'text', 1, 'Site', NULL, NULL),
	(2, 'site.description', 'Site Description', NULL, '', 'text', 2, 'Site', NULL, NULL),
	(3, 'site.logo', 'Site Logo', 'settings\\May2023\\78ZoQvKMPJ4NSfg2nU4I.png', '', 'image', 3, 'Site', NULL, NULL),
	(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site', NULL, NULL),
	(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin', NULL, NULL),
	(6, 'admin.title', 'Admin Title', 'Marketing Hub', '', 'text', 1, 'Admin', NULL, NULL),
	(7, 'admin.description', 'Admin Description', 'Welcome to Marketing Hub. The Missing Admin for Laravel', '', 'text', 2, 'Admin', NULL, NULL),
	(8, 'admin.loader', 'Admin Loader', 'settings\\May2023\\rghcfuaMYhS4XxnG9QLR.png', '', 'image', 3, 'Admin', NULL, NULL),
	(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\May2023\\ALaAtEvx6ssAbBfBEgGj.png', '', 'image', 4, 'Admin', NULL, NULL),
	(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '689273197230-sfpnf3t02r8msie6mo3ooovqimkr96gk.apps.googleusercontent.com', '', 'text', 1, 'Admin', NULL, NULL),
	(11, 'site.facebook', 'facebook', '', NULL, 'text', 6, 'Site', NULL, NULL),
	(12, 'site.instagram', 'instagram', '', NULL, 'text', 7, 'Site', NULL, NULL),
	(13, 'site.linkedin', 'linkedin', '', NULL, 'text', 8, 'Site', NULL, NULL),
	(14, 'site.twitter', 'twitter', '', NULL, 'text', 9, 'Site', NULL, NULL),
	(15, 'site.pintrest', 'pintrest', '', NULL, 'text', 10, 'Site', NULL, NULL),
	(16, 'site.phone', 'phone', '', NULL, 'text', 11, 'Site', NULL, NULL),
	(17, 'site.email', 'email', '', NULL, 'text', 12, 'Site', NULL, NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table marketinghub.sliders
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colored_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_text` text COLLATE utf8mb4_unicode_ci,
  `redirect_to` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.sliders: ~1 rows (approximately)
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT IGNORE INTO `sliders` (`id`, `title`, `colored_text`, `sub_title`, `description`, `button_text`, `redirect_to`, `created_at`, `updated_at`, `deleted_at`, `image`) VALUES
	(1, 'Progress with', 'Digital Marketing', 'What we Do ?', 'Anyone who loves or pursues or desires to obtain pain of itself, because it is  pain, because occasionally circumstances occur in which toil.', NULL, NULL, '2023-05-27 12:57:00', '2023-05-27 16:55:07', NULL, 'sliders\\May2023\\CKrVqAWVgr0iQqeQFu9d.jpg');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;

-- Dumping structure for table marketinghub.translations
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.translations: ~30 rows (approximately)
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT IGNORE INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(21, 'menu_items', 'title', 2, 'pt', 'Media', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2023-05-25 21:15:17', '2023-05-25 21:15:17'),
	(31, 'data_rows', 'display_name', 101, 'ar', 'Id', '2023-05-27 22:08:34', '2023-05-27 22:08:34'),
	(32, 'data_rows', 'display_name', 102, 'ar', 'Lat', '2023-05-27 22:08:34', '2023-05-27 22:08:34'),
	(33, 'data_rows', 'display_name', 104, 'ar', 'Created At', '2023-05-27 22:08:34', '2023-05-27 22:08:34'),
	(34, 'data_rows', 'display_name', 105, 'ar', 'Updated At', '2023-05-27 22:08:34', '2023-05-27 22:08:34'),
	(37, 'data_rows', 'display_name', 107, 'ar', 'Id', '2023-05-27 22:14:42', '2023-05-27 22:14:42'),
	(38, 'data_rows', 'display_name', 110, 'ar', 'Created At', '2023-05-27 22:14:42', '2023-05-27 22:14:42'),
	(39, 'data_rows', 'display_name', 111, 'ar', 'Updated At', '2023-05-27 22:14:42', '2023-05-27 22:14:42'),
	(40, 'data_types', 'display_name_singular', 15, 'ar', 'Map', '2023-05-27 22:14:42', '2023-05-27 22:14:42'),
	(41, 'data_types', 'display_name_plural', 15, 'ar', 'Maps', '2023-05-27 22:14:42', '2023-05-27 22:14:42');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Dumping structure for table marketinghub.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$OJZT8hly8KrDkpt/ZGdLpuQ/DpTQ45dXHixSLhyeJNgGIlUwT8Eqm', 'ngFBxdNoELiI6SdbFE0qCaAwZnlngt6743dnBkaMBXfwAEMeTMcuE9HcAMVY', NULL, '2023-05-25 21:15:17', '2023-05-25 21:15:17');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table marketinghub.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table marketinghub.user_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
