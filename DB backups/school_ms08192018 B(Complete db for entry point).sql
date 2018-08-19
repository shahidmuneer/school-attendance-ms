-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2018 at 03:02 PM
-- Server version: 5.7.9
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_ms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(2, NULL, 1, 'Category 2', 'category-2', '2018-08-04 00:13:30', '2018-08-04 00:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_subjects`
--

DROP TABLE IF EXISTS `class_subjects`;
CREATE TABLE IF NOT EXISTS `class_subjects` (
  `class_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `class_subjects_class_id_index` (`class_id`),
  KEY `class_subjects_subject_id_index` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":"0","taggable":"0"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
(66, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
(16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
(17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
(20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
(21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '', 5),
(22, 1, 'role_id', 'text', 'Role ID', 0, 1, 1, 1, 1, 1, NULL, 9),
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
(57, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(58, 7, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(59, 7, 'address', 'text', 'Address', 0, 1, 1, 1, 1, 1, NULL, 3),
(60, 7, 'logo', 'text', 'Logo', 0, 1, 1, 1, 1, 1, NULL, 4),
(61, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(62, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(63, 7, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, NULL, 7),
(64, 1, 'user_hasmany_school_relationship', 'relationship', 'School Name', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\School","table":"schools","type":"hasMany","column":"id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 13),
(65, 1, 'school_id', 'text', 'School Id', 0, 1, 1, 1, 1, 1, NULL, 11),
(67, 9, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(68, 9, 'school_id', 'text', 'School Id', 0, 1, 1, 1, 1, 0, NULL, 3),
(69, 9, 'joined_date', 'date', 'Joined Date', 0, 1, 1, 1, 1, 1, NULL, 4),
(70, 9, 'leaving_date', 'date', 'Leaving Date', 0, 1, 1, 1, 1, 1, NULL, 5),
(71, 9, 'student_hasone_school_relationship', 'relationship', 'schools', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\School","table":"schools","type":"belongsTo","column":"school_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 6),
(72, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 6),
(73, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(74, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(75, 11, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(76, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 3),
(77, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(78, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(79, 12, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(80, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 3),
(81, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(82, 13, 'class_id', 'text', 'Class Id', 0, 0, 0, 0, 0, 0, NULL, 1),
(83, 13, 'subject_id', 'text', 'Subject Id', 0, 0, 0, 0, 0, 0, NULL, 2),
(84, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 0, NULL, 3),
(85, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(86, 13, 'class_subject_belongsto_class_relationship', 'relationship', 'classes', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Classes","table":"classes","type":"belongsTo","column":"class_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 5),
(87, 13, 'class_subject_belongsto_subject_relationship', 'relationship', 'subjects', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Subject","table":"subjects","type":"belongsTo","column":"subject_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 6),
(88, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(89, 14, 'attendance_date', 'date', 'Attendance Date', 0, 1, 1, 1, 1, 1, NULL, 2),
(90, 14, 'student_id', 'text', 'Student Id', 0, 0, 0, 0, 0, 0, NULL, 3),
(91, 14, 'checking_time', 'time', 'Checking Time', 0, 1, 1, 1, 1, 1, NULL, 4),
(92, 14, 'checkout_time', 'time', 'Checkout Time', 0, 1, 1, 1, 1, 1, NULL, 5),
(93, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 6),
(94, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(95, 14, 'student_attendance_belongsto_student_relationship', 'relationship', 'students', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Student","table":"students","type":"belongsTo","column":"student_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 8),
(96, 15, 'student_id', 'text', 'Student Id', 0, 0, 0, 0, 0, 0, NULL, 1),
(97, 15, 'class_id', 'text', 'Class Id', 0, 0, 0, 0, 0, 0, NULL, 2),
(98, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 3),
(99, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(100, 15, 'student_class_belongsto_student_relationship', 'relationship', 'students', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Student","table":"students","type":"belongsTo","column":"student_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 5),
(101, 15, 'student_class_belongsto_class_relationship', 'relationship', 'classes', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Student","table":"classes","type":"belongsTo","column":"class_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 6),
(102, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(103, 16, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(104, 16, 'schedule_id', 'text', 'Schedule Id', 0, 0, 0, 0, 0, 0, NULL, 3),
(105, 16, 'total_marks', 'text', 'Total Marks', 0, 1, 1, 1, 1, 1, NULL, 4),
(106, 16, 'passing_marks', 'text', 'Passing Marks', 0, 1, 1, 1, 1, 1, NULL, 5),
(107, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 6),
(108, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(109, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(110, 17, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(111, 17, 'start_date', 'date', 'Start Date', 0, 1, 1, 1, 1, 1, NULL, 3),
(112, 17, 'end_date', 'date', 'End Date', 0, 1, 1, 1, 1, 1, NULL, 4),
(113, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(114, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(115, 16, 'exam_and_test_belongsto_test_schedule_relationship', 'relationship', 'test_schedules', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\TestSchedule","table":"test_schedules","type":"belongsTo","column":"schedule_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 8),
(116, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(117, 19, 'attendance_date', 'text', 'Attendance Date', 0, 1, 1, 1, 1, 1, NULL, 2),
(118, 19, 'user_id', 'text', 'User Id', 0, 0, 0, 0, 0, 0, NULL, 3),
(119, 19, 'checkin_time', 'checkbox', 'Checkin Time', 0, 1, 1, 1, 1, 1, NULL, 4),
(120, 19, 'checkout_time', 'text', 'Checkout Time', 0, 1, 1, 1, 1, 1, NULL, 5),
(121, 19, 'user_attendance_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\User","table":"users","type":"belongsTo","column":"user_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 6),
(122, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(123, 20, 'user_id', 'text', 'User Id', 0, 0, 0, 0, 0, 0, NULL, 2),
(124, 20, 'student_id', 'text', 'Student Id', 0, 0, 0, 0, 0, 0, NULL, 3),
(125, 20, 'remarks', 'text', 'Remarks', 0, 1, 1, 1, 1, 1, NULL, 4),
(126, 20, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(127, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(128, 20, 'user_student_remark_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Teacher","table":"teachers","type":"belongsTo","column":"user_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 7),
(129, 20, 'user_student_remark_belongsto_student_relationship', 'relationship', 'students', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Student","table":"students","type":"belongsTo","column":"student_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 8),
(130, 21, 'student_id', 'text', 'Student Id', 0, 0, 0, 0, 0, 0, NULL, 1),
(131, 21, 'test_id', 'text', 'Test Id', 0, 0, 0, 0, 0, 0, NULL, 2),
(132, 21, 'marks_obtained', 'number', 'Marks Obtained', 0, 1, 1, 1, 1, 1, NULL, 3),
(133, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(134, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(135, 21, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, NULL, 6),
(136, 21, 'teacher_remarks', 'text', 'Teacher Remarks', 0, 1, 1, 1, 1, 1, NULL, 7),
(137, 21, 'student_mark_belongsto_student_relationship', 'relationship', 'students', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Student","table":"students","type":"belongsTo","column":"student_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 8),
(138, 21, 'student_mark_belongsto_exam_and_test_relationship', 'relationship', 'exam_and_tests', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\ExamAndTest","table":"exam_and_tests","type":"belongsTo","column":"test_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 9),
(139, 22, 'student_id', 'text', 'Student Id', 0, 0, 0, 0, 0, 0, NULL, 1),
(140, 22, 'subject_id', 'text', 'Subject Id', 0, 0, 0, 0, 0, 0, NULL, 2),
(141, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(142, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(143, 22, 'student_subject_belongsto_student_relationship', 'relationship', 'students', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Student","table":"students","type":"belongsTo","column":"student_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 3),
(144, 22, 'student_subject_belongsto_subject_relationship', 'relationship', 'subjects', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Subject","table":"subjects","type":"belongsTo","column":"subject_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 4),
(145, 23, 'teacher_id', 'text', 'Teacher Id', 0, 0, 0, 0, 0, 0, NULL, 1),
(146, 23, 'class_id', 'text', 'Class Id', 0, 0, 0, 0, 0, 0, NULL, 2),
(147, 23, 'period_start_time', 'text', 'Period Start Time', 0, 1, 1, 1, 1, 1, NULL, 3),
(148, 23, 'period_end_time', 'text', 'Period End Time', 0, 1, 1, 1, 1, 1, NULL, 4),
(149, 24, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(150, 24, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(151, 24, 'user_id', 'text', 'User Id', 0, 0, 0, 0, 0, 0, NULL, 3),
(152, 24, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(153, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(154, 24, 'teacher_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\User","table":"users","type":"belongsTo","column":"id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 6),
(155, 23, 'teacher_class_belongsto_teacher_relationship', 'relationship', 'teachers', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Teacher","table":"teachers","type":"belongsTo","column":"teacher_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 5),
(156, 23, 'teacher_class_belongsto_class_relationship', 'relationship', 'classes', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Classes","table":"classes","type":"belongsTo","column":"class_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 6),
(157, 25, 'teacher_id', 'text', 'Teacher Id', 0, 0, 0, 0, 0, 0, NULL, 1),
(158, 25, 'subject_id', 'text', 'Subject Id', 0, 0, 0, 0, 0, 0, NULL, 2),
(159, 25, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(160, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(161, 25, 'teacher_subject_belongsto_teacher_relationship', 'relationship', 'teachers', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Teacher","table":"teachers","type":"belongsTo","column":"teacher_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 3),
(162, 25, 'teacher_subject_belongsto_subject_relationship', 'relationship', 'subjects', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Subject","table":"subjects","type":"belongsTo","column":"subject_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 4);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null}', '2018-08-04 00:13:27', '2018-08-19 08:32:37'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(7, 'schools', 'schools', 'School', 'Schools', 'voyager-company', 'App\\School', NULL, NULL, NULL, 1, 1, '{"order_column":"name","order_display_column":"id"}', '2018-08-19 08:11:29', '2018-08-19 08:28:46'),
(9, 'students', 'students', 'Student', 'Students', 'voyager-people', 'App\\Student', NULL, NULL, NULL, 1, 1, '{"order_column":"id","order_display_column":"id"}', '2018-08-19 08:47:54', '2018-08-19 09:16:43'),
(11, 'subjects', 'subjects', 'Subject', 'Subjects', 'voyager-book', 'App\\Subject', NULL, NULL, NULL, 1, 1, '{"order_column":null,"order_display_column":null}', '2018-08-19 09:03:59', '2018-08-19 09:03:59'),
(12, 'classes', 'classes', 'Class', 'Classes', 'voyager-data', 'App\\Classes', NULL, NULL, NULL, 1, 0, '{"order_column":"name","order_display_column":"id"}', '2018-08-19 09:05:40', '2018-08-19 09:06:14'),
(13, 'class_subjects', 'class-subjects', 'Class Subject', 'Class Subjects', 'voyager-book-download', 'App\\ClassSubject', NULL, NULL, NULL, 1, 0, '{"order_column":"class_id","order_display_column":"class_id"}', '2018-08-19 09:07:21', '2018-08-19 09:07:21'),
(14, 'student_attendances', 'student-attendances', 'Student Attendance', 'Student Attendances', 'voyager-character', 'App\\StudentAttendance', NULL, NULL, NULL, 1, 1, '{"order_column":"id","order_display_column":"id"}', '2018-08-19 09:12:17', '2018-08-19 09:12:17'),
(15, 'student_class', 'student-class', 'Student Class', 'Student Classes', 'voyager-folder', 'App\\StudentClass', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null}', '2018-08-19 09:19:10', '2018-08-19 09:19:10'),
(16, 'exam_and_tests', 'exam-and-tests', 'Exam And Test', 'Exam And Tests', 'voyager-backpack', 'App\\ExamAndTest', NULL, NULL, NULL, 1, 1, '{"order_column":"id","order_display_column":"id"}', '2018-08-19 09:24:09', '2018-08-19 09:28:02'),
(17, 'test_schedules', 'test-schedules', 'Test Schedule', 'Test Schedules', NULL, 'App\\TestSchedule', NULL, NULL, NULL, 1, 1, '{"order_column":null,"order_display_column":null}', '2018-08-19 09:25:04', '2018-08-19 09:25:04'),
(19, 'user_attendances', 'user-attendances', 'User Attendance', 'User Attendances', 'voyager-dashboard', 'App\\UserAttendance', NULL, NULL, NULL, 1, 1, '{"order_column":"id","order_display_column":"id"}', '2018-08-19 09:29:56', '2018-08-19 09:29:56'),
(20, 'user_student_remarks', 'user-student-remarks', 'User Student Remark', 'User Student Remarks', NULL, 'App\\UserStudentRemark', NULL, NULL, NULL, 1, 0, '{"order_column":"id","order_display_column":"id"}', '2018-08-19 09:32:20', '2018-08-19 09:32:20'),
(21, 'student_marks', 'student-marks', 'Student Mark', 'Student Marks', 'voyager-crop', 'App\\StudentMark', NULL, NULL, NULL, 1, 1, '{"order_column":"student_id","order_display_column":"student_id"}', '2018-08-19 09:35:24', '2018-08-19 09:35:24'),
(22, 'student_subjects', 'student-subjects', 'Student Subject', 'Student Subjects', NULL, 'App\\StudentSubject', NULL, NULL, NULL, 1, 1, '{"order_column":null,"order_display_column":null}', '2018-08-19 09:41:11', '2018-08-19 09:41:11'),
(23, 'teacher_class', 'teacher-class', 'Teacher Assigned Class', 'Teacher Assigned Classes', NULL, 'App\\TeacherClass', NULL, NULL, NULL, 1, 1, '{"order_column":null,"order_display_column":null}', '2018-08-19 09:45:30', '2018-08-19 09:45:30'),
(24, 'teachers', 'teachers', 'Teacher', 'Teachers', 'voyager-lightbulb', 'App\\Teacher', NULL, NULL, NULL, 1, 1, '{"order_column":"id","order_display_column":"id"}', '2018-08-19 09:50:36', '2018-08-19 09:50:36'),
(25, 'teacher_subjects', 'teacher-subjects', 'Teacher Subject', 'Teacher Subjects', 'voyager-news', 'App\\TeacherSubject', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null}', '2018-08-19 09:55:59', '2018-08-19 09:55:59');

-- --------------------------------------------------------

--
-- Table structure for table `exam_and_tests`
--

DROP TABLE IF EXISTS `exam_and_tests`;
CREATE TABLE IF NOT EXISTS `exam_and_tests` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `total_marks` int(11) DEFAULT NULL,
  `passing_marks` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_and_tests_schedule_id_index` (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(2, 'Home', '2018-08-04 00:33:32', '2018-08-04 00:33:32');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2018-08-04 00:13:27', '2018-08-04 00:13:27', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2018-08-04 00:13:27', '2018-08-04 00:13:27', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2018-08-04 00:13:27', '2018-08-04 00:13:27', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2018-08-04 00:13:27', '2018-08-04 00:13:27', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2018-08-04 00:13:27', '2018-08-04 00:13:27', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2018-08-04 00:13:27', '2018-08-04 00:13:27', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2018-08-04 00:13:27', '2018-08-04 00:13:27', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2018-08-04 00:13:27', '2018-08-04 00:13:27', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2018-08-04 00:13:27', '2018-08-04 00:13:27', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2018-08-04 00:13:27', '2018-08-04 00:13:27', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2018-08-04 00:13:30', '2018-08-04 00:13:30', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2018-08-04 00:13:30', '2018-08-04 00:13:30', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2018-08-04 00:13:30', '2018-08-04 00:13:30', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2018-08-04 00:13:30', '2018-08-04 00:13:30', 'voyager.hooks', NULL),
(15, 1, 'Schools', '', '_self', 'voyager-company', NULL, NULL, 15, '2018-08-19 08:11:30', '2018-08-19 08:11:30', 'voyager.schools.index', NULL),
(16, 1, 'Students', '', '_self', NULL, NULL, NULL, 16, '2018-08-19 08:47:54', '2018-08-19 08:47:54', 'voyager.students.index', NULL),
(17, 1, 'Subjects', '', '_self', 'voyager-book', NULL, NULL, 17, '2018-08-19 09:03:59', '2018-08-19 09:03:59', 'voyager.subjects.index', NULL),
(18, 1, 'Class Subjects', '', '_self', 'voyager-book-download', NULL, NULL, 18, '2018-08-19 09:07:21', '2018-08-19 09:07:21', 'voyager.class-subjects.index', NULL),
(19, 1, 'Student Attendances', '', '_self', 'voyager-character', NULL, NULL, 19, '2018-08-19 09:12:17', '2018-08-19 09:12:17', 'voyager.student-attendances.index', NULL),
(20, 1, 'Student Classes', '', '_self', 'voyager-folder', NULL, NULL, 20, '2018-08-19 09:19:10', '2018-08-19 09:19:10', 'voyager.student-class.index', NULL),
(21, 1, 'Exam And Tests', '', '_self', NULL, NULL, NULL, 21, '2018-08-19 09:24:10', '2018-08-19 09:24:10', 'voyager.exam-and-tests.index', NULL),
(22, 1, 'Test Schedules', '', '_self', NULL, NULL, NULL, 22, '2018-08-19 09:25:04', '2018-08-19 09:25:04', 'voyager.test-schedules.index', NULL),
(23, 1, 'User Attendances', '', '_self', 'voyager-dashboard', NULL, NULL, 23, '2018-08-19 09:29:56', '2018-08-19 09:29:56', 'voyager.user-attendances.index', NULL),
(24, 1, 'User Student Remarks', '', '_self', NULL, NULL, NULL, 24, '2018-08-19 09:32:20', '2018-08-19 09:32:20', 'voyager.user-student-remarks.index', NULL),
(25, 1, 'Student Marks', '', '_self', 'voyager-crop', NULL, NULL, 25, '2018-08-19 09:35:24', '2018-08-19 09:35:24', 'voyager.student-marks.index', NULL),
(26, 1, 'Student Subjects', '', '_self', NULL, NULL, NULL, 26, '2018-08-19 09:41:11', '2018-08-19 09:41:11', 'voyager.student-subjects.index', NULL),
(27, 1, 'Teacher Assigned Classes', '', '_self', NULL, NULL, NULL, 27, '2018-08-19 09:45:30', '2018-08-19 09:45:30', 'voyager.teacher-class.index', NULL),
(28, 1, 'Teachers', '', '_self', 'voyager-lightbulb', NULL, NULL, 28, '2018-08-19 09:50:36', '2018-08-19 09:50:36', 'voyager.teachers.index', NULL),
(29, 1, 'Teacher Subjects', '', '_self', 'voyager-news', NULL, NULL, 29, '2018-08-19 09:55:59', '2018-08-19 09:55:59', 'voyager.teacher-subjects.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

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
(23, '2016_01_01_000000_create_pages_table', 2),
(24, '2016_01_01_000000_create_posts_table', 2),
(25, '2016_02_15_204651_create_categories_table', 2),
(26, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o''nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2018-08-04 00:13:30', '2018-08-04 00:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(2, 'browse_bread', NULL, '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(3, 'browse_database', NULL, '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(4, 'browse_media', NULL, '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(5, 'browse_compass', NULL, '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(6, 'browse_menus', 'menus', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(7, 'read_menus', 'menus', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(8, 'edit_menus', 'menus', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(9, 'add_menus', 'menus', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(10, 'delete_menus', 'menus', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(11, 'browse_roles', 'roles', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(12, 'read_roles', 'roles', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(13, 'edit_roles', 'roles', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(14, 'add_roles', 'roles', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(15, 'delete_roles', 'roles', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(16, 'browse_users', 'users', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(17, 'read_users', 'users', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(18, 'edit_users', 'users', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(19, 'add_users', 'users', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(20, 'delete_users', 'users', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(21, 'browse_settings', 'settings', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(22, 'read_settings', 'settings', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(23, 'edit_settings', 'settings', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(24, 'add_settings', 'settings', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(25, 'delete_settings', 'settings', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(26, 'browse_categories', 'categories', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(27, 'read_categories', 'categories', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(28, 'edit_categories', 'categories', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(29, 'add_categories', 'categories', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(30, 'delete_categories', 'categories', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(31, 'browse_posts', 'posts', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(32, 'read_posts', 'posts', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(33, 'edit_posts', 'posts', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(34, 'add_posts', 'posts', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(35, 'delete_posts', 'posts', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(36, 'browse_pages', 'pages', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(37, 'read_pages', 'pages', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(38, 'edit_pages', 'pages', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(39, 'add_pages', 'pages', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(40, 'delete_pages', 'pages', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(41, 'browse_hooks', NULL, '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(42, 'browse_schools', 'schools', '2018-08-19 08:11:30', '2018-08-19 08:11:30'),
(43, 'read_schools', 'schools', '2018-08-19 08:11:30', '2018-08-19 08:11:30'),
(44, 'edit_schools', 'schools', '2018-08-19 08:11:30', '2018-08-19 08:11:30'),
(45, 'add_schools', 'schools', '2018-08-19 08:11:30', '2018-08-19 08:11:30'),
(46, 'delete_schools', 'schools', '2018-08-19 08:11:30', '2018-08-19 08:11:30'),
(47, 'browse_students', 'students', '2018-08-19 08:47:54', '2018-08-19 08:47:54'),
(48, 'read_students', 'students', '2018-08-19 08:47:54', '2018-08-19 08:47:54'),
(49, 'edit_students', 'students', '2018-08-19 08:47:54', '2018-08-19 08:47:54'),
(50, 'add_students', 'students', '2018-08-19 08:47:54', '2018-08-19 08:47:54'),
(51, 'delete_students', 'students', '2018-08-19 08:47:54', '2018-08-19 08:47:54'),
(52, 'browse_subjects', 'subjects', '2018-08-19 09:03:59', '2018-08-19 09:03:59'),
(53, 'read_subjects', 'subjects', '2018-08-19 09:03:59', '2018-08-19 09:03:59'),
(54, 'edit_subjects', 'subjects', '2018-08-19 09:03:59', '2018-08-19 09:03:59'),
(55, 'add_subjects', 'subjects', '2018-08-19 09:03:59', '2018-08-19 09:03:59'),
(56, 'delete_subjects', 'subjects', '2018-08-19 09:03:59', '2018-08-19 09:03:59'),
(57, 'browse_classes', 'classes', '2018-08-19 09:06:14', '2018-08-19 09:06:14'),
(58, 'read_classes', 'classes', '2018-08-19 09:06:14', '2018-08-19 09:06:14'),
(59, 'edit_classes', 'classes', '2018-08-19 09:06:14', '2018-08-19 09:06:14'),
(60, 'add_classes', 'classes', '2018-08-19 09:06:14', '2018-08-19 09:06:14'),
(61, 'delete_classes', 'classes', '2018-08-19 09:06:14', '2018-08-19 09:06:14'),
(62, 'browse_class_subjects', 'class_subjects', '2018-08-19 09:07:21', '2018-08-19 09:07:21'),
(63, 'read_class_subjects', 'class_subjects', '2018-08-19 09:07:21', '2018-08-19 09:07:21'),
(64, 'edit_class_subjects', 'class_subjects', '2018-08-19 09:07:21', '2018-08-19 09:07:21'),
(65, 'add_class_subjects', 'class_subjects', '2018-08-19 09:07:21', '2018-08-19 09:07:21'),
(66, 'delete_class_subjects', 'class_subjects', '2018-08-19 09:07:21', '2018-08-19 09:07:21'),
(67, 'browse_student_attendances', 'student_attendances', '2018-08-19 09:12:17', '2018-08-19 09:12:17'),
(68, 'read_student_attendances', 'student_attendances', '2018-08-19 09:12:17', '2018-08-19 09:12:17'),
(69, 'edit_student_attendances', 'student_attendances', '2018-08-19 09:12:17', '2018-08-19 09:12:17'),
(70, 'add_student_attendances', 'student_attendances', '2018-08-19 09:12:17', '2018-08-19 09:12:17'),
(71, 'delete_student_attendances', 'student_attendances', '2018-08-19 09:12:17', '2018-08-19 09:12:17'),
(72, 'browse_student_class', 'student_class', '2018-08-19 09:19:10', '2018-08-19 09:19:10'),
(73, 'read_student_class', 'student_class', '2018-08-19 09:19:10', '2018-08-19 09:19:10'),
(74, 'edit_student_class', 'student_class', '2018-08-19 09:19:10', '2018-08-19 09:19:10'),
(75, 'add_student_class', 'student_class', '2018-08-19 09:19:10', '2018-08-19 09:19:10'),
(76, 'delete_student_class', 'student_class', '2018-08-19 09:19:10', '2018-08-19 09:19:10'),
(77, 'browse_exam_and_tests', 'exam_and_tests', '2018-08-19 09:24:10', '2018-08-19 09:24:10'),
(78, 'read_exam_and_tests', 'exam_and_tests', '2018-08-19 09:24:10', '2018-08-19 09:24:10'),
(79, 'edit_exam_and_tests', 'exam_and_tests', '2018-08-19 09:24:10', '2018-08-19 09:24:10'),
(80, 'add_exam_and_tests', 'exam_and_tests', '2018-08-19 09:24:10', '2018-08-19 09:24:10'),
(81, 'delete_exam_and_tests', 'exam_and_tests', '2018-08-19 09:24:10', '2018-08-19 09:24:10'),
(82, 'browse_test_schedules', 'test_schedules', '2018-08-19 09:25:04', '2018-08-19 09:25:04'),
(83, 'read_test_schedules', 'test_schedules', '2018-08-19 09:25:04', '2018-08-19 09:25:04'),
(84, 'edit_test_schedules', 'test_schedules', '2018-08-19 09:25:04', '2018-08-19 09:25:04'),
(85, 'add_test_schedules', 'test_schedules', '2018-08-19 09:25:04', '2018-08-19 09:25:04'),
(86, 'delete_test_schedules', 'test_schedules', '2018-08-19 09:25:04', '2018-08-19 09:25:04'),
(87, 'browse_user_attendances', 'user_attendances', '2018-08-19 09:29:56', '2018-08-19 09:29:56'),
(88, 'read_user_attendances', 'user_attendances', '2018-08-19 09:29:56', '2018-08-19 09:29:56'),
(89, 'edit_user_attendances', 'user_attendances', '2018-08-19 09:29:56', '2018-08-19 09:29:56'),
(90, 'add_user_attendances', 'user_attendances', '2018-08-19 09:29:56', '2018-08-19 09:29:56'),
(91, 'delete_user_attendances', 'user_attendances', '2018-08-19 09:29:56', '2018-08-19 09:29:56'),
(92, 'browse_user_student_remarks', 'user_student_remarks', '2018-08-19 09:32:20', '2018-08-19 09:32:20'),
(93, 'read_user_student_remarks', 'user_student_remarks', '2018-08-19 09:32:20', '2018-08-19 09:32:20'),
(94, 'edit_user_student_remarks', 'user_student_remarks', '2018-08-19 09:32:20', '2018-08-19 09:32:20'),
(95, 'add_user_student_remarks', 'user_student_remarks', '2018-08-19 09:32:20', '2018-08-19 09:32:20'),
(96, 'delete_user_student_remarks', 'user_student_remarks', '2018-08-19 09:32:20', '2018-08-19 09:32:20'),
(97, 'browse_student_marks', 'student_marks', '2018-08-19 09:35:24', '2018-08-19 09:35:24'),
(98, 'read_student_marks', 'student_marks', '2018-08-19 09:35:24', '2018-08-19 09:35:24'),
(99, 'edit_student_marks', 'student_marks', '2018-08-19 09:35:24', '2018-08-19 09:35:24'),
(100, 'add_student_marks', 'student_marks', '2018-08-19 09:35:24', '2018-08-19 09:35:24'),
(101, 'delete_student_marks', 'student_marks', '2018-08-19 09:35:24', '2018-08-19 09:35:24'),
(102, 'browse_student_subjects', 'student_subjects', '2018-08-19 09:41:11', '2018-08-19 09:41:11'),
(103, 'read_student_subjects', 'student_subjects', '2018-08-19 09:41:11', '2018-08-19 09:41:11'),
(104, 'edit_student_subjects', 'student_subjects', '2018-08-19 09:41:11', '2018-08-19 09:41:11'),
(105, 'add_student_subjects', 'student_subjects', '2018-08-19 09:41:11', '2018-08-19 09:41:11'),
(106, 'delete_student_subjects', 'student_subjects', '2018-08-19 09:41:11', '2018-08-19 09:41:11'),
(107, 'browse_teacher_class', 'teacher_class', '2018-08-19 09:45:30', '2018-08-19 09:45:30'),
(108, 'read_teacher_class', 'teacher_class', '2018-08-19 09:45:30', '2018-08-19 09:45:30'),
(109, 'edit_teacher_class', 'teacher_class', '2018-08-19 09:45:30', '2018-08-19 09:45:30'),
(110, 'add_teacher_class', 'teacher_class', '2018-08-19 09:45:30', '2018-08-19 09:45:30'),
(111, 'delete_teacher_class', 'teacher_class', '2018-08-19 09:45:30', '2018-08-19 09:45:30'),
(112, 'browse_teachers', 'teachers', '2018-08-19 09:50:36', '2018-08-19 09:50:36'),
(113, 'read_teachers', 'teachers', '2018-08-19 09:50:36', '2018-08-19 09:50:36'),
(114, 'edit_teachers', 'teachers', '2018-08-19 09:50:36', '2018-08-19 09:50:36'),
(115, 'add_teachers', 'teachers', '2018-08-19 09:50:36', '2018-08-19 09:50:36'),
(116, 'delete_teachers', 'teachers', '2018-08-19 09:50:36', '2018-08-19 09:50:36'),
(117, 'browse_teacher_subjects', 'teacher_subjects', '2018-08-19 09:55:59', '2018-08-19 09:55:59'),
(118, 'read_teacher_subjects', 'teacher_subjects', '2018-08-19 09:55:59', '2018-08-19 09:55:59'),
(119, 'edit_teacher_subjects', 'teacher_subjects', '2018-08-19 09:55:59', '2018-08-19 09:55:59'),
(120, 'add_teacher_subjects', 'teacher_subjects', '2018-08-19 09:55:59', '2018-08-19 09:55:59'),
(121, 'delete_teacher_subjects', 'teacher_subjects', '2018-08-19 09:55:59', '2018-08-19 09:55:59');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

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
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-08-04 00:13:30', '2018-08-04 00:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2018-08-04 00:13:27', '2018-08-04 00:13:27'),
(2, 'user', 'Normal User', '2018-08-04 00:13:27', '2018-08-04 00:13:27');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
CREATE TABLE IF NOT EXISTS `schools` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` tinytext COLLATE utf8mb4_unicode_ci,
  `logo` varchar(135) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schools_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `address`, `logo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Beacon House System', 'Beacon House System Near Boasan Road Multan', NULL, '2018-08-19 08:53:35', '2018-08-19 08:53:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `leaving_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `school_id`, `joined_date`, `leaving_date`, `created_at`, `updated_at`) VALUES
(1, 'Shahid', 1, '2018-12-30', NULL, '2018-08-19 08:57:00', '2018-08-19 08:58:34');

-- --------------------------------------------------------

--
-- Table structure for table `student_attendances`
--

DROP TABLE IF EXISTS `student_attendances`;
CREATE TABLE IF NOT EXISTS `student_attendances` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attendance_date` datetime DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `checking_time` time DEFAULT NULL,
  `checkout_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_attendances_student_id_index` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_class`
--

DROP TABLE IF EXISTS `student_class`;
CREATE TABLE IF NOT EXISTS `student_class` (
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `student_class_student_id_index` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_marks`
--

DROP TABLE IF EXISTS `student_marks`;
CREATE TABLE IF NOT EXISTS `student_marks` (
  `student_id` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `marks_obtained` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `teacher_remarks` text COLLATE utf8mb4_unicode_ci,
  KEY `student_marks_student_id_index` (`student_id`),
  KEY `student_marks_test_id_index` (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_subjects`
--

DROP TABLE IF EXISTS `student_subjects`;
CREATE TABLE IF NOT EXISTS `student_subjects` (
  `student_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `student_subjects_student_id_index` (`student_id`),
  KEY `student_subjects_subject_id_index` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teachers_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_class`
--

DROP TABLE IF EXISTS `teacher_class`;
CREATE TABLE IF NOT EXISTS `teacher_class` (
  `teacher_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `period_start_time` int(11) DEFAULT NULL,
  `period_end_time` int(11) DEFAULT NULL,
  KEY `teacher_class_teacher_id_index` (`teacher_id`),
  KEY `teacher_class_class_id_index` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subjects`
--

DROP TABLE IF EXISTS `teacher_subjects`;
CREATE TABLE IF NOT EXISTS `teacher_subjects` (
  `teacher_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `teacher_subjects_teacher_id_index` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_schedules`
--

DROP TABLE IF EXISTS `test_schedules`;
CREATE TABLE IF NOT EXISTS `test_schedules` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o''nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2018-08-04 00:13:30', '2018-08-04 00:13:30'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2018-08-04 00:13:30', '2018-08-04 00:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  KEY `users_school_id_index` (`school_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `school_id`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', '$2y$10$v/khL.JSUwkKvNAk2mopxO4H1T8thkebErZ7qmoggjzCt1uCtVwOW', 'WBI4RRBLAYbNHLuLurn8AuuHf5KYB2nm9X4Yt3a4JwK4Z3WL1rBasLPds24l', NULL, '2018-08-04 00:13:30', '2018-08-04 00:13:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_activitiy_logs`
--

DROP TABLE IF EXISTS `user_activitiy_logs`;
CREATE TABLE IF NOT EXISTS `user_activitiy_logs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `log` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_activitiy_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_attendances`
--

DROP TABLE IF EXISTS `user_attendances`;
CREATE TABLE IF NOT EXISTS `user_attendances` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attendance_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `checkin_time` time DEFAULT NULL,
  `checkout_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_attendances_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_student_remarks`
--

DROP TABLE IF EXISTS `user_student_remarks`;
CREATE TABLE IF NOT EXISTS `user_student_remarks` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_student_remarks_user_id_index` (`user_id`),
  KEY `user_student_remarks_student_id_index` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
