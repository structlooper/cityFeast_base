-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 26, 2020 at 04:05 AM
-- Server version: 5.7.32
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin_cityfeast`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `owner`
-- (See below for the actual view)
--
CREATE TABLE `owner` (
`id` int(11)
,`name` varchar(255)
,`phone` varchar(255)
,`email` varchar(255)
,`address` varchar(255)
,`pincode` varchar(255)
,`country_id` int(11)
,`state_id` int(11)
,`city_id` int(11)
,`latitude` varchar(255)
,`longitude` varchar(255)
,`owner_id` int(11)
,`opening_time` time
,`closing_time` time
,`is_available` tinyint(2)
,`status` tinyint(2)
,`created` datetime
,`updated` datetime
,`banner_image` varchar(255)
,`profile_image` text
,`discount` float(16,2)
,`discount_type` tinyint(2)
,`average_price` float(16,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `email`, `first_name`, `last_name`, `password`, `phone`, `image`, `status`, `created`, `updated`) VALUES
(1, 'admin%40cityfeast.com', 'Master', 'Admin', 'e10adc3949ba59abbe56e057f20f883e', '1234561234', '', 1, '2019-07-14 15:06:58', '2020-08-10 00:01:46');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE `tbl_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_categories`
--

INSERT INTO `tbl_categories` (`id`, `title`, `image`, `status`, `created`, `updated`) VALUES
(1, 'Chinese+Food', '1606301679809.jpg', 1, '2020-11-25 16:24:39', '0000-00-00 00:00:00'),
(2, 'Cakes', '1606376643825.jpg', 1, '2020-11-26 13:14:02', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_city`
--

CREATE TABLE `tbl_city` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `state_id` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_city`
--

INSERT INTO `tbl_city` (`id`, `name`, `state_id`, `status`, `created`, `updated`) VALUES
(1, 'Heaven', 1, 1, '2020-11-07 16:52:02', '2020-11-07 16:52:16'),
(2, 'Hyderabad', 2, 1, '2020-11-09 12:33:40', '2020-11-09 12:36:07'),
(3, 'Gurgaon', 3, 1, '2020-11-25 16:27:02', '2020-11-25 16:27:02');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

CREATE TABLE `tbl_country` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_country`
--

INSERT INTO `tbl_country` (`id`, `name`, `status`, `created`, `updated`) VALUES
(1, 'india', 1, '2020-11-07 16:47:11', '2020-11-07 16:47:11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupons`
--

CREATE TABLE `tbl_coupons` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `discount_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0=>flat amount, 1=>percentage',
  `discount` float(8,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `resaturant_ids` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_coupons`
--

INSERT INTO `tbl_coupons` (`id`, `coupon_code`, `description`, `discount_type`, `discount`, `start_date`, `end_date`, `resaturant_ids`, `image`, `status`, `created`, `updated`) VALUES
(1, 'sdaf', 'sdafdsffffffffffffffffffffffffffffffffffffffffffffffffffffffffff+dsf+dsf', 0, 0.00, '2020-11-13', '2020-11-18', '', '', 1, '2020-11-07 16:44:08', '2020-11-07 16:44:08');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_device_token`
--

CREATE TABLE `tbl_device_token` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `device_token` text NOT NULL,
  `is_last_login` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1=>last login token, 0=>previous login token',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_device_token`
--

INSERT INTO `tbl_device_token` (`id`, `user_id`, `device_token`, `is_last_login`, `status`, `created`, `updated`) VALUES
(1, 1, 'eZd30Dx2V9Q:APA91bExocGFhAU4N9uDFnXBcJpEKfsJAXsRnUa10qtcQLlymNnxS_zg1P8XCU6GyFBX_A0wVneYnSpx_5MiGGNVwLaCADepFCBof61fut18EH-KnWwjT42Jdo68od-iUdyl4HA2bHwS', 1, 1, '2020-11-25 15:20:09', '2020-11-25 15:20:09'),
(2, 0, '1', 1, 1, '2020-11-25 15:46:17', '2020-11-25 15:46:17'),
(3, 2, 'eV99wIQpq4w:APA91bFhDT7XvUjT0xPDF5KD2aWsXLw74DezLukGpfLHT0Lxu6ENB2dfvWFKbMi0tQXl-C1Ngc850KsN-L8H7qgUAyQufgQ3BP8MCIeJYcnhnrpr3aclPfMm90tlgmizrCgC5sLPQEQV', 1, 1, '2020-11-25 15:56:50', '2020-11-25 15:56:50'),
(4, 3, 'c_bUy9XKGYs:APA91bFjGMWwaKik-bv7A20hgB8RcFyEPerUKlizrGGKZwcgZibo-CnKSm28v42-Jh5lj7Uh2H9WCc3kHqz02hRk21bshFxic94Hmk8GaR-89X-BFvd2zMfI9h_lf4OLjHrnahGQPM2o', 0, 1, '2020-11-25 16:15:45', '2020-11-26 13:36:37'),
(5, 3, 'Iv76Pn', 0, 1, '2020-11-25 17:28:13', '2020-11-26 13:36:37'),
(6, 3, 'dgi5yOIr7Eo:APA91bGiJx6PGVvqFnSZp4OY2DUnRvOBj_G_51EaYtrsloHO41QcPp8Z1P7Dc4IxNE8YPGP1fj6Edl4fYu5EHTGhHJ0vXVYtVr3nQ03vTbNzJAALwaDb0LtYxPz3_-vVazp5mNQGSsBU', 0, 1, '2020-11-25 17:31:08', '2020-11-26 13:36:37'),
(7, 3, 'f460ALZ4o4c:APA91bFQgaQ_I963f2zw3DAIvOgKA3TV2oI1va1zOi1k23LnP_3T5aY3k594EgPrAyl1D0rgvaARuAi3m0J9g-iC1iCYvQPjCxtB7IeadrLu90jasRC9ODPeumTr6-zI-puBnHxkFZVY', 1, 1, '2020-11-26 13:36:37', '2020-11-26 13:36:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_drivers_review`
--

CREATE TABLE `tbl_drivers_review` (
  `id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `review` decimal(10,1) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver_orders`
--

CREATE TABLE `tbl_driver_orders` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `driver_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0=>Assigned, 1=>accepted, 2=>rejected',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_earnings`
--

CREATE TABLE `tbl_earnings` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `restaurent_id` int(11) NOT NULL,
  `admin_charge_amount` float(16,2) NOT NULL,
  `owners_amount` float(16,2) NOT NULL,
  `total_amount` float(16,2) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `payment_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0=>pending, 1=>Paid',
  `payment_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_earnings`
--

INSERT INTO `tbl_earnings` (`id`, `order_id`, `restaurent_id`, `admin_charge_amount`, `owners_amount`, `total_amount`, `status`, `created`, `payment_status`, `payment_date`) VALUES
(1, 1, 2, 86.00, 344.00, 450.00, 1, '2020-11-26 13:40:10', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification`
--

CREATE TABLE `tbl_notification` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0=>admin, 1=>order.',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_notification`
--

INSERT INTO `tbl_notification` (`id`, `title`, `description`, `status`, `created`, `updated`, `type`, `type_id`, `user_id`) VALUES
(1, 'Order+Placed', 'Your+order+has+been+placed+successfully.', 1, '2020-11-26 13:40:10', '2020-11-26 13:40:10', 1, 1, 0),
(2, 'Order+Received', 'Congratulations%21%21%2C+You+received+new+order.', 1, '2020-11-26 13:40:10', '2020-11-26 13:40:10', 3, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `restaurent_id` int(11) NOT NULL,
  `total_price` float(16,2) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `tip_price` float(16,2) NOT NULL,
  `discount_price` float(16,2) NOT NULL,
  `wallet_price` float(16,2) NOT NULL DEFAULT '0.00',
  `grand_total` float(16,2) NOT NULL DEFAULT '0.00',
  `payment_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1=> COD, 2=>Stripe, 3=>Paypal',
  `payment_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0=>pending, 1=>success, 2=>failed',
  `order_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1=>received, 2=>accepted, 3=>declined, 4=>on way, 5=>delivered',
  `signature` varchar(255) DEFAULT NULL,
  `isReviewed` tinyint(2) NOT NULL DEFAULT '0',
  `refund_amount` float(8,2) NOT NULL DEFAULT '0.00',
  `promo_code` varchar(30) NOT NULL,
  `admin_charge` float(8,2) NOT NULL DEFAULT '20.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`id`, `address_id`, `user_id`, `restaurent_id`, `total_price`, `status`, `created`, `updated`, `tip_price`, `discount_price`, `wallet_price`, `grand_total`, `payment_type`, `payment_status`, `order_status`, `signature`, `isReviewed`, `refund_amount`, `promo_code`, `admin_charge`) VALUES
(1, 2, 3, 2, 450.00, 1, '2020-11-26 13:40:10', '2020-11-26 13:40:10', 0.00, 0.00, 0.00, 450.00, 1, 1, 1, NULL, 0, 0.00, '', 20.00);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_price` float(16,2) NOT NULL,
  `extra_note` text NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `product_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`id`, `order_id`, `product_id`, `product_price`, `extra_note`, `status`, `created`, `updated`, `product_quantity`) VALUES
(1, 1, 5, 450.00, '', 1, '2020-11-26 13:40:10', '2020-11-26 13:40:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_owner`
--

CREATE TABLE `tbl_owner` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `city_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `device_token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_owner`
--

INSERT INTO `tbl_owner` (`id`, `first_name`, `last_name`, `phone`, `email`, `password`, `image`, `reset_password_token`, `status`, `created`, `updated`, `city_id`, `state_id`, `country_id`, `pincode`, `address`, `device_token`) VALUES
(1, 'Owner', 'Pawan', '0000000001', 'owner%40cityfeast.com', 'e10adc3949ba59abbe56e057f20f883e', '#', '#', 1, '2020-11-26 16:55:06', '2020-11-09 13:57:36', 1, 1, 1, '000001', 'abcdefghijklmnopqurstuwxz', '#'),
(2, 'kumar', 'paradise', '8800476111', 'testparadise%40gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, 1, '2020-11-09 12:41:45', '2020-11-09 14:34:40', 2, 2, 1, '500003', 'SD+Road%2C+Sappu+Bagh+Apaprtment%2C+Jogani%2C+Ramgopalpet%2C+Secunderabad%2C+Telangana+500003%0D%0A', ''),
(3, 'SSoftwares', '+Food', '9876543210', 'abc%40ssoftware.com', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, 1, '2020-11-25 16:34:49', '2020-11-25 21:48:59', 3, 3, 1, '122004', 'Spaze+Itech%2C+Sohana+Road%2C+Gurgaon', 'fq-SIiWFRoiOw6fXU1TLF7:APA91bHEsO7xgDj1sND-xNgnkSRK-gFe6IcFe-eMEr8SOBeSTCh6FGLD-CnEuaufh0MjCd85Q2x4z593BwRCPTZRTrfzp2Z7DWz6Bzs8HyIGtFSp85G3hKErFdWjEluVqbn_RkHqGFQE');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_restaurants`
--

CREATE TABLE `tbl_restaurants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `opening_time` time NOT NULL,
  `closing_time` time NOT NULL,
  `is_available` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1=>Available, 0=>Unavailable',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `banner_image` varchar(255) NOT NULL,
  `profile_image` text NOT NULL,
  `discount` float(16,2) NOT NULL DEFAULT '0.00',
  `discount_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0==>flat value, 1=>percentage',
  `average_price` float(16,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_restaurants`
--

INSERT INTO `tbl_restaurants` (`id`, `name`, `phone`, `email`, `address`, `pincode`, `country_id`, `state_id`, `city_id`, `latitude`, `longitude`, `owner_id`, `opening_time`, `closing_time`, `is_available`, `status`, `created`, `updated`, `banner_image`, `profile_image`, `discount`, `discount_type`, `average_price`) VALUES
(1, 'Restaurant+A', '1234567890', 'raerdfasdadsaas%40gmail.com', 'Sohna+Rd%2C+Block+S%2C+fazilpur+chowk%2C+Sector+48%2C+Gurugram%2C+Haryana+122018', '122004', 1, 3, 3, '28.4115898', '77.0422801', 3, '10:00:00', '23:00:00', 1, 1, '2020-11-25 16:46:03', '2020-11-25 16:46:03', '', '1606302964821.jpg', 20.00, 0, 0.00),
(2, 'Restaurant+B', '0987654321', 'email%40email.com', 'sohana+road', '122004', 1, 3, 3, '28.4296079', '77.0368306', 3, '10:00:00', '23:00:00', 1, 1, '2020-11-25 21:55:25', NULL, '', '5fbe8575c2854.jpg', 40.00, 0, 300.00);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_restaurants_review`
--

CREATE TABLE `tbl_restaurants_review` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `review` decimal(10,1) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int(11) NOT NULL,
  `website_name` varchar(255) NOT NULL,
  `website_logo` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `map_api_key` varchar(255) NOT NULL,
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_username` varchar(255) NOT NULL,
  `smtp_password` varchar(255) NOT NULL,
  `smpt_from_email` varchar(255) NOT NULL,
  `smtp_from_name` varchar(255) NOT NULL,
  `fcm_key` varchar(255) NOT NULL,
  `stripe_private_key` varchar(255) NOT NULL,
  `stripe_publish_key` varchar(255) NOT NULL,
  `braintree_environment` varchar(255) NOT NULL,
  `braintree_merchant_id` varchar(255) NOT NULL,
  `braintree_public_key` varchar(255) NOT NULL,
  `braintree_private_key` varchar(255) NOT NULL,
  `charge_from_owner` float(18,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'USD',
  `cancellation_charge` float(5,2) NOT NULL DEFAULT '10.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `website_name`, `website_logo`, `phone`, `email`, `map_api_key`, `smtp_host`, `smtp_port`, `smtp_username`, `smtp_password`, `smpt_from_email`, `smtp_from_name`, `fcm_key`, `stripe_private_key`, `stripe_publish_key`, `braintree_environment`, `braintree_merchant_id`, `braintree_public_key`, `braintree_private_key`, `charge_from_owner`, `status`, `created`, `updated`, `currency`, `cancellation_charge`) VALUES
(1, 'CityFeast', '160464634992.png', '', '', 'AIzaSyA0ztr7esW-B9pyRKUYEa5d8CxLPnCdtdA', 'smtp.gmail.com', 587, '', '', '', 'CityFeast', '', '', '', 'sandbox', '', '', '', 20.00, 1, '0000-00-00 00:00:00', '2020-11-25 16:45:22', 'USD', 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_state`
--

CREATE TABLE `tbl_state` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_state`
--

INSERT INTO `tbl_state` (`id`, `name`, `country_id`, `status`, `created`, `updated`) VALUES
(1, 'Dehradun', 1, 1, '2020-11-07 16:51:36', '2020-11-07 16:51:36'),
(2, 'Telangana', 1, 1, '2020-11-09 12:33:25', '2020-11-09 12:33:25'),
(3, 'Haryana', 1, 1, '2020-11-25 16:26:49', '2020-11-25 16:26:49');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategories`
--

CREATE TABLE `tbl_subcategories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1=>veg, 2=>non-veg',
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `discount_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0=>flat amount, 1=>percentage',
  `discount` float(16,2) NOT NULL,
  `price` float(16,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_subcategories`
--

INSERT INTO `tbl_subcategories` (`id`, `category_id`, `restaurant_id`, `title`, `type`, `description`, `image`, `discount_type`, `discount`, `price`, `status`, `created`, `updated`) VALUES
(1, 1, 1, 'Subcategory+1', 1, 'Test+Description', '1606303030220.jpg', 0, 0.00, 200.00, 1, '2020-11-25 16:47:10', '2020-11-25 16:47:10'),
(2, 1, 1, 'Test+Product', 2, 'ABCD', '5fbe846237d93.png', 0, 20.00, 320.00, 1, '2020-11-25 21:50:50', '0000-00-00 00:00:00'),
(3, 1, 2, 'Tea', 2, 'ABCD', '5fbf3e9e39224.png', 0, 5.00, 20.00, 1, '2020-11-26 11:05:26', '0000-00-00 00:00:00'),
(4, 2, 1, 'Chocolate+Birthday+Cake', 2, '1+pound', '5fbf5d1975ffa.png', 0, 10.00, 500.00, 1, '2020-11-26 13:15:29', '0000-00-00 00:00:00'),
(5, 2, 2, 'Birthday+cakes', 1, '6+pounds', '5fbf60fc30f70.png', 1, 20.00, 450.00, 1, '2020-11-26 13:32:04', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` bigint(20) NOT NULL,
  `is_social_login` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0=>normal login, 1=>facebook, 2=>google',
  `social_id` varchar(255) NOT NULL DEFAULT '',
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0=>inactive, 1=>active, 2=>deleted',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `otp` varchar(255) NOT NULL,
  `user_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1=>customer, 2=>driver',
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `identity_number` varchar(255) DEFAULT NULL,
  `identity_image` varchar(255) DEFAULT NULL,
  `license_number` varchar(255) DEFAULT NULL,
  `license_image` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `device_token` varchar(255) DEFAULT NULL,
  `is_available` tinyint(2) DEFAULT '0' COMMENT '0=>unavailable, 1)Avainlable',
  `wallet_amount` float(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `is_social_login`, `social_id`, `fullname`, `email`, `password`, `phone`, `token`, `image`, `status`, `created`, `updated`, `last_login_date`, `otp`, `user_type`, `latitude`, `longitude`, `identity_number`, `identity_image`, `license_number`, `license_image`, `gender`, `age`, `date_of_birth`, `city_id`, `state_id`, `country_id`, `pincode`, `address`, `device_token`, `is_available`, `wallet_amount`) VALUES
(3, 0, '', 'Anubhav', 'anubhavanand884%40gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '1234567890', 'Iv76Pn', '', 1, '2020-11-25 16:02:06', '2020-11-25 16:02:06', NULL, '', 1, '28.4124193', '77.04328099999998', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00),
(4, 0, '', 'Test+Driver', 'testdriver%40gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '1234567890', NULL, '', 1, '2020-11-25 18:14:25', '2020-11-25 21:42:55', NULL, '', 2, '28.4905194', '77.0972743', '001', '1606308266866.png', '002', '1606308266478.jpg', 'Male', NULL, '1987-11-12', 3, 3, 1, '122004', '212-207%2C+Lokpath+St%2C+Block+S%2C+Uppal+Southend%2C+Sector+49%2C+Gurugram%2C+Haryana+122018', 'cQGFyQ8-0O0:APA91bETH8bAS5U9qpquIt7laUbLuBk4KzmtqFHyx39asEDGYwV3UB-EmdYQ8fNJdoL-VDHZaH2pz_F0YFpxKm0QS3VhGaqdNzqsgaPT7UJgBVq-4f2R8T09e_4N8hy82vPwNQkfvP3u', 1, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_addresses`
--

CREATE TABLE `tbl_user_addresses` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `address_line_1` varchar(255) NOT NULL,
  `address_line_2` varchar(255) NOT NULL,
  `pincode` varchar(30) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `isDefault` tinyint(2) NOT NULL DEFAULT '0',
  `address_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0=>home, 1=>office, 2=>other'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_addresses`
--

INSERT INTO `tbl_user_addresses` (`id`, `user_id`, `name`, `phone`, `city`, `state`, `country`, `address_line_1`, `address_line_2`, `pincode`, `latitude`, `longitude`, `status`, `created`, `updated`, `isDefault`, `address_type`) VALUES
(1, 3, 'Anubhav', '9876543210', 'Gurugram', 'Haryana', 'India', '465%2C+4th+Floor%2C+Tower+B1%2C+Spaze+iTechPark%2C+Sohna+Rd%2C+Sector+49%2C+Gurugram%2C+Haryana+122018%2C+India', 'Sohna+Road', '122004', '28.4124271', '77.04328129999999', 1, '2020-11-25 18:10:39', '2020-11-25 18:10:39', 0, 0),
(2, 0, 'Anubhav', '1234567890', 'Gurugram', 'Haryana', 'India', '265-A%2C+Tower+B-1%2C+Spaze+I-Tech+Park%2C+Sohna+Rd%2C+Sector+49%2C+Gurugram%2C+Haryana+122018%2C+India', 'Sohna+Road', '12204', '28.4124465', '77.04327810000001', 1, '2020-11-26 13:38:23', '2020-11-26 13:38:23', 0, 0);

-- --------------------------------------------------------

--
-- Structure for view `owner`
--
DROP TABLE IF EXISTS `owner`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `owner`  AS  select `tbl_restaurants`.`id` AS `id`,`tbl_restaurants`.`name` AS `name`,`tbl_restaurants`.`phone` AS `phone`,`tbl_restaurants`.`email` AS `email`,`tbl_restaurants`.`address` AS `address`,`tbl_restaurants`.`pincode` AS `pincode`,`tbl_restaurants`.`country_id` AS `country_id`,`tbl_restaurants`.`state_id` AS `state_id`,`tbl_restaurants`.`city_id` AS `city_id`,`tbl_restaurants`.`latitude` AS `latitude`,`tbl_restaurants`.`longitude` AS `longitude`,`tbl_restaurants`.`owner_id` AS `owner_id`,`tbl_restaurants`.`opening_time` AS `opening_time`,`tbl_restaurants`.`closing_time` AS `closing_time`,`tbl_restaurants`.`is_available` AS `is_available`,`tbl_restaurants`.`status` AS `status`,`tbl_restaurants`.`created` AS `created`,`tbl_restaurants`.`updated` AS `updated`,`tbl_restaurants`.`banner_image` AS `banner_image`,`tbl_restaurants`.`profile_image` AS `profile_image`,`tbl_restaurants`.`discount` AS `discount`,`tbl_restaurants`.`discount_type` AS `discount_type`,`tbl_restaurants`.`average_price` AS `average_price` from `tbl_restaurants` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_city`
--
ALTER TABLE `tbl_city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_country`
--
ALTER TABLE `tbl_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_coupons`
--
ALTER TABLE `tbl_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_device_token`
--
ALTER TABLE `tbl_device_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_drivers_review`
--
ALTER TABLE `tbl_drivers_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_driver_orders`
--
ALTER TABLE `tbl_driver_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_earnings`
--
ALTER TABLE `tbl_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_owner`
--
ALTER TABLE `tbl_owner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_restaurants`
--
ALTER TABLE `tbl_restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_restaurants_review`
--
ALTER TABLE `tbl_restaurants_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_state`
--
ALTER TABLE `tbl_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_subcategories`
--
ALTER TABLE `tbl_subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_addresses`
--
ALTER TABLE `tbl_user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_city`
--
ALTER TABLE `tbl_city`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_country`
--
ALTER TABLE `tbl_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_coupons`
--
ALTER TABLE `tbl_coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_device_token`
--
ALTER TABLE `tbl_device_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_drivers_review`
--
ALTER TABLE `tbl_drivers_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_driver_orders`
--
ALTER TABLE `tbl_driver_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_earnings`
--
ALTER TABLE `tbl_earnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_owner`
--
ALTER TABLE `tbl_owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_restaurants`
--
ALTER TABLE `tbl_restaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_restaurants_review`
--
ALTER TABLE `tbl_restaurants_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_state`
--
ALTER TABLE `tbl_state`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_subcategories`
--
ALTER TABLE `tbl_subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_user_addresses`
--
ALTER TABLE `tbl_user_addresses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
