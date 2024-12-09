-- -------------------------------------------------------------
-- TablePlus 6.2.0(576)
--
-- https://tableplus.com/
--
-- Database: db_app_food_official
-- Generation Time: 2024-12-09 21:28:28.2830
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pass_word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(1, 'Burger', 'burger.jpg', 5.99, 'Delicious beef burger', 1),
(2, 'Pizza', 'pizza.jpg', 7.99, 'Cheesy pepperoni pizza', 1),
(3, 'Ice Cream', 'ice_cream.jpg', 3.5, 'Vanilla ice cream', 2),
(4, 'Orange Juice', 'orange_juice.jpg', 2.99, 'Freshly squeezed orange juice', 3),
(5, 'Salad', 'salad.jpg', 4.99, 'Mixed greens with dressing', 4),
(6, 'Fried Chicken', 'fried_chicken.jpg', 6.5, 'Crispy fried chicken', 1),
(7, 'Chocolate Cake', 'chocolate_cake.jpg', 4.99, 'Rich chocolate cake slice', 2),
(8, 'Lemonade', 'lemonade.jpg', 3, 'Refreshing lemonade drink', 3),
(9, 'Grilled Salmon', 'grilled_salmon.jpg', 9.99, 'Grilled salmon with herbs', 4),
(10, 'Pasta', 'pasta.jpg', 7.5, 'Creamy Alfredo pasta', 1);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Fast Food'),
(2, 'Desserts'),
(3, 'Beverages'),
(4, 'Healthy Food');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_rate`) VALUES
(1, 1, '2024-12-01 12:15:00'),
(2, 1, '2024-12-02 14:35:00'),
(3, 3, '2024-12-03 10:50:00'),
(4, 4, '2024-12-04 18:25:00'),
(5, 5, '2024-12-05 16:20:00'),
(1, 4, '2024-12-06 09:00:00'),
(6, 1, '2024-12-06 11:10:00'),
(2, 5, '2024-12-07 14:00:00'),
(3, 4, '2024-12-07 15:30:00'),
(4, 1, '2024-12-08 10:00:00'),
(5, 2, '2024-12-08 12:45:00'),
(1, 5, '2024-12-09 13:15:00'),
(1, 4, '2024-12-09 17:00:00'),
(3, 1, '2024-12-10 11:00:00');

INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 2, 2, 'ORD001', '1'),
(2, 1, 1, 'ORD002', '2'),
(4, 1, 1, 'ORD008', '2'),
(3, 3, 3, 'ORD003', '3'),
(4, 5, 1, 'ORD004', '4'),
(5, 10, 1, 'ORD005', '5'),
(6, 6, 2, 'ORD006', NULL),
(4, 3, 2, 'ORD007', NULL),
(3, 1, 1, 'ORD009', '1'),
(7, 3, 1, 'ORD010', '1');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 5, '2024-12-01 12:00:00'),
(2, 2, 4, '2024-12-02 14:30:00'),
(3, 3, 3, '2024-12-03 10:45:00'),
(4, 4, 5, '2024-12-04 18:20:00'),
(5, 5, 4, '2024-12-05 16:10:00'),
(6, 1, 4, '2024-12-06 11:00:00');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(1, 'The Gourmet Kitchen', 'gourmet_kitchen.jpg', 'Fine dining restaurant with a focus on quality'),
(2, 'Fast Food Express', 'fast_food_express.jpg', 'Quick and affordable fast food for everyone'),
(3, 'Sweet Treats', 'sweet_treats.jpg', 'Specializing in desserts and sweet delights'),
(4, 'Healthy Bites', 'healthy_bites.jpg', 'Fresh and healthy meals for a balanced diet'),
(5, 'Beverage Bliss', 'beverage_bliss.jpg', 'A variety of beverages to quench your thirst');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Extra Cheese', 0.99, 2),
(2, 'French Fries', 1.5, 1),
(3, 'Chocolate Syrup', 0.5, 3),
(4, 'Grilled Chicken', 2.5, 5),
(5, 'Garlic Bread', 1, 10);

INSERT INTO `user` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', 'password123'),
(2, 'Bob Smith', 'bob.smith@example.com', 'pass@word1'),
(3, 'Charlie Brown', 'charlie.brown@example.com', 'securePass!'),
(4, 'Diana Prince', 'diana.prince@example.com', 'wonderWoman2024'),
(5, 'Edward Miller', 'edward.miller@example.com', 'ed@ward123'),
(6, 'Fiona Davis', 'fiona.davis@example.com', 'davis#5678'),
(7, 'George White', 'george.white@example.com', 'whitePass123'),
(8, 'Hannah Lee', 'hannah.lee@example.com', 'leeSecure456'),
(9, 'Ian Black', 'ian.black@example.com', 'blackPower789');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;