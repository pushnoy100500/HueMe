-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2016 at 07:42 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hueme`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `content` tinytext NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `posts_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `mood_colours` (
  `id` int(11) NOT NULL,
  `colour` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `notify` (
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

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` tinytext NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `tags` varchar(50) DEFAULT NULL,
  `mood_colours_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='				';

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
-- Table structure for table `session_record`
--

CREATE TABLE `session_record` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `last_activity` int(10) NOT NULL,
  `data` blob NOT NULL,
  `timestamp` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session_record`
--

INSERT INTO `session_record` (`id`, `ip_address`, `user_agent`, `last_activity`, `data`, `timestamp`) VALUES
('1', '::1', NULL, 0, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435363334323135363b, 1456342158),
('2', '::1', NULL, 0, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435363334323139343b, 1456342196),
('c928939a70af3b944ffa419348b432b6ac094922', '::1', NULL, 0, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435363334323331343b, 1456343544),
('db42ec9cab4ce6ed8a8ec38ea33bdb50bf7167d1', '::1', NULL, 0, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435363534353331303b, 1456545312);

-- --------------------------------------------------------

--
-- Table structure for table `stat_history`
--

CREATE TABLE `stat_history` (
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

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(44) NOT NULL,
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
  `tos_checked` tinyint(1) NOT NULL DEFAULT '1',
  `age_checked` tinyint(1) NOT NULL DEFAULT '1',
  `mood_colours_id` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `create_time`, `photo_url`, `dob`, `description`, `gender`, `status`, `country`, `region`, `city`, `zip_code`, `access_level`, `is_active`, `tos_checked`, `age_checked`, `mood_colours_id`) VALUES
(1, 'chaser', 'chae@me.com', '123456', '2016-02-09 06:48:04', NULL, '1982-08-05', 'Im too awesome for myself this is a post int', 'm', 'Too Cool for school', 'Canada', 'Ontario', 'Lemington', 'N8H 4Y9', NULL, 0, 1, 1, 5),
(2, 'loopy', 'someone@something.com', '123456', '2016-02-09 06:48:04', '', '1980-02-04', 'Im too awesome for myself this is a post intIm too awesome for myself this is a post intIm too awesome for myself this is a post int', 'F', 'Im too awesome for myself this is a post intIm too awesome for myself this is a post intIm too awesome for myself this is a post intIm too awesome for myself this is a post intIm too awesome for myself this is a post intIm too awesome for myself this is a', 'Lebanon', NULL, NULL, NULL, NULL, 0, 1, 1, 1),
(3, 'ajax', 'ajax@php.net', '123456', '2016-02-09 06:58:02', NULL, NULL, 'Im too awesome for myself this is a post intIm too awesome for myself this is a post intIm too awesome for myself this is a post intIm too awesome for myself this is a post intIm too awesome for myself this is a post intIm too awesome for myself this is a', NULL, 'Im too awesome for myself this is a post intIm too awesome for myself this is a post intIm too awesome for myself this is a post int', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1),
(4, 'QueryThis', 'j@query.ca', '123456', '2016-02-09 06:58:02', NULL, NULL, 'Im too awesome for myself this is a post intIm too awesome for myself this is a post intIm too awesome for myself this is a post intIm too awesome for myself this is a post intIm too awesome for myself this is a post intIm too awesome for myself this is a', NULL, 'Im too awesome for myself this is a post intIm too awesome for myself this is a post intIm too awesome for myself this is a post int', NULL, NULL, '90210', NULL, NULL, 1, 1, 1, 2),
(5, 'Budah', 'Buddah@my20.ca', '123456', '2016-02-09 08:35:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1),
(23, 'Price', 'price@right,com', '123456', '2016-02-09 08:36:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2),
(24, 'gogo', 'gp@my20.ca', '123456', '2016-02-09 08:36:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1),
(41, 'topnytonto', 'yonm', 'password', '2016-02-22 04:03:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2),
(183, 'user123', 'me1@you.com', '123456', '2016-02-23 00:05:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`,`users_id`),
  ADD KEY `fk_comments_posts1_idx` (`posts_id`),
  ADD KEY `fk_comments_users1_idx` (`users_id`);

--
-- Indexes for table `mood_colours`
--
ALTER TABLE `mood_colours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notify`
--
ALTER TABLE `notify`
  ADD PRIMARY KEY (`id`,`users_id`),
  ADD KEY `fk_notify_users1_idx` (`users_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`,`mood_colours_id`,`users_id`),
  ADD KEY `fk_posts_mood_colours1_idx` (`mood_colours_id`),
  ADD KEY `fk_posts_users1_idx` (`users_id`);

--
-- Indexes for table `session_record`
--
ALTER TABLE `session_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stat_history`
--
ALTER TABLE `stat_history`
  ADD PRIMARY KEY (`id`,`users_id`,`mood_colours_id`),
  ADD KEY `fk_stat_history_users1_idx` (`users_id`),
  ADD KEY `fk_stat_history_mood_colours1_idx` (`mood_colours_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`,`mood_colours_id`),
  ADD UNIQUE KEY `username` (`username`,`email`),
  ADD UNIQUE KEY `username_2` (`username`,`email`),
  ADD KEY `fk_users_mood_colours1_idx` (`mood_colours_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `mood_colours`
--
ALTER TABLE `mood_colours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;
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
