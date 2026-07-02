SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

-- Cache tables
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` VARCHAR(255) NOT NULL PRIMARY KEY,
  `value` TEXT NOT NULL,
  `expiration` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` VARCHAR(255) NOT NULL PRIMARY KEY,
  `owner` VARCHAR(255) NOT NULL,
  `expiration` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Clients
DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(50),
  `address` VARCHAR(255),
  `created_at` DATETIME,
  `updated_at` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Failed jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `uuid` VARCHAR(255) NOT NULL,
  `connection` TEXT NOT NULL,
  `queue` TEXT NOT NULL,
  `payload` LONGTEXT NOT NULL,
  `exception` LONGTEXT NOT NULL,
  `failed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Invoice items
DROP TABLE IF EXISTS `invoice_items`;
CREATE TABLE `invoice_items` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `invoice_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `unit_price` DECIMAL(10,2) NOT NULL,
  `quantity` INT NOT NULL,
  `discount` DECIMAL(10,2) NOT NULL DEFAULT 0,
  `tax` DECIMAL(10,2) NOT NULL DEFAULT 0,
  `subtotal` DECIMAL(15,2) NOT NULL,
  `total` DECIMAL(15,2) NOT NULL,
  `created_at` DATETIME,
  `updated_at` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Invoices
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `invoice_number` VARCHAR(50) NOT NULL,
  `client_name` VARCHAR(255) NOT NULL,
  `invoice_date` DATE NOT NULL,
  `driver` VARCHAR(255) NOT NULL,
  `vehicle` VARCHAR(255) NOT NULL,
  `notes` TEXT,
  `grand_total` DECIMAL(15,2) NOT NULL,
  `created_at` DATETIME,
  `updated_at` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Job batches
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `total_jobs` INT NOT NULL,
  `pending_jobs` INT NOT NULL,
  `failed_jobs` INT NOT NULL,
  `failed_job_ids` TEXT NOT NULL,
  `options` TEXT,
  `cancelled_at` INT,
  `created_at` INT NOT NULL,
  `finished_at` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `queue` VARCHAR(255) NOT NULL,
  `payload` LONGTEXT NOT NULL,
  `attempts` TINYINT UNSIGNED NOT NULL,
  `reserved_at` INT,
  `available_at` INT NOT NULL,
  `created_at` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `migration` VARCHAR(255) NOT NULL,
  `batch` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Password reset tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` VARCHAR(255) NOT NULL PRIMARY KEY,
  `token` VARCHAR(255) NOT NULL,
  `created_at` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Products
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `price` DECIMAL(10,2) NOT NULL,
  `created_at` DATETIME,
  `updated_at` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` VARCHAR(255) NOT NULL PRIMARY KEY,
  `user_id` INT,
  `ip_address` VARCHAR(45),
  `user_agent` TEXT,
  `payload` TEXT NOT NULL,
  `last_activity` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Users
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `email_verified_at` DATETIME,
  `password` VARCHAR(255) NOT NULL,
  `remember_token` VARCHAR(100),
  `created_at` DATETIME,
  `updated_at` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS=1;
