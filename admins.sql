# ************************************************************
# Sequel Pro SQL dump
# バージョン 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# 作成時刻: 2020-03-08 11:05:19 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# テーブルのダンプ admin_account_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_account_types`;

CREATE TABLE `admin_account_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(20) DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `del_flg` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `del_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `admin_account_types` WRITE;
/*!40000 ALTER TABLE `admin_account_types` DISABLE KEYS */;

INSERT INTO `admin_account_types` (`id`, `account_name`, `status`, `del_flg`, `del_user_id`, `created_at`, `updated_at`)
VALUES
	(1,'運営',0,0,NULL,'2020-03-07 05:35:21','2020-03-07 05:35:21'),
	(2,'企業',0,0,NULL,'2020-03-07 05:35:27','2020-03-07 05:35:27'),
	(3,'店舗',0,0,NULL,'2020-03-07 05:35:30','2020-03-07 05:35:30'),
	(4,'代理店',0,0,NULL,'2020-03-07 05:35:35','2020-03-07 05:35:35');

/*!40000 ALTER TABLE `admin_account_types` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ admin_menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_menus`;

CREATE TABLE `admin_menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `top_lavel_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'トップレベルタイプID',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '親タイプID',
  `menu_name` varchar(20) DEFAULT NULL COMMENT '名称',
  `level` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '階層',
  `global_sort_order` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'トップレベル表示順',
  `local_sort_order` int(11) NOT NULL DEFAULT '0' COMMENT '階層内表示順',
  `display_flg` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '表示フラグ、0=not display, 1=display',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'ステータス',
  `del_flg` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '削除フラグ',
  `del_user_id` bigint(20) unsigned DEFAULT NULL COMMENT '削除ユーザーID',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最終更新日',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `admin_menus` WRITE;
/*!40000 ALTER TABLE `admin_menus` DISABLE KEYS */;

