-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:5000
-- Generation Time: Dec 13, 2016 at 03:03 AM
-- Server version: 5.6.33
-- PHP Version: 7.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `FindFolks`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `category` varchar(20) NOT NULL DEFAULT '',
  `keyword` varchar(20) NOT NULL DEFAULT '',
  `group_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`category`, `keyword`, `group_id`) VALUES
('cooking', 'fun', 12356),
('Reading', 'Read', 53744),
('Sporting', 'Sport', 67843);

-- --------------------------------------------------------

--
-- Table structure for table `an_event`
--

CREATE TABLE `an_event` (
  `event_id` int(20) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `location_name` varchar(20) NOT NULL,
  `zipcode` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `an_event`
--

INSERT INTO `an_event` (`event_id`, `title`, `description`, `start_time`, `end_time`, `location_name`, `zipcode`) VALUES
(249, 'jf', 'frfeg', '2017-12-14 00:00:00', '2018-12-30 00:00:00', 'school', 1209),
(2552, 'jugneng', 'reignerjg', '2016-12-22 00:00:00', '2016-12-31 00:00:00', 'school', 1209),
(4522, 'frkfjn', 'gejogneo', '2016-12-21 00:00:00', '2016-12-22 00:00:00', 'school', 1209),
(7890, 'Book Club Meeting', 'Lets meet to discuss Harry Potter', '2016-12-02 13:52:00', '2016-12-02 15:00:00', 'school', 1209),
(7896, 'Swimming', 'fun at the pool', '2016-12-15 06:00:00', '2016-12-15 07:00:00', 'school', 1209),
(12344, 'Singing at Work', 'lots of fun and food', '2016-12-12 03:00:00', '2016-12-12 04:00:00', 'work', 1112),
(875747, 'fhrjf', 'rfjijfi', '2016-12-14 00:00:00', '2019-07-02 00:00:00', 'school', 1209),
(1241231, 'ping pong', 'fun stuff', '2016-12-11 00:00:00', '2016-12-11 00:00:00', 'school', 1209),
(1241232, 'chess', 'fun', '2016-12-13 00:00:00', '2016-12-14 00:00:00', 'school', 1209),
(1241233, 'badminton', 'exercise', '2016-12-12 00:00:00', '2016-12-13 00:00:00', 'school', 1209),
(1241234, 'dancing', 'bollywood songs', '2016-12-14 00:00:00', '2016-12-15 00:00:00', 'work', 1112),
(1241240, 'ghggug', 'uiodhofhoshf', '2016-12-13 00:00:00', '2016-12-29 00:00:00', 'school', 1209),
(1241242, 'ghggug', 'uiodhofhoshf', '2016-12-13 00:00:00', '2016-12-29 00:00:00', 'school', 1209),
(1241243, 'ghggug', 'uiodhofhoshf', '2016-12-13 00:00:00', '2016-12-29 00:00:00', 'school', 1209),
(1241244, 'ghggug', 'uiodhofhoshf', '2016-12-13 00:00:00', '2016-12-29 00:00:00', 'school', 1209),
(1241245, 'ghggug', 'uiodhofhoshf', '2016-12-13 00:00:00', '2016-12-29 00:00:00', 'school', 1209),
(1241246, 'ghggug', 'uiodhofhoshf', '2016-12-13 00:00:00', '2016-12-29 00:00:00', 'school', 1209),
(1241247, 'fhebk', 'rhfejfh', '2016-11-30 00:00:00', '2016-12-14 00:00:00', 'school', 1209),
(1241248, 'fhebk', 'rhfejfh', '2016-11-30 00:00:00', '2016-12-14 00:00:00', 'school', 1209),
(1241249, 'fhebk', 'rhfejfh', '2016-11-30 00:00:00', '2016-12-14 00:00:00', 'school', 1209),
(1241250, 'The Giver', 'We will be reading the giver', '2016-12-14 00:00:00', '2016-12-14 00:00:00', 'school', 1209),
(1241251, 'hfejkfh', 'renuhoirwchi\'pw', '2016-12-13 00:00:00', '2016-12-21 00:00:00', 'school', 1209),
(1241252, 'hfejkfh', 'renuhoirwchi\'pw', '2016-12-13 00:00:00', '2016-12-21 00:00:00', 'school', 1209),
(1241253, 'hfejkfh', 'renuhoirwchi\'pw', '2016-12-13 00:00:00', '2016-12-21 00:00:00', 'school', 1209),
(1241254, 'hfejkfh', 'renuhoirwchi\'pw', '2016-12-13 00:00:00', '2016-12-21 00:00:00', 'school', 1209),
(1241255, 'hfejkfh', 'renuhoirwchi\'pw', '2016-12-13 00:00:00', '2016-12-21 00:00:00', 'school', 1209),
(1241256, 'hfejkfh', 'renuhoirwchi\'pw', '2016-12-13 00:00:00', '2016-12-21 00:00:00', 'school', 1209),
(1241257, 'hfejkfh', 'renuhoirwchi\'pw', '2016-12-13 00:00:00', '2016-12-21 00:00:00', 'school', 1209),
(1241258, 'hfejkfh', 'renuhoirwchi\'pw', '2016-12-13 00:00:00', '2016-12-21 00:00:00', 'school', 1209),
(1241259, 'hfejkfh', 'renuhoirwchi\'pw', '2016-12-13 00:00:00', '2016-12-21 00:00:00', 'school', 1209),
(1241260, 'hfejkfh', 'renuhoirwchi\'pw', '2016-12-13 00:00:00', '2016-12-21 00:00:00', 'school', 1209),
(1241261, 'hfejkfh', 'renuhoirwchi\'pw', '2016-12-13 00:00:00', '2016-12-21 00:00:00', 'school', 1209),
(1241262, 'hfejkfh', 'renuhoirwchi\'pw', '2016-12-13 00:00:00', '2016-12-21 00:00:00', 'school', 1209),
(1241263, 'hfejkfh', 'renuhoirwchi\'pw', '2016-12-13 00:00:00', '2016-12-21 00:00:00', 'school', 1209),
(1241264, 'hfejkfh', 'renuhoirwchi\'pw', '2016-12-13 00:00:00', '2016-12-21 00:00:00', 'school', 1209),
(1241265, 'hfejkfh', 'renuhoirwchi\'pw', '2016-12-13 00:00:00', '2016-12-21 00:00:00', 'school', 1209),
(1241266, 'nkec', 'vtjnv', '2016-12-06 00:00:00', '2016-12-14 00:00:00', 'school', 1209),
(1241267, 'nkec', 'vtjnv', '2016-12-06 00:00:00', '2016-12-14 00:00:00', 'school', 1209),
(1241269, 'nazira', 'home', '2016-12-14 00:00:00', '2016-12-15 00:00:00', 'school', 1209);

-- --------------------------------------------------------

--
-- Table structure for table `a_group`
--

CREATE TABLE `a_group` (
  `group_id` int(20) NOT NULL,
  `group_name` varchar(20) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `creator` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `a_group`
--

INSERT INTO `a_group` (`group_id`, `group_name`, `description`, `creator`) VALUES
(987, 'Board Game Lovers', 'we play lots of board games', 'nazz1234'),
(12345, 'Drawing ', 'Adults draw together', 'shefali '),
(12356, 'Men\'s Voice', 'Guys who sing', 'johnnyG'),
(53744, 'Book Worms Anonymous', 'we read together', 'nazzybear'),
(67843, 'Sporty Girls', 'Lots of exercise ', 'nazzybear'),
(2498520, 'girls club', 'girly fun', 'nazzybear'),
(2498521, 'food', 'i\'m hungry', 'nazzybear'),
(2498522, 'latin', 'learn language', 'nazzybear'),
(2498523, 'Zumba', 'dance all night long', 'nazzybear'),
(2498524, 'naz', 'kdlsifr', 'shefali');

-- --------------------------------------------------------

--
-- Table structure for table `belongs_to`
--

CREATE TABLE `belongs_to` (
  `group_id` int(20) NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '',
  `authorized` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `belongs_to`
--

INSERT INTO `belongs_to` (`group_id`, `username`, `authorized`) VALUES
(987, 'KevinM34', 1),
(987, 'shefali ', 1),
(12345, 'shefali ', 1),
(12356, 'johnnyG', 1),
(12356, 'SimonSays45', 0),
(53744, 'nazzybear', 1),
(67843, 'nazzybear', 1),
(67843, 'shefali ', 1),
(2498520, 'nazzybear', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `blog_post` varchar(500) CHARACTER SET latin1 NOT NULL,
  `username` varchar(20) CHARACTER SET latin1 NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`blog_post`, `username`, `ts`) VALUES
('ping pong at 2!', 'nazzybear', '2016-12-11 15:22:15'),
('hello', 'nazzybear', '2016-12-11 15:24:48'),
('nazira it works', 'nazzybear', '2016-12-11 15:24:55'),
('hey', 'nazzybear', '2016-12-11 15:47:53'),
('hello', 'nazzybear', '2016-12-11 15:47:58'),
('hey', 'nazzybear', '2016-12-11 15:48:16'),
('hey', 'nazzybear', '2016-12-11 15:48:30'),
('hey everyone!', 'nazzybear', '2016-12-11 19:08:18'),
('hey', 'shefaliLove', '2016-12-11 20:17:47'),
('All set for friday at 5', 'nazzybear', '2016-12-12 16:55:33'),
('okay', 'shefali', '2016-12-12 20:36:55'),
('hey', 'shefali', '2016-12-13 00:27:33');

-- --------------------------------------------------------

--
-- Table structure for table `friend`
--

CREATE TABLE `friend` (
  `friend_of` varchar(20) NOT NULL DEFAULT '',
  `friend_to` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `friend`
--

INSERT INTO `friend` (`friend_of`, `friend_to`) VALUES
('IpsitaC345', 'KevinM34'),
('johnnyG', 'Kim'),
('KevinM34', 'nazzybear'),
('Kim', 'KevinM34'),
('nazzybear', 'Kim'),
('nazzybear', 'shefaliLove'),
('shefali ', 'HenryP'),
('shefaliLove', 'nazzybear'),
('shefaliLove', 'SimonSays45');

-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

CREATE TABLE `interest` (
  `category` varchar(20) NOT NULL DEFAULT '',
  `keyword` varchar(20) NOT NULL DEFAULT '',
  `rating` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interest`
