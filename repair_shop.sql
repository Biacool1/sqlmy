-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 17, 2023 at 05:21 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `repair_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `order_code` int(11) UNSIGNED NOT NULL,
  `lastname` varchar(22) NOT NULL,
  `firstname` varchar(22) NOT NULL,
  `middlename` varchar(22) NOT NULL,
  `phone_number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`order_code`, `lastname`, `firstname`, `middlename`, `phone_number`) VALUES
(2, 'Мининков', 'Илья', 'Александрович', '+79021324378'),
(3, 'Блидов', 'Айдар', 'Амирович', '+79021324478'),
(4, 'Иванов', 'Петр', 'Сергеевич', '+79991234567'),
(5, 'Петрова', 'Екатерина', 'Дмитриевна', '+79991234568'),
(6, 'Сидоров', 'Алексей', 'Петрович', '+79991234569'),
(7, 'Кузнецов', 'Сергей', 'Игоревич', '+79991234570'),
(8, 'Морозов', 'Андрей', 'Владимирович', '+79991234571'),
(9, 'Новикова', 'Дарья', 'Игоревна', '+79991234572'),
(10, 'Васильев', 'Глеб', 'Сергеевич', '+79991234573'),
(11, 'Смирнова', 'Мария', 'Васильевна', '+79991234574'),
(12, 'Егоров', 'Иван', 'Андреевич', '+79991234575'),
(13, 'Федорова', 'Анна', 'Сергеевна', '+79991234576'),
(14, 'Соколов', 'Денис', 'Викторович', '+79991234577'),
(15, 'Ковалев', 'Станислав', 'Петрович', '+79991234578'),
(16, 'Козлова', 'Оксана', 'Юрьевна', '+79991234579');

-- --------------------------------------------------------

--
-- Table structure for table `masters`
--

CREATE TABLE `masters` (
  `master_code` int(11) UNSIGNED NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `middlename` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `masters`
--

INSERT INTO `masters` (`master_code`, `lastname`, `firstname`, `middlename`) VALUES
(1, 'Черкасов', 'Дмитрий', 'Евгеньевич'),
(2, 'Солдатов', 'Артём', 'Александрович'),
(3, 'Иванов', 'Петр', 'Сергеевич'),
(4, 'Петров', 'Иван', 'Андреевич'),
(5, 'Сидоров', 'Алексей', 'Дмитриевич'),
(6, 'Кузнецов', 'Александр', 'Владимирович'),
(7, 'Смирнов', 'Сергей', 'Ильич'),
(8, 'Федоров', 'Андрей', 'Александрович'),
(9, 'Морозов', 'Дмитрий', 'Олегович'),
(10, 'Васильев', 'Илья', 'Михайлович'),
(11, 'Новиков', 'Евгений', 'Викторович'),
(12, 'Попов', 'Максим', 'Николаевич'),
(13, 'Козлов', 'Игорь', 'Леонидович'),
(14, 'Лебедев', 'Николай', 'Дмитриевич'),
(15, 'Егоров', 'Сергей', 'Анатольевич');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_code` int(11) UNSIGNED NOT NULL,
  `date-admissions` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `order_status` varchar(100) NOT NULL,
  `return_date` date DEFAULT NULL,
  `master_code` int(11) UNSIGNED NOT NULL,
  `services_code` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_code`, `date-admissions`, `description`, `order_status`, `return_date`, `master_code`, `services_code`) VALUES
(2, '2023-04-13', 'сгорел видео-чип', 'Завершено', '2023-04-16', 1, 1),
(3, '2023-04-05', 'собрать компьютер', 'В процессе', NULL, 2, 2),
(4, '2005-03-20', 'Заменить процессор', 'Завершено', '2023-04-12', 9, 9),
(5, '2001-02-20', 'настроить П.О.', 'Завершено', '2002-02-20', 1, 14),
(6, '2021-03-20', 'Не запускается П.К.', 'Завершено', '2022-03-20', 1, 10),
(7, '2012-03-20', 'Сгорел Б.П.', 'Завершёно', '2013-03-20', 15, 6),
(8, '2027-02-20', 'Удалить вирусы', 'Завершено', '2028-02-20', 11, 13),
(9, '2028-01-20', 'Установить антивирус', 'Завершено', '2029-01-20', 13, 4),
(10, '2011-01-20', 'Установить драйверы на периферию', 'Завершёно', '2012-01-20', 14, 15),
(11, '2009-04-20', 'нет изображения на мониторе', 'В процессе', NULL, 7, 8),
(12, '2004-04-20', 'Установить О.С.', 'Завершено', '2023-04-05', 3, 3),
(13, '2023-04-19', 'Треск в жёстком диске', 'В процессе', NULL, 9, 5),
(14, '2026-01-20', 'сгорела зона врм', 'Завершено', '2025-01-20', 8, 7),
(15, '2019-02-20', 'подключить интернет', 'В процессе', NULL, 10, 12),
(16, '2023-04-15', 'Сгорели чипы памяти', 'Завершёно', '2023-04-16', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `services_code` int(11) UNSIGNED NOT NULL,
  `services` varchar(100) NOT NULL,
  `service_cost` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`services_code`, `services`, `service_cost`) VALUES
(1, 'ремонт видео-чипа', 5000),
(2, 'сбор копьютера', 4000),
(3, 'Установка операционной системы', 3000),
(4, 'Установка и настройка антивирусной программы', 1000),
(5, 'Ремонт жесткого диска', 5000),
(6, 'Замена блока питания', 1500),
(7, 'Замена материнской платы', 4000),
(8, 'Замена видеокарты', 2500),
(9, 'Замена процессора', 3500),
(10, 'Замена оперативной памяти', 2000),
(11, 'Восстановление данных', 8000),
(12, 'Настройка сетевого оборудования', 4000),
(13, 'Удаление вирусов', 2000),
(14, 'Настройка программного обеспечения', 1500),
(15, 'Установка драйверов на периферийные устройства', 500);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `login` varchar(32) NOT NULL,
  `pass` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `pass`, `name`, `lastname`) VALUES
(3, 'kent', '123', 'kent', 'kentuha'),
(8, '1', '1', 'a', 'a'),
(10, 'чубака', '123', 'Чупакабра', 'Бешенная');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD UNIQUE KEY `order_code` (`order_code`);

--
-- Indexes for table `masters`
--
ALTER TABLE `masters`
  ADD UNIQUE KEY `master_code` (`master_code`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_code`),
  ADD KEY `master_code` (`master_code`),
  ADD KEY `services_code` (`services_code`),
  ADD KEY `services_code_2` (`services_code`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD UNIQUE KEY `services_code` (`services_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `order_code` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `masters`
--
ALTER TABLE `masters`
  MODIFY `master_code` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_code` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `services_code` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`order_code`) REFERENCES `orders` (`order_code`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`master_code`) REFERENCES `masters` (`master_code`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`services_code`) REFERENCES `services` (`services_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