INSERT INTO `admin_menus` (`id`, `top_lavel_id`, `parent_id`, `menu_name`, `level`, `global_sort_order`, `local_sort_order`, `display_flg`, `status`, `del_flg`, `del_user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,0,'メニュー管理',1,0,0,1,0,0,NULL,'2020-03-07 06:45:42','2020-03-07 06:45:42'),
	(2,0,0,'ページ管理',1,0,0,1,0,0,NULL,'2020-03-07 06:45:45','2020-03-07 06:45:45'),
	(3,0,0,'ルート管理',1,0,0,1,0,0,NULL,'2020-03-07 06:45:55','2020-03-07 06:45:55'),
	(4,0,0,'役割管理',1,0,0,1,0,0,NULL,'2020-03-07 06:46:00','2020-03-07 06:46:00'),
	(5,0,0,'権限管理',1,0,0,1,0,0,NULL,'2020-03-07 06:46:06','2020-03-07 06:46:06'),
	(6,0,0,'アカウント管理',1,0,0,1,0,0,NULL,'2020-03-07 06:47:18','2020-03-07 06:47:18'),
	(7,0,0,'メニュー管理',1,0,0,1,0,0,NULL,'2020-03-07 06:47:23','2020-03-07 06:47:23'),
	(8,0,0,'企業管理',1,0,0,1,0,0,NULL,'2020-03-07 06:47:26','2020-03-07 06:47:26'),
	(9,0,0,'店舗管理',1,0,0,1,0,0,NULL,'2020-03-07 06:48:34','2020-03-07 06:48:34'),
	(10,0,0,'代理店管理',1,0,0,1,0,0,NULL,'2020-03-07 06:48:39','2020-03-07 06:48:39'),
	(11,0,0,'商品管理',1,0,0,1,0,0,NULL,'2020-03-07 06:48:43','2020-03-07 06:48:43'),
	(12,0,0,'お問い合わせ管理',1,0,0,1,0,0,NULL,'2020-03-07 06:48:46','2020-03-07 06:48:46');

/*!40000 ALTER TABLE `admin_menus` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ admin_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_pages`;

CREATE TABLE `admin_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_menu_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `page_name` varchar(20) DEFAULT NULL,
  `access_type` varchar(1) NOT NULL COMMENT 'C=CREATE,R=READ,U=UPDATE,D=DELETE',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `del_flg` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `del_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_admin_menu_id` (`admin_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `admin_pages` WRITE;
/*!40000 ALTER TABLE `admin_pages` DISABLE KEYS */;

INSERT INTO `admin_pages` (`id`, `admin_menu_id`, `page_name`, `access_type`, `status`, `del_flg`, `del_user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'メニュー管理 閲覧 ページ','R',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(2,1,'メニュー管理 作成 ページ','C',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(3,1,'メニュー管理 更新 ページ','U',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(4,1,'メニュー管理 削除 ページ','D',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(5,2,'ページ管理 閲覧 ページ','R',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(6,2,'ページ管理 作成 ページ','C',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(7,2,'ページ管理 更新 ページ','U',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(8,2,'ページ管理 削除 ページ','D',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(9,3,'ルート管理 閲覧 ページ','R',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(10,3,'ルート管理 作成 ページ','C',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(11,3,'ルート管理 更新 ページ','U',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(12,3,'ルート管理 削除 ページ','D',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(13,4,'役割管理 閲覧 ページ','R',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(14,4,'役割管理 作成 ページ','C',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(15,4,'役割管理 更新 ページ','U',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(16,4,'役割管理 削除 ページ','D',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(17,5,'権限管理 閲覧 ページ','R',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(18,5,'権限管理 作成 ページ','C',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(19,5,'権限管理 更新 ページ','U',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(20,5,'権限管理 削除 ページ','D',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(21,6,'アカウント管理 閲覧 ページ','R',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(22,6,'アカウント管理 作成 ページ','C',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(23,6,'アカウント管理 更新 ページ','U',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(24,6,'アカウント管理 削除 ページ','D',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(25,7,'メニュー管理 閲覧 ページ','R',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(26,7,'メニュー管理 作成 ページ','C',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(27,7,'メニュー管理 更新 ページ','U',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(28,7,'メニュー管理 削除 ページ','D',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(29,8,'企業管理 閲覧 ページ','R',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(30,8,'企業管理 作成 ページ','C',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(31,8,'企業管理 更新 ページ','U',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(32,8,'企業管理 削除 ページ','D',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(33,9,'店舗管理 閲覧 ページ','R',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(34,9,'店舗管理 作成 ページ','C',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(35,9,'店舗管理 更新 ページ','U',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(36,9,'店舗管理 削除 ページ','D',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(37,10,'代理店管理 閲覧 ページ','R',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(38,10,'代理店管理 作成 ページ','C',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(39,10,'代理店管理 更新 ページ','U',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(40,10,'代理店管理 削除 ページ','D',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(41,11,'商品管理 閲覧 ページ','R',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(42,11,'商品管理 作成 ページ','C',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(43,11,'商品管理 更新 ページ','U',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(44,11,'商品管理 削除 ページ','D',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(45,12,'お問い合わせ管理 閲覧 ページ','R',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(46,12,'お問い合わせ管理 作成 ページ','C',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(47,12,'お問い合わせ管理 更新 ページ','U',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37'),
	(48,12,'お問い合わせ管理 削除 ページ','D',0,0,NULL,'2020-03-07 06:56:37','2020-03-07 06:56:37');

/*!40000 ALTER TABLE `admin_pages` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ admin_role_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_pages`;

CREATE TABLE `admin_role_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_role_id` bigint(20) unsigned NOT NULL,
  `admin_page_id` bigint(20) unsigned NOT NULL,
  `accessible_flg` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=not accessible, 1=accessible',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `del_flg` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `del_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_admin_role_id` (`admin_role_id`),
  KEY `admin_menu_id` (`admin_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `admin_role_pages` WRITE;
/*!40000 ALTER TABLE `admin_role_pages` DISABLE KEYS */;

INSERT INTO `admin_role_pages` (`id`, `admin_role_id`, `admin_page_id`, `accessible_flg`, `status`, `del_flg`, `del_user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,1,1,0,0,NULL,'2020-03-07 07:37:00','2020-03-07 07:37:00'),
	(2,1,2,1,0,0,NULL,'2020-03-07 07:37:56','2020-03-07 07:37:56'),
	(3,1,3,1,0,0,NULL,'2020-03-07 07:38:02','2020-03-07 07:38:02'),
	(4,1,4,1,0,0,NULL,'2020-03-07 07:38:07','2020-03-07 07:38:07'),
	(5,1,5,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(6,1,6,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(7,1,7,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(8,1,8,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(9,1,9,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(10,1,10,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(11,1,11,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(12,1,12,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(13,1,13,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(14,1,14,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(15,1,15,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(16,1,16,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(17,1,17,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(18,1,18,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(19,1,19,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(20,1,20,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(21,1,21,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(22,1,22,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(23,1,23,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(24,1,24,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(25,1,25,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(26,1,26,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(27,1,27,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(28,1,28,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(29,1,29,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(30,1,30,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(31,1,31,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(32,1,32,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(33,1,33,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(34,1,34,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(35,1,35,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(36,1,36,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(37,1,37,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(38,1,38,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(39,1,39,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(40,1,40,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(41,1,41,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(42,1,42,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(43,1,43,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(44,1,44,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(45,1,45,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(46,1,46,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(47,1,47,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(48,1,48,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(49,2,1,1,0,0,NULL,'2020-03-07 07:37:00','2020-03-07 07:37:00'),
	(50,2,5,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(51,2,9,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(52,2,13,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(53,2,17,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(54,2,21,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(55,2,25,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(56,2,29,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(57,2,33,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(58,2,37,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(59,2,41,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(60,2,45,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(61,3,1,1,0,0,NULL,'2020-03-07 07:37:00','2020-03-07 07:37:00'),
	(62,3,5,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(63,3,9,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(64,3,13,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(65,3,17,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(66,3,21,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(67,3,25,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(68,3,29,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(69,3,33,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(70,3,37,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(71,3,41,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(72,3,45,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(73,4,1,1,0,0,NULL,'2020-03-07 07:37:00','2020-03-07 07:37:00'),
	(74,4,5,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(75,4,9,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(76,4,13,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(77,4,17,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(78,4,21,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(79,4,25,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(80,4,29,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(81,4,33,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(82,4,37,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(83,4,41,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14'),
	(84,4,45,1,0,0,NULL,'2020-03-07 07:40:14','2020-03-07 07:40:14');

/*!40000 ALTER TABLE `admin_role_pages` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ admin_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_roles`;

CREATE TABLE `admin_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_account_type_id` bigint(20) unsigned NOT NULL,
  `role_name` varchar(20) DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `del_flg` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `del_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_admin_account_type_id` (`admin_account_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;

INSERT INTO `admin_roles` (`id`, `admin_account_type_id`, `role_name`, `status`, `del_flg`, `del_user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'マネージャー',0,0,NULL,'2020-03-07 05:36:08','2020-03-07 05:36:08'),
	(2,1,'営業',0,0,NULL,'2020-03-07 05:36:19','2020-03-07 05:36:19'),
	(3,1,'企画',0,0,NULL,'2020-03-07 05:36:25','2020-03-07 05:36:25'),
	(4,1,'運用',0,0,NULL,'2020-03-07 05:36:32','2020-03-07 05:36:32'),
	(5,2,'マネージャー',0,0,NULL,'2020-03-07 05:36:39','2020-03-07 05:36:39'),
	(6,2,'スタッフ',0,0,NULL,'2020-03-07 05:36:45','2020-03-07 05:36:45'),
	(7,3,'マネージャー',0,0,NULL,'2020-03-07 05:36:39','2020-03-07 05:36:39'),
	(8,3,'スタッフ',0,0,NULL,'2020-03-07 05:36:45','2020-03-07 05:36:45'),
	(9,4,'マネージャー',0,0,NULL,'2020-03-07 05:36:39','2020-03-07 05:36:39'),
	(10,4,'スタッフ',0,0,NULL,'2020-03-07 05:36:45','2020-03-07 05:36:45');

/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ admin_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_routes`;

CREATE TABLE `admin_routes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_page_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `route_name` varchar(50) DEFAULT NULL,
  `action_name` varchar(50) DEFAULT NULL,
  `url_pattern` varchar(255) DEFAULT NULL,
  `config_type` varchar(1) NOT NULL DEFAULT '1' COMMENT 'A=ACTION,R=ROUTE,U=U(Regular expression)',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `del_flg` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `del_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_admin_page_id` (`admin_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `admin_routes` WRITE;
/*!40000 ALTER TABLE `admin_routes` DISABLE KEYS */;

INSERT INTO `admin_routes` (`id`, `admin_page_id`, `route_name`, `action_name`, `url_pattern`, `config_type`, `status`, `del_flg`, `del_user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'menus_index',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(2,1,'menus_index_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(3,1,'menus_search',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(4,1,'menus_search_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(5,1,'menus_detail',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(6,2,'menus_create_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(7,2,'menus_create_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(8,2,'menus_create_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(9,2,'menus_create_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(10,3,'menus_edit_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(11,3,'menus_edit_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(12,3,'menus_edit_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(13,3,'menus_edit_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(14,4,'menus_delete_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(15,4,'menus_delete_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(16,4,'menus_delete_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(17,5,'pages_index',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(18,5,'pages_index_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(19,5,'pages_search',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(20,5,'pages_search_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(21,5,'pages_detail',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(22,6,'pages_create_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(23,6,'pages_create_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(24,6,'pages_create_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(25,6,'pages_create_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(26,7,'pages_edit_create',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(27,7,'pages_edit_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(28,7,'pages_edit_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(29,7,'pages_edit_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(30,8,'pages_delete_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(31,8,'pages_delete_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(32,8,'pages_delete_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(33,9,'routes_index',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(34,9,'routes_index_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(35,9,'routes_search',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(36,9,'routes_search_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(37,9,'routes_detail',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(38,10,'routes_create_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(39,10,'routes_create_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(40,10,'routes_create_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(41,10,'routes_create_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(42,11,'routes_edit_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(43,11,'routes_edit_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(44,11,'routes_edit_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(45,11,'routes_edit_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(46,12,'routes_delete_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(47,12,'routes_delete_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(48,12,'routes_delete_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(49,13,'roles_index',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(50,13,'roles_index_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(51,13,'roles_search',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(52,13,'roles_search_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(53,13,'roles_detail',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(54,14,'roles_create_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(55,14,'roles_create_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(56,14,'roles_create_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(57,14,'roles_create_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(58,15,'roles_edit_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(59,15,'roles_edit_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(60,15,'roles_edit_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(61,15,'roles_edit_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(62,16,'roles_delete_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(63,16,'roles_delete_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(64,16,'roles_delete_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(65,17,'authenticates_index',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(66,17,'authenticates_index_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(67,17,'authenticates_search',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(68,17,'authenticates_search_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(69,17,'authenticates_detail',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(70,18,'authenticates_create_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(71,18,'authenticates_create_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(72,18,'authenticates_create_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(73,18,'authenticates_create_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(74,19,'authenticates_edit_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(75,19,'authenticates_edit_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(76,19,'authenticates_edit_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(77,19,'authenticates_edit_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(78,20,'authenticates_delete_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(79,20,'authenticates_delete_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(80,20,'authenticates_delete_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(81,21,'accounts_index',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(82,21,'accounts_index_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(83,21,'accounts_search',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(84,21,'accounts_search_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(85,21,'accounts_detail',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(86,22,'accounts_create_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(87,22,'accounts_create_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(88,22,'accounts_create_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(89,22,'accounts_create_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(90,23,'accounts_edit_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(91,23,'accounts_edit_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(92,23,'accounts_edit_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(93,23,'accounts_edit_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(94,24,'accounts_delete_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(95,24,'accounts_delete_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(96,24,'accounts_delete_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(97,25,'menus_index',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(98,25,'menus_index_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(99,25,'menus_search',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(100,25,'menus_search_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(101,25,'menus_detail',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(102,26,'menus_create_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(103,26,'menus_create_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(104,26,'menus_create_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(105,26,'menus_create_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(106,27,'menus_edit_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(107,27,'menus_edit_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(108,27,'menus_edit_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(109,27,'menus_edit_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(110,28,'menus_delete_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(111,28,'menus_delete_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(112,28,'menus_delete_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(113,29,'companies_index',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(114,29,'companies_index_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(115,29,'companies_search',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(116,29,'companies_search_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(117,29,'companies_detail',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(118,30,'companies_create_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(119,30,'companies_create_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(120,30,'companies_create_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(121,30,'companies_create_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(122,31,'companies_edit_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(123,31,'companies_edit_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(124,31,'companies_edit_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(125,31,'companies_edit_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(126,32,'companies_delete_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(127,32,'companies_delete_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(128,32,'companies_delete_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(129,33,'shops_index',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(130,33,'shops_index_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(131,33,'shops_search',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(132,33,'shops_search_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(133,33,'shops_detail',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(134,34,'shops_create_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(135,34,'shops_create_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(136,34,'shops_create_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(137,34,'shops_create_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(138,35,'shops_edit_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(139,35,'shops_edit_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(140,35,'shops_edit_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(141,35,'shops_edit_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(142,36,'shops_delete_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(143,36,'shops_delete_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(144,36,'shops_delete_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(145,37,'agencies_index',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(146,37,'agencies_index_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(147,37,'agencies_search',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(148,37,'agencies_search_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(149,37,'agencies_detail',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(150,38,'agencies_create_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(151,38,'agencies_create_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(152,38,'agencies_create_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(153,38,'agencies_create_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(154,39,'agencies_edit_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(155,39,'agencies_edit_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(156,39,'agencies_edit_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(157,39,'agencies_edit_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(158,40,'agencies_delete_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(159,40,'agencies_delete_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(160,40,'agencies_delete_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(161,41,'items_index',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(162,41,'items_index_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(163,41,'items_search',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(164,41,'items_search_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(165,41,'items_detail',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(166,42,'items_create_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(167,42,'items_create_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(168,42,'items_create_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(169,42,'items_create_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(170,43,'items_edit_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(171,43,'items_edit_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(172,43,'items_edit_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(173,43,'items_edit_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(174,44,'items_delete_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(175,44,'items_delete_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(176,44,'items_delete_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(177,45,'inquiries_index',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(178,45,'inquiries_index_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(179,45,'inquiries_search',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(180,45,'inquiries_search_page',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(181,45,'inquiries_detail',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(182,46,'inquiries_create_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(183,46,'inquiries_create_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(184,46,'inquiries_create_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(185,46,'inquiries_create_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(186,47,'inquiries_edit_entry',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(187,47,'inquiries_edit_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(188,47,'inquiries_edit_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(189,47,'inquiries_edit_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(190,48,'inquiries_delete_confirm',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(191,48,'inquiries_delete_complete',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30'),
	(192,48,'inquiries_delete_done',NULL,NULL,'1',0,0,NULL,'2020-03-07 11:42:30','2020-03-07 11:42:30');

/*!40000 ALTER TABLE `admin_routes` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