--

INSERT INTO `interest` (`category`, `keyword`, `rating`) VALUES
('cooking', 'fun', 0),
('whatever', 'fun', 0),
('anythin', 'funny', 0),
('jijhjfj', 'haha', 0),
('singing', 'music', 0),
('Reading', 'Read', 2),
('Singing', 'Sing', 0),
('Sporting', 'Sport', 0);

-- --------------------------------------------------------

--
-- Table structure for table `interested_in`
--

CREATE TABLE `interested_in` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `category` varchar(20) NOT NULL DEFAULT '',
  `keyword` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interested_in`
--

INSERT INTO `interested_in` (`username`, `category`, `keyword`) VALUES
('KevinM34', 'cooking', 'fun'),
('nazzybear', 'cooking', 'fun'),
('shefali', 'whatever', 'fun'),
('shefali', 'anythin', 'funny'),
('shefali', 'jijhjfj', 'haha'),
('KevinM34', 'Singing', 'music'),
('nazzybear', 'singing', 'music'),
('IpsitaC345', 'Reading', 'Read'),
('nazzybear', 'Reading', 'Read'),
('SimonSays45', 'Reading', 'Read'),
('shefaliLove', 'Singing', 'Sing'),
('Kim', 'Sporting', 'Sport');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_name` varchar(20) NOT NULL DEFAULT '',
  `zipcode` int(5) NOT NULL,
  `address` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `latitude` decimal(50,0) NOT NULL,
  `longitude` decimal(50,0) NOT NULL,
  `rating` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_name`, `zipcode`, `address`, `description`, `latitude`, `longitude`, `rating`) VALUES
('', 0, '', '', '0', '0', 0),
('Local JCC', 8376, '89 Hills Rd', 'Swimming pool gym and offices', '5839390', '503093', 3),
('school', 1209, '95 forest steet', 'fun', '12003', '1235', 3),
('Starbucks', 1301, '95 forest ave', 'nice ambiance', '45678900', '34567890', 0),
('work', 1112, '123 pine street', 'boring', '134', '1243352', 5);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(20) NOT NULL DEFAULT '',
  `lastname` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(32) NOT NULL DEFAULT '',
  `zipcode` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`username`, `password`, `firstname`, `lastname`, `email`, `zipcode`) VALUES
('blah', '7a46817c12dfe728cdb4ab39de0091b6', 'blah', 'blah', 'blah', 1234),
('HenryP', 'f22147bb5a71c971ddf3322ece7c85af', 'Henry', 'Pierre', 'htp@nyu.edu', 48223),
('IpsitaC345', '2345', 'ipsita', 'chat', 'ipc@email.com', 9083),
('johnnyG', 'gag678', 'John', 'Gerard', 'grd123@gmail.com', 10301),
('KevinM34', '3456', 'kevin', 'muldoon', 'ktm@nyu.edu', 10301),
('Kim', '1234', 'Kim', 'Kim', 'Kim1234@gmail.com', 1234),
('nazz1234', '1234', 'nazira', 'abdelaks', 'ndi@nyu.edu', 10301),
('nazzybear', '1234', 'nazira', 'abdel', 'naa355@appleseed.edu', 10306),
('shefali ', 'aa41c41b6ae2300bd306aee8bf3d1242', 'shefali', 'satpathy', 's@gmail.com', 11231),
('shefali43', '5492', 'shefali', 'boomboom', 'boom34@nyu.edu', 1456),
('shefaliLove', '5678', 'Shefali', 'Supp', 'ss4@google.mail', 45671),
('SimonSays45', 'Gorilla5', 'Simon', 'Cambell', 'SGC@nyu.edu', 4567);

-- --------------------------------------------------------

--
-- Table structure for table `organize`
--

CREATE TABLE `organize` (
  `event_id` int(20) NOT NULL,
  `group_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organize`
--

INSERT INTO `organize` (`event_id`, `group_id`) VALUES
(1241269, 12345),
(249, 53744),
(2552, 53744),
(4522, 53744),
(875747, 53744),
(1241234, 53744),
(1241250, 53744),
(1241251, 53744),
(1241252, 53744),
(1241253, 53744),
(1241254, 53744),
(1241255, 53744),
(1241256, 53744),
(1241257, 53744),
(1241258, 53744),
(1241259, 53744),
(1241260, 53744),
(1241261, 53744),
(1241262, 53744),
(1241263, 53744),
(1241264, 53744),
(1241265, 53744),
(1241266, 53744),
(1241267, 53744),
(1241232, 67843),
(1241233, 67843),
(1241240, 67843),
(1241242, 67843),
(1241243, 67843),
(1241244, 67843),
(1241245, 67843),
(1241246, 67843),
(1241247, 67843),
(1241248, 67843),
(1241249, 67843),
(1241243, 2498523);

-- --------------------------------------------------------

--
-- Table structure for table `sign_up`
--

CREATE TABLE `sign_up` (
  `event_id` int(20) NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '',
  `rating` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sign_up`
--

INSERT INTO `sign_up` (`event_id`, `username`, `rating`) VALUES
(249, 'nazzybear', 0),
(2552, 'nazzybear', 0),
(4522, 'nazzybear', 0),
(7890, 'johnnyG', 5),
(7890, 'nazzybear', 2),
(7890, 'shefali', 2),
(7890, 'shefaliLove', 0),
(7896, 'nazzybear', 0),
(7896, 'shefaliLove', 0),
(12344, 'nazzybear', 0),
(12344, 'shefaliLove', 0),
(875747, 'nazz1234', 1),
(875747, 'nazzybear', 0),
(1241231, 'nazzybear', 5),
(1241231, 'shefaliLove', 0),
(1241232, 'nazzybear', 0),
(1241233, 'nazzybear', 0),
(1241234, 'nazzybear', 0),
(1241240, 'nazzybear', 0),
(1241242, 'nazzybear', 0),
(1241243, 'nazzybear', 0),
(1241243, 'shefali ', 1),
(1241244, 'nazzybear', 0),
(1241245, 'nazzybear', 0),
(1241246, 'nazzybear', 0),
(1241247, 'nazzybear', 0),
(1241248, 'nazzybear', 0),
(1241249, 'nazzybear', 0),
(1241250, 'nazzybear', 0),
(1241251, 'nazzybear', 0),
(1241252, 'nazzybear', 0),
(1241253, 'nazzybear', 0),
(1241254, 'nazzybear', 0),
(1241255, 'nazzybear', 0),
(1241256, 'nazzybear', 0),
(1241257, 'nazzybear', 0),
(1241258, 'nazzybear', 0),
(1241259, 'nazzybear', 0),
(1241260, 'nazzybear', 0),
(1241261, 'nazzybear', 0),
(1241261, 'shefali', 0),
(1241262, 'nazzybear', 0),
(1241263, 'nazzybear', 0),
(1241264, 'nazzybear', 0),
(1241265, 'nazzybear', 0),
(1241265, 'shefali', 0),
(1241266, 'nazzybear', 0),
(1241267, 'nazzybear', 0),
(1241269, 'shefali', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `event_id` int(20) NOT NULL DEFAULT '0',
  `keyword` varchar(30) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`event_id`, `keyword`) VALUES
