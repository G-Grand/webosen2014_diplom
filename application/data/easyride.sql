

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easyride_db`
--
CREATE DATABASE IF NOT EXISTS `easyride_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `easyride_db`;

-- --------------------------------------------------------

--
-- Table structure for table `er_access`
--

CREATE TABLE IF NOT EXISTS `er_access` (
  `id` char(2) NOT NULL,
  `descr` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `er_access`
--

INSERT INTO `er_access` (`id`, `descr`) VALUES
('am', 'администратор'),
('dr', 'водитель'),
('ps', 'пассажир');

-- --------------------------------------------------------

--
-- Table structure for table `er_car`
--

CREATE TABLE IF NOT EXISTS `er_car` (
  `regnumber` varchar(20) NOT NULL,
  `userid` varchar(100) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `seats` int(10) unsigned NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `fuelrate` decimal(10,0) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `er_car`
--

INSERT INTO `er_car` (`regnumber`, `userid`, `brand`, `model`, `color`, `seats`, `photo`, `fuelrate`) VALUES
('AE1418AK', 'mark@i.ua', 'zaz', 'tavriya', 'gray', 1, 'http://placehold.it/350x150', '5'),
('AE5487EE', 'john@i.ua', 'mersedes', '600', 'blue', 1, 'http://placehold.it/350x150', '12'),
('AE5488AD', 'kola@i.ua', 'reno', 'megane', 'black', 2, 'http://placehold.it/350x150', '8'),
('AE6318KK', 'piter@i.ua', 'Porshe', 'Cayenne', 'black', 4, 'http://placehold.it/350x150', '17'),
('AE6318KL', 'piter@i.ua', 'BMW', 'x5', 'black', 4, 'http://placehold.it/350x150', '13'),
('AE6488II', 'alex@i.ua', 'opel', 'kadet', 'red', 4, 'http://placehold.it/350x150', '6');

-- --------------------------------------------------------

--
-- Table structure for table `er_passenger`
--

CREATE TABLE IF NOT EXISTS `er_passenger` (
  `roadroutid` varchar(15) NOT NULL,
  `userid` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `er_passenger`
--

INSERT INTO `er_passenger` (`roadroutid`, `userid`) VALUES
('20150101', 'ivan@i.ua'),
('20150221', 'georg@i.ua'),
('20150221', 'olga@i.ua'),
('20150320', 'den@i.ua'),
('20150320', 'elena@i.ua'),
('20150717', 'john@i.ua'),
('20150717', 'kola@i.ua');

-- --------------------------------------------------------

--
-- Table structure for table `er_roadrout`
--

CREATE TABLE IF NOT EXISTS `er_roadrout` (
  `id` varchar(15) NOT NULL,
  `driverid` varchar(100) NOT NULL,
  `start` varchar(255) NOT NULL,
  `start_adress` varchar(255) DEFAULT NULL,
  `finish` varchar(255) NOT NULL,
  `finish_adress` varchar(255) DEFAULT NULL,
  `terms` text,
  `autoid` varchar(20) NOT NULL,
  `freeseats` int(10) unsigned DEFAULT NULL,
  `price` decimal(10,0) unsigned DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `timetrip` time DEFAULT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `er_roadrout`
--

INSERT INTO `er_roadrout` (`id`, `driverid`, `start`, `start_adress`, `finish`, `finish_adress`, `terms`, `autoid`, `freeseats`, `price`, `startdate`, `timetrip`, `status`) VALUES
('20150101', 'kola@i.ua', 'Россия, Москва', 'Красная площадь', 'Украина, Киев', 'Крещатик', 'в салоне не курят', 'AE5488AD', 2, '800', '2015-02-11 04:00:00', '12:00:00', 'opened'),
('20150207', 'mark@i.ua', 'Украина, Полтавская область, Кременчуг', 'Ул. Красина 5', 'Украина, Днепропетровск', 'Ул. Шмидта 14', 'без детей, без животных', 'AE1418AK', 4, '180', '2015-02-13 07:00:00', '02:00:00', 'opened'),
('20150221', 'piter@i.ua', 'Украина, Полтава', 'Вул. Полтавський шлях', 'Россия, Санкт-Петербург', 'Ул. Феодосийская 8', '', 'AE6318KL', 0, '900', '2015-05-28 03:00:00', '16:00:00', 'closed'),
('20150223', 'alex@i.ua', 'Украина, Днепропетровская область, Кривой Рог', 'Пр. Мира 1', 'Украина, Львов', 'Вул. Степана Бандери 5', 'в салоне не курят, без животных', 'AE6488II', 3, '450', '2015-03-02 07:00:00', '10:00:00', 'opened'),
('20150320', 'john@i.ua', 'Украина, Киев', 'Street 1', 'Украина, Житомир', 'Avenue 4', 'no smoking, no pets', 'AE5487EE', 1, '1200', '2015-05-10 13:00:00', '00:00:00', 'opened'),
('20150321', 'alex@i.ua', 'Украина, Киев', 'Street 2', 'Украина, Житомир', 'Avenue 2', 'no smoking, no pets', 'AE6488II', 2, '1100', '2015-06-03 18:00:00', '00:00:00', 'opened'),
('20150717', 'piter@i.ua', 'Россия, Санкт-Петербург', 'Ул. Феодосийская 8', 'Украина, Полтава', 'Вул. Полтавський шлях', '', 'AE6318KK', 2, '900', '2015-07-17 03:00:00', '16:00:00', 'opened'),
('20150718', 'piter@i.ua', 'Украина, Киев', 'Street 3', 'Украина, Житомир', 'Avenue 3', '', 'AE6318KK', 3, '1750', '2015-12-21 08:00:00', '06:00:00', 'opened'),
('20150720', 'mark@i.ua', 'Украина, Киев', 'Street 8', 'Украина, Житомир', 'Avenue 20', 'no smoking', 'AE1418AK', 1, '1250', '2015-12-22 15:00:00', '00:00:00', 'opened');

-- --------------------------------------------------------

--
-- Table structure for table `er_routpoint`
--

CREATE TABLE IF NOT EXISTS `er_routpoint` (
  `roadroutid` varchar(15) NOT NULL,
  `point` varchar(255) NOT NULL,
  `pointqueue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `er_routpoint`
--

INSERT INTO `er_routpoint` (`roadroutid`, `point`, `pointqueue`) VALUES
('20150101', 'Минск', 1),
('20150221', 'Москва', 1),
('20150221', 'Воронеж', 2),
('20150221', 'Харьков', 3),
('20150717', 'Москва', 3),
('20150717', 'Воронеж', 2),
('20150717', 'Харьков', 1);

-- --------------------------------------------------------

--
-- Table structure for table `er_user`
--

CREATE TABLE IF NOT EXISTS `er_user` (
  `email` varchar(100) NOT NULL,
  `userpassword` varchar(100) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gendor` char(1) DEFAULT NULL,
  `rate` int(10) unsigned DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `crdate` datetime NOT NULL,
  `access` varchar(100) NOT NULL,
  `userstatus` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `er_user`
--

INSERT INTO `er_user` (`email`, `userpassword`, `username`, `surname`, `phone`, `birthday`, `gendor`, `rate`, `photo`, `crdate`, `access`, `userstatus`) VALUES
('alex@i.ua', '698d51a19d8a121ce581499d7b701668', 'Алексей', 'Гагарин', '+380562667788', '1964-06-21', 'm', 5, 'http://placehold.it/150x150', '2015-02-23 16:34:17', 'dr', '1'),
('chslavamail@mail.ru', '698d51a19d8a121ce581499d7b701668', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-10-07 00:00:00', 'ps', '1'),
('den@i.ua', '698d51a19d8a121ce581499d7b701668', 'Денис', 'Простой', '+380562889911', '1989-11-12', 'm', 2, 'http://placehold.it/150x150', '2015-01-23 21:34:06', 'ps', '1'),
('ee@i.ua', '698d51a19d8a121ce581499d7b701668', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-10-06 00:00:00', 'ps', '1'),
('elena@i.ua', '698d51a19d8a121ce581499d7b701668', 'Елена', 'Сотник', '+380562112233', '1982-12-26', 'w', 3, 'http://placehold.it/150x150', '2015-03-30 20:33:10', 'ps', '1'),
('g@i.ua', '698d51a19d8a121ce581499d7b701668', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-10-05 00:00:00', 'ps', '1'),
('georg@i.ua', '698d51a19d8a121ce581499d7b701668', 'Григорий', 'Лепс', '+380562441122', '1987-06-03', 'm', 4, 'http://placehold.it/150x150', '2015-03-17 22:18:18', 'ps', '1'),
('gg@i.ua', '698d51a19d8a121ce581499d7b701668', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-10-05 00:00:00', 'ps', '1'),
('givi@i.ua', '698d51a19d8a121ce581499d7b701668', 'Гиви', 'Бендукидзе', '+380562778899', '1978-02-13', 'm', 4, 'http://placehold.it/150x150', '2015-02-03 15:32:12', 'am', '1'),
('ivan@i.ua', '698d51a19d8a121ce581499d7b701668', 'Иван', 'Петров', '+380562334458', '1981-02-11', 'm', 1, 'http://placehold.it/150x150', '2015-02-01 13:10:01', 'ps', '1'),
('jjj@i.ua', '698d51a19d8a121ce581499d7b701668', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2015-10-06 00:00:00', 'ps', '1'),
('john@i.ua', '698d51a19d8a121ce581499d7b701668', 'Джон', 'Траволта', '+380562556677', '1985-10-07', 'm', 5, 'http://placehold.it/150x150', '2015-03-20 21:32:05', 'dr', '1'),
('kola@i.ua', '698d51a19d8a121ce581499d7b701668', 'Николай', 'Басков', '+380562445566', '1971-07-18', 'm', 5, 'http://placehold.it/150x150', '2015-01-01 00:00:05', 'dr', '1'),
('kolya@i.ua', '698d51a19d8a121ce581499d7b701668', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-10-06 00:00:00', 'ps', '1'),
('mark@i.ua', '698d51a19d8a121ce581499d7b701668', 'Марк', 'Твен', '+380562991122', '1991-05-11', 'm', 3, 'http://placehold.it/150x150', '2015-02-07 14:07:18', 'dr', '1'),
('olga@i.ua', '698d51a19d8a121ce581499d7b701668', 'Ольга', 'Денисова', '+380562223344', '1979-03-02', 'w', 1, 'http://placehold.it/150x150', '2015-03-29 18:32:12', 'ps', '1'),
('piter@i.ua', '698d51a19d8a121ce581499d7b701668', 'Петр', 'Мазепа', '+380562334455', '1992-09-13', 'm', 1, 'http://placehold.it/150x150', '2015-02-21 15:48:02', 'dr', '1'),
('r@i.ua', '698d51a19d8a121ce581499d7b701668', NULL, NULL, NULL, NULL, NULL, 2, NULL, '2015-10-04 00:00:00', 'ps', '1'),
('sd@i.ua', '698d51a19d8a121ce581499d7b701668', NULL, NULL, NULL, NULL, NULL, 3, NULL, '2015-10-05 00:00:00', 'ps', '1'),
('ssd@i.ua', '698d51a19d8a121ce581499d7b701668', NULL, NULL, NULL, NULL, NULL, 4, NULL, '2015-10-05 00:00:00', 'ps', '1'),
('ww@i.ua', '698d51a19d8a121ce581499d7b701668', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2015-10-06 00:00:00', 'ps', '1'),
('www@i.ua', '698d51a19d8a121ce581499d7b701668', NULL, NULL, NULL, NULL, NULL, 2, NULL, '2015-10-06 00:00:00', 'ps', '1');

-- --------------------------------------------------------

--
-- Table structure for table `er_userstatus`
--

CREATE TABLE IF NOT EXISTS `er_userstatus` (
  `id` char(2) NOT NULL,
  `descr` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `er_userstatus`
--

INSERT INTO `er_userstatus` (`id`, `descr`) VALUES
('1', 'approved'),
('2', 'verification'),
('3', 'not approved'),
('4', 'deprecated');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `er_access`
--
ALTER TABLE `er_access`
  ADD KEY `id` (`id`);

--
-- Indexes for table `er_car`
--
ALTER TABLE `er_car`
  ADD PRIMARY KEY (`regnumber`);

--
-- Indexes for table `er_passenger`
--
ALTER TABLE `er_passenger`
  ADD UNIQUE KEY `userid` (`userid`),
  ADD KEY `rout_pass_key` (`roadroutid`);

--
-- Indexes for table `er_roadrout`
--
ALTER TABLE `er_roadrout`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driverid_key` (`driverid`),
  ADD KEY `car_key` (`autoid`);

--
-- Indexes for table `er_routpoint`
--
ALTER TABLE `er_routpoint`
  ADD KEY `roadroutid` (`roadroutid`);

--
-- Indexes for table `er_user`
--
ALTER TABLE `er_user`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `access_key` (`access`),
  ADD KEY `status_key` (`userstatus`);

--
-- Indexes for table `er_userstatus`
--
ALTER TABLE `er_userstatus`
  ADD KEY `id` (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `er_passenger`
--
ALTER TABLE `er_passenger`
  ADD CONSTRAINT `rout_pass_key` FOREIGN KEY (`roadroutid`) REFERENCES `er_roadrout` (`id`),
  ADD CONSTRAINT `user_key` FOREIGN KEY (`userid`) REFERENCES `er_user` (`email`);

--
-- Constraints for table `er_roadrout`
--
ALTER TABLE `er_roadrout`
  ADD CONSTRAINT `car_key` FOREIGN KEY (`autoid`) REFERENCES `er_car` (`regnumber`),
  ADD CONSTRAINT `driverid_key` FOREIGN KEY (`driverid`) REFERENCES `er_user` (`email`);

--
-- Constraints for table `er_routpoint`
--
ALTER TABLE `er_routpoint`
  ADD CONSTRAINT `rout_key` FOREIGN KEY (`roadroutid`) REFERENCES `er_roadrout` (`id`);

--
-- Constraints for table `er_user`
--
ALTER TABLE `er_user`
  ADD CONSTRAINT `access_key` FOREIGN KEY (`access`) REFERENCES `er_access` (`id`),
  ADD CONSTRAINT `status_key` FOREIGN KEY (`userstatus`) REFERENCES `er_userstatus` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
