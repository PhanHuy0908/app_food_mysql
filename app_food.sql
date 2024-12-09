CREATE DATABASE db_app_food_official

CREATE TABLE `user` (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	pass_word VARCHAR(255)
)

INSERT INTO `user` (full_name, email, pass_word) VALUES
('Alice Johnson', 'alice.johnson@example.com', 'password123'),
('Bob Smith', 'bob.smith@example.com', 'pass@word1'),
('Charlie Brown', 'charlie.brown@example.com', 'securePass!'),
('Diana Prince', 'diana.prince@example.com', 'wonderWoman2024'),
('Edward Miller', 'edward.miller@example.com', 'ed@ward123'),
('Fiona Davis', 'fiona.davis@example.com', 'davis#5678'),
('George White', 'george.white@example.com', 'whitePass123'),
('Hannah Lee', 'hannah.lee@example.com', 'leeSecure456'),
('Ian Black', 'ian.black@example.com', 'blackPower789')

				  
CREATE TABLE food_type (
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(255)
)

INSERT INTO food_type (type_name) VALUES
('Fast Food'),
('Desserts'),
('Beverages'),
('Healthy Food')
			  
CREATE TABLE food (
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	image VARCHAR(255),
	price FLOAT,
	`desc` VARCHAR(255),
	type_id INT,
	
	FOREIGN KEY (type_id) REFERENCES food_type(type_id)
)


INSERT INTO food (food_name, image, price, `desc`, type_id) VALUES
('Burger', 'burger.jpg', 5.99, 'Delicious beef burger', 1),
('Pizza', 'pizza.jpg', 7.99, 'Cheesy pepperoni pizza', 1),
('Ice Cream', 'ice_cream.jpg', 3.50, 'Vanilla ice cream', 2),
('Orange Juice', 'orange_juice.jpg', 2.99, 'Freshly squeezed orange juice', 3),
('Salad', 'salad.jpg', 4.99, 'Mixed greens with dressing', 4),
('Fried Chicken', 'fried_chicken.jpg', 6.50, 'Crispy fried chicken', 1),
('Chocolate Cake', 'chocolate_cake.jpg', 4.99, 'Rich chocolate cake slice', 2),
('Lemonade', 'lemonade.jpg', 3.00, 'Refreshing lemonade drink', 3),
('Grilled Salmon', 'grilled_salmon.jpg', 9.99, 'Grilled salmon with herbs', 4),
('Pasta', 'pasta.jpg', 7.50, 'Creamy Alfredo pasta', 1)
				 
CREATE TABLE sub_food (
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(255),
	sub_price FLOAT,
	food_id INT,
	
	FOREIGN KEY (food_id) REFERENCES food(food_id)
)

INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
('Extra Cheese', 0.99, 2),
('French Fries', 1.50, 1),
('Chocolate Syrup', 0.50, 3),
('Grilled Chicken', 2.50, 5),
('Garlic Bread', 1.00, 10)
					 
CREATE TABLE `order` (
	user_id INT,
	food_id INT,
	amount INT,
	`code` VARCHAR(255),
	arr_sub_id VARCHAR(255),
	
	FOREIGN KEY (user_id) REFERENCES `user`(user_id),
	FOREIGN KEY (food_id) REFERENCES food(food_id)
)

INSERT INTO `order` (user_id, food_id, amount, `code`, arr_sub_id) VALUES
(1, 2, 2, 'ORD001', '1'),
(2, 1, 1, 'ORD002', '2'),
(4, 1, 1, 'ORD008', '2'),
(3, 3, 3, 'ORD003', '3'),
(4, 5, 1, 'ORD004', '4'),
(5, 10, 1, 'ORD005', '5'),
(6, 6, 2, 'ORD006', NULL),
(4, 3, 2, 'ORD007', NULL),
(3, 1, 1, 'ORD009', '1'),
(7, 3, 1, 'ORD010', '1')

CREATE TABLE restaurant (
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(255),
	image VARCHAR(255),
	`desc` VARCHAR(255)
)

INSERT INTO restaurant (res_name, image, `desc`) VALUES
('The Gourmet Kitchen', 'gourmet_kitchen.jpg', 'Fine dining restaurant with a focus on quality'),
('Fast Food Express', 'fast_food_express.jpg', 'Quick and affordable fast food for everyone'),
('Sweet Treats', 'sweet_treats.jpg', 'Specializing in desserts and sweet delights'),
('Healthy Bites', 'healthy_bites.jpg', 'Fresh and healthy meals for a balanced diet'),
('Beverage Bliss', 'beverage_bliss.jpg', 'A variety of beverages to quench your thirst')

CREATE TABLE rate_res (
	user_id INT,
	res_id INT,
	amount INT,
	date_rate DATETIME,
	
	FOREIGN KEY (user_id) REFERENCES `user`(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
)

INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 1, 5, '2024-12-01 12:00:00'),
(2, 2, 4, '2024-12-02 14:30:00'),
(3, 3, 3, '2024-12-03 10:45:00'),
(4, 4, 5, '2024-12-04 18:20:00'),
(5, 5, 4, '2024-12-05 16:10:00'),
(6, 1, 4, '2024-12-06 11:00:00')

CREATE TABLE like_res (
	user_id INT,
	res_id INT,
	date_rate DATETIME,
	
	FOREIGN KEY (user_id) REFERENCES `user`(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
)

INSERT INTO like_res (user_id, res_id, date_rate) VALUES
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
(3, 1, '2024-12-10 11:00:00')


-- Tim 5 nguoi da like nha hang nhieu nhat
SELECT `user`.full_name, COUNT(like_res.user_id) AS 'So lan like'
FROM like_res
INNER JOIN `user` ON `user`.user_id = like_res.user_id
GROUP BY like_res.user_id
ORDER BY `So lan like` DESC
LIMIT 5

-- Tim 2 nha hang co luot like nhieu nhat
SELECT restaurant.res_name, COUNT(like_res.res_id) AS 'So lan like'
FROM like_res
INNER JOIN restaurant ON restaurant.res_id = like_res.res_id
GROUP BY like_res.res_id
ORDER BY `So lan like` DESC
LIMIT 2

-- Tim nguoi dat hang nhieu nhat
SELECT `user`.full_name, COUNT(`order`.user_id) AS 'So lan order'
FROM `order`
INNER JOIN `user` ON `user`.user_id = `order`.user_id
GROUP BY `order`.user_id
ORDER BY `So lan order` DESC
LIMIT 1

-- Tim nguoi dung ko hoat dong trong he thong
SELECT `user`.full_name
FROM `user`
LEFT JOIN like_res ON `user`.user_id = like_res.user_id
LEFT JOIN rate_res ON `user`.user_id = rate_res.user_id
LEFT JOIN `order` ON `user`.user_id = `order`.user_id
WHERE like_res.user_id IS NULL
  AND rate_res.user_id IS NULL
  AND `order`.user_id IS NULL



				 
				 