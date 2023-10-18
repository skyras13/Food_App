-- phpMyAdmin SQL Dump
-- version 3.3.7deb11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 25, 2023 at 11:19 AM
-- Server version: 5.1.73
-- PHP Version: 5.3.3-7+squeeze29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `elearn`
--

-- --------------------------------------------------------

--
-- Table structure for table `ao_admin_users`
--

CREATE TABLE IF NOT EXISTS `ao_admin_users` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `aNumber` varchar(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'Observer',
  `register` varchar(5) NOT NULL DEFAULT 'no',
  `email` varchar(100) NOT NULL,
  `staff` varchar(4) NOT NULL DEFAULT 'no',
  `assignment` varchar(4) NOT NULL DEFAULT 'no',
  `grade` varchar(4) NOT NULL DEFAULT 'no',
  `course_id` int(12) NOT NULL,
  `inst` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `ao_admin_users`
--



-- --------------------------------------------------------

--
-- Table structure for table `ao_cron_queue`
--

CREATE TABLE IF NOT EXISTS `ao_cron_queue` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `userID` int(12) NOT NULL,
  `state` int(1) NOT NULL DEFAULT '0',
  `inst` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ao_cron_queue`
--


-- --------------------------------------------------------

--
-- Table structure for table `ao_custom_notification`
--

CREATE TABLE IF NOT EXISTS `ao_custom_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(50) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `inst` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ao_custom_notification`
--

-- --------------------------------------------------------

--
-- Table structure for table `ao_default_sport`
--

CREATE TABLE IF NOT EXISTS `ao_default_sport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `ao_default_sport`
--

INSERT INTO `ao_default_sport` (`id`, `name`, `code`) VALUES
(2, 'Baseball', 'BB'),
(3, 'Basketball M', 'BKM'),
(4, 'Basketball W', 'BKW'),
(5, 'Cross Country W', 'CCW'),
(6, 'Football', 'FT'),
(7, 'Golf M', 'GFM'),
(8, 'Gymnastics', 'GY'),
(9, 'Lacrosse M', 'LSM'),
(10, 'Skiing M/W', 'SKMW'),
(11, 'Soccer W', 'SCW'),
(12, 'Softball ', 'SB'),
(13, 'Swimming and Diving M', 'SDM'),
(14, 'Swimming and Diving W', 'SDW'),
(15, 'Tennis M', 'TSM'),
(16, 'Tennis W', 'TSW'),
(17, 'Track and Field W', 'TFW'),
(18, 'Volleyball', 'VB'),
(19, 'Beach Volleyball', 'BV');

-- --------------------------------------------------------

--
-- Table structure for table `ao_flags`
--

CREATE TABLE IF NOT EXISTS `ao_flags` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `studentID` int(12) NOT NULL,
  `observer` int(1) NOT NULL DEFAULT '0',
  `assignment` int(1) NOT NULL DEFAULT '0',
  `system` int(2) NOT NULL DEFAULT '0',
  `flagedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ao_flags`
--
-- --------------------------------------------------------

--
-- Table structure for table `ao_grade_check_report`
--

CREATE TABLE IF NOT EXISTS `ao_grade_check_report` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `inst` varchar(100) NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ao_grade_check_report`
--


-- --------------------------------------------------------

--
-- Table structure for table `ao_grade_treshhole`
--

CREATE TABLE IF NOT EXISTS `ao_grade_treshhole` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `operator` varchar(10) NOT NULL DEFAULT 'below',
  `grade` varchar(12) NOT NULL,
  `inst` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ao_grade_treshhole`
--

-- --------------------------------------------------------

--
-- Table structure for table `ao_institutions`
--

CREATE TABLE IF NOT EXISTS `ao_institutions` (
  `id` int(10) unsigned NOT NULL,
  `developer_id` varchar(64) NOT NULL,
  `developer_key` varchar(128) NOT NULL DEFAULT '',
  `consumer_key` varchar(128) NOT NULL DEFAULT '',
  `shared_secret` varchar(128) NOT NULL DEFAULT '',
  `canvas_domain` varchar(128) NOT NULL DEFAULT '',
  `vanity_url` varchar(128) DEFAULT NULL,
  `metadata` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ao_institutions`
--

-- --------------------------------------------------------

--
-- Table structure for table `ao_inst_global_settings`
--

CREATE TABLE IF NOT EXISTS `ao_inst_global_settings` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `inst` varchar(124) NOT NULL,
  `course_id` int(12) NOT NULL,
  `notifications` varchar(4) NOT NULL DEFAULT 'no',
  `announcements` varchar(4) NOT NULL,
  `syllabus` varchar(3) NOT NULL DEFAULT 'no',
  `addedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ao_inst_global_settings`
--

-- --------------------------------------------------------

--
-- Table structure for table `ao_logs`
--

CREATE TABLE IF NOT EXISTS `ao_logs` (
  `id` int(10) unsigned NOT NULL,
  `type` varchar(32) DEFAULT NULL,
  `message` text,
  `severity` varchar(32) DEFAULT NULL,
  `location` varchar(256) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `metadata` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ao_logs`
--
-- --------------------------------------------------------

--
-- Table structure for table `ao_register_students`
--

CREATE TABLE IF NOT EXISTS `ao_register_students` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `aNumber` text NOT NULL,
  `sportID` int(12) NOT NULL,
  `name` text NOT NULL,
  `tracking_course` int(12) NOT NULL,
  `inst` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=794 ;

--
-- Dumping data for table `ao_register_students`
--
-- --------------------------------------------------------

--
-- Table structure for table `ao_sports`
--

CREATE TABLE IF NOT EXISTS `ao_sports` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `code` varchar(5) DEFAULT NULL,
  `inst` varchar(100) NOT NULL,
  `course_id` int(12) NOT NULL,
  `sportID` int(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `ao_sports`
--

-- --------------------------------------------------------

--
-- Table structure for table `ao_student_list`
--

CREATE TABLE IF NOT EXISTS `ao_student_list` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(20) NOT NULL,
  `observer_id` varchar(20) NOT NULL,
  `flag` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ao_student_list`
--


-- --------------------------------------------------------

--
-- Table structure for table `ao_terms`
--

CREATE TABLE IF NOT EXISTS `ao_terms` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `termID` varchar(25) NOT NULL,
  `termName` varchar(100) NOT NULL,
  `state` varchar(10) NOT NULL DEFAULT 'active',
  `course_id` int(12) NOT NULL,
  `inst` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `ao_terms`
--

-- --------------------------------------------------------

--
-- Table structure for table `ao_users`
--

CREATE TABLE IF NOT EXISTS `ao_users` (
  `canvas_user_id` int(10) unsigned NOT NULL,
  `canvas_domain` varchar(128) NOT NULL DEFAULT '',
  `api_key` varchar(256) NOT NULL DEFAULT '',
  `refresh_token` varchar(128) NOT NULL DEFAULT '',
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ao_users`
--
