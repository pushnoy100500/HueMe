-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 10, 2016 at 05:05 PM
-- Server version: 5.5.44-0+deb8u1
-- PHP Version: 5.6.14-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Hueme`
--
CREATE DATABASE IF NOT EXISTS `Hueme` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Hueme`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
`id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `content` tinytext NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `posts_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `create_time`, `content`, `is_active`, `posts_id`, `users_id`) VALUES
(1, '2016-02-09 07:02:56', 'You suck, jackass!!!', 1, 2, 1),
(2, '2016-02-09 07:02:56', 'Be Happy! :)', 1, 2, 2),
(3, '2016-02-09 08:48:18', 'stop crying already', 1, 4, 5),
(4, '2016-02-09 08:48:18', 'great to hear', 1, 5, 2),
(7, '2016-02-09 08:50:40', 'stop crying already', 1, 4, 5),
(8, '2016-02-09 08:50:40', 'great to hear', 1, 5, 2),
(9, '2016-02-09 08:50:40', 'don''t know what else to put :(', 1, 14, 4);

-- --------------------------------------------------------

--
-- Table structure for table `mood_colours`
--

DROP TABLE IF EXISTS `mood_colours`;
CREATE TABLE IF NOT EXISTS `mood_colours` (
`id` int(11) NOT NULL,
  `colour` varchar(15) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mood_colours`
--

INSERT INTO `mood_colours` (`id`, `colour`) VALUES
(1, 'black'),
(2, 'blue'),
(3, 'orange'),
(4, 'red'),
(5, 'pink'),
(6, 'green');

-- --------------------------------------------------------

--
-- Table structure for table `notify`
--

DROP TABLE IF EXISTS `notify`;
CREATE TABLE IF NOT EXISTS `notify` (
  `id` int(11) NOT NULL,
  `IsRead` tinyint(1) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `post_id` int(11) DEFAULT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
`id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` tinytext NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `tags` varchar(50) DEFAULT NULL,
  `mood_colours_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='				';

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `create_time`, `content`, `is_active`, `tags`, `mood_colours_id`, `users_id`) VALUES
(1, '2016-02-09 06:59:25', 'this is an awesome post', 1, NULL, 2, 3),
(2, '2016-02-09 06:59:25', 'This post is negative :(', 1, NULL, 1, 2),
(3, '2016-02-09 07:04:30', 'Today Was so shitty!', 1, NULL, 2, 3),
(4, '2016-02-09 07:04:30', 'make this happen!', 1, NULL, 1, 3),
(5, '2016-02-09 08:40:36', 'what a tangled web we weive', 1, 'spider, snake', 4, 4),
(11, '2016-02-09 08:45:00', 'what a tangled web we weive', 1, 'hack, code', 3, 5),
(12, '2016-02-09 08:45:00', 'reply to this', 1, 'cat, dog', 5, 3),
(13, '2016-02-09 08:45:00', 'this is a really ndumb post', 1, 'hockey, basketball', 2, 4),
(14, '2016-02-09 08:45:00', 'LAMP is awesome', 1, 'computer, web development', 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `stat_history`
--

DROP TABLE IF EXISTS `stat_history`;
CREATE TABLE IF NOT EXISTS `stat_history` (
  `id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinytext,
  `users_id` int(11) NOT NULL,
  `mood_colours_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `photo_url` tinytext,
  `dob` date DEFAULT NULL,
  `description` tinytext,
  `gender` varchar(1) DEFAULT NULL,
  `status` tinytext,
  `country` varchar(45) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `access_level` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `mood_colours_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `create_time`, `photo_url`, `dob`, `description`, `gender`, `status`, `country`, `region`, `city`, `zip_code`, `access_level`, `is_active`, `mood_colours_id`) VALUES
(1, 'chaser', 'chae@me.com', '123456', '2016-02-09 06:48:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2),
(2, 'loopy', 'someone@something.com', '123456', '2016-02-09 06:48:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(3, 'ajax', 'ajax@php.net', '123456', '2016-02-09 06:58:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(4, 'QueryThis', 'j@query.ca', '123456', '2016-02-09 06:58:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2),
(5, 'Budah', 'Buddah@my20.ca', '123456', '2016-02-09 08:35:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(23, 'Price', 'price@right,com', '123456', '2016-02-09 08:36:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2),
(24, 'gogo', 'gp@my20.ca', '123456', '2016-02-09 08:36:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`id`,`users_id`), ADD KEY `fk_comments_posts1_idx` (`posts_id`), ADD KEY `fk_comments_users1_idx` (`users_id`);

--
-- Indexes for table `mood_colours`
--
ALTER TABLE `mood_colours`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notify`
--
ALTER TABLE `notify`
 ADD PRIMARY KEY (`id`,`users_id`), ADD KEY `fk_notify_users1_idx` (`users_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`id`,`mood_colours_id`,`users_id`), ADD KEY `fk_posts_mood_colours1_idx` (`mood_colours_id`), ADD KEY `fk_posts_users1_idx` (`users_id`);

--
-- Indexes for table `stat_history`
--
ALTER TABLE `stat_history`
 ADD PRIMARY KEY (`id`,`users_id`,`mood_colours_id`), ADD KEY `fk_stat_history_users1_idx` (`users_id`), ADD KEY `fk_stat_history_mood_colours1_idx` (`mood_colours_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`,`mood_colours_id`), ADD UNIQUE KEY `email_UNIQUE` (`email`), ADD UNIQUE KEY `username_UNIQUE` (`username`), ADD KEY `fk_users_mood_colours1_idx` (`mood_colours_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `mood_colours`
--
ALTER TABLE `mood_colours`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
ADD CONSTRAINT `fk_comments_posts1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_comments_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notify`
--
ALTER TABLE `notify`
ADD CONSTRAINT `fk_notify_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
ADD CONSTRAINT `fk_posts_mood_colours1` FOREIGN KEY (`mood_colours_id`) REFERENCES `mood_colours` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_posts_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_history`
--
ALTER TABLE `stat_history`
ADD CONSTRAINT `fk_stat_history_mood_colours1` FOREIGN KEY (`mood_colours_id`) REFERENCES `mood_colours` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_stat_history_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `fk_users_mood_colours` FOREIGN KEY (`mood_colours_id`) REFERENCES `mood_colours` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