(7890, 'swim'),
(12344, 'dance'),
(1241243, 'funny'),
(1241245, 'funny'),
(1241247, 'fun'),
(1241248, 'funny'),
(1241249, 'fun'),
(1241250, 'eat');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`group_id`,`keyword`,`category`),
  ADD KEY `keyword` (`keyword`,`category`);

--
-- Indexes for table `an_event`
--
ALTER TABLE `an_event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `location_name` (`location_name`,`zipcode`);

--
-- Indexes for table `a_group`
--
ALTER TABLE `a_group`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `creator` (`creator`);

--
-- Indexes for table `belongs_to`
--
ALTER TABLE `belongs_to`
  ADD PRIMARY KEY (`group_id`,`username`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `friend`
--
ALTER TABLE `friend`
  ADD PRIMARY KEY (`friend_to`,`friend_of`),
  ADD KEY `friend_of` (`friend_of`);

--
-- Indexes for table `interest`
--
ALTER TABLE `interest`
  ADD PRIMARY KEY (`keyword`,`category`);

--
-- Indexes for table `interested_in`
--
ALTER TABLE `interested_in`
  ADD PRIMARY KEY (`username`,`keyword`,`category`),
  ADD KEY `keyword` (`keyword`,`category`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_name`,`zipcode`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `organize`
--
ALTER TABLE `organize`
  ADD PRIMARY KEY (`event_id`,`group_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `sign_up`
--
ALTER TABLE `sign_up`
  ADD PRIMARY KEY (`event_id`,`username`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `an_event`
--
ALTER TABLE `an_event`
  MODIFY `event_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1241270;
--
-- AUTO_INCREMENT for table `a_group`
--
ALTER TABLE `a_group`
  MODIFY `group_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2498525;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `about`
--
ALTER TABLE `about`
  ADD CONSTRAINT `about_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `a_group` (`group_id`),
  ADD CONSTRAINT `about_ibfk_2` FOREIGN KEY (`keyword`,`category`) REFERENCES `interest` (`keyword`, `category`);

--
-- Constraints for table `an_event`
--
ALTER TABLE `an_event`
  ADD CONSTRAINT `an_event_ibfk_1` FOREIGN KEY (`location_name`,`zipcode`) REFERENCES `location` (`location_name`, `zipcode`);

--
-- Constraints for table `a_group`
--
ALTER TABLE `a_group`
  ADD CONSTRAINT `a_group_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `member` (`username`);

--
-- Constraints for table `belongs_to`
--
ALTER TABLE `belongs_to`
  ADD CONSTRAINT `belongs_to_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `a_group` (`group_id`),
  ADD CONSTRAINT `belongs_to_ibfk_2` FOREIGN KEY (`username`) REFERENCES `member` (`username`);

--
-- Constraints for table `friend`
--
ALTER TABLE `friend`
  ADD CONSTRAINT `friend_ibfk_1` FOREIGN KEY (`friend_to`) REFERENCES `member` (`username`),
  ADD CONSTRAINT `friend_ibfk_2` FOREIGN KEY (`friend_of`) REFERENCES `member` (`username`);

--
-- Constraints for table `interested_in`
--
ALTER TABLE `interested_in`
  ADD CONSTRAINT `interested_in_ibfk_1` FOREIGN KEY (`username`) REFERENCES `member` (`username`),
  ADD CONSTRAINT `interested_in_ibfk_2` FOREIGN KEY (`keyword`,`category`) REFERENCES `interest` (`keyword`, `category`);

--
-- Constraints for table `organize`
--
ALTER TABLE `organize`
  ADD CONSTRAINT `organize_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `an_event` (`event_id`),
  ADD CONSTRAINT `organize_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `a_group` (`group_id`);

--
-- Constraints for table `sign_up`
--
ALTER TABLE `sign_up`
  ADD CONSTRAINT `sign_up_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `an_event` (`event_id`),
  ADD CONSTRAINT `sign_up_ibfk_2` FOREIGN KEY (`username`) REFERENCES `member` (`username`);

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `an_event` (`event_id`);
