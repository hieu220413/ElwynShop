--CREATE DATABASE Elwyn_Shop;

 --Drop database Elwyn_Shop
-- SELECT * FROM Admin
-- SELECT * FROM Users
-- SELECT * FROM Support
-- SELECT * FROM Category
-- SELECT * FROM Product
-- SELECT * FROM Order_product
-- SELECT * FROM Orders

CREATE TABLE Admin (
    admin_ID INT PRIMARY KEY,
    username VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
)

CREATE TABLE Users (
    user_ID INT PRIMARY KEY,
    username VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    phone VARCHAR(20) UNIQUE,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
)

CREATE TABLE Support (
    support_ID INT PRIMARY KEY,
    admin_ID INT FOREIGN KEY REFERENCES Admin(admin_ID),
    user_ID INT FOREIGN KEY REFERENCES Users(user_ID)
    ON DELETE CASCADE ON UPDATE CASCADE,
    details VARCHAR(300),
    dates DATE
)

CREATE TABLE Category (
    category_ID INT PRIMARY KEY ,
    name VARCHAR(100)
) 

CREATE TABLE Product (
    product_ID INT PRIMARY KEY ,
    category_ID INT FOREIGN KEY REFERENCES Category(category_ID),
    gender VARCHAR(50),
    price INT,
    short_details VARCHAR(100),
    long_details VARCHAR(500),
    images_path VARCHAR(500),
    publish_date DATE,
    quantity INT,
    name VARCHAR(100) 
)

CREATE TABLE Orders (
    order_ID INT IDENTITY(1,1) PRIMARY KEY,
    user_ID INT FOREIGN KEY REFERENCES Users(user_ID),
    date DATE,
    total_amount INT,
    payment_method VARCHAR(100)
)

CREATE TABLE Order_product (
    order_ID INT FOREIGN KEY REFERENCES Orders(order_ID),
    product_ID INT FOREIGN KEY REFERENCES Product(product_ID)
)

ALTER TABLE Order_product
ADD quantity INT;

--Category
	insert into Category (category_ID,name)
	values
		(1,'shirt'),
		(2,'dress'),
		(3,'pant'),
		(4,'jacket'),
		(5,'hoodie'),
		(6,'croptop'),
		(7,'combo');


--Danh cho Women
insert into Product(product_ID,category_ID,gender,price,short_details,long_details,images_path,publish_date,quantity,name)
values 
	(1,6,'female',100,'','','..\images\Women\Croptop\Croptop1.jpg','03/03/2022',50,'Croptop_1'),
	(2,6,'female',250,'','','..\images\Women\Croptop\Croptop2.jpg','03/03/2022',50,'Croptop_2'),
	(3,6,'female',300,'','','..\images\Women\Croptop\Croptop3tim.jpg','03/03/2022',50,'Croptop_3tim'),
	(4,6,'female',400,'','','..\images\Women\Croptop\Croptop3vang.jpg','03/03/2022',50,'Croptop_3vang'),
	(5,6,'female',100,'','','..\images\Women\Croptop\Croptop3xanhlam.jpg','03/03/2022',50,'Croptop_3xanhla'),
	(6,5,'female',150,'','','..\images\Women\Hoodies\hoodie1_be.jpg','03/03/2022',50,'Hoodie_1_be'),
	(7,5,'female',120,'','','..\images\Women\Hoodies\hoodie1_den.jpg','03/03/2022',50,'Hoodie_1_den'),
	(8,5,'female',110,'','','..\images\Women\Hoodies\hoodie1_xam.jpg','03/03/2022',50,'Hoodie_1_xam'),
	(9,5,'female',600,'','','..\images\Women\Hoodies\hoodie2.jpg','03/03/2022',50,'Hoodie_2'),
	(10,5,'female',80,'','','..\images\Women\Hoodies\hoodie3.jpg','03/03/2022',50,'Hoodie_3'),
	(11,4,'female',100,'','','..\images\Women\Jacket\jacket1.jpg','03/03/2022',50,'Jacket_1'),
	(12,4,'female',100,'','','..\images\Women\Jacket\jacket2.jpg','03/03/2022',50,'Jacket_2'),
	(13,4,'female',100,'','','..\images\Women\Jacket\jacket3.jpg','03/03/2022',50,'Jacket_3'),
	(14,1,'female',100,'','','..\images\Women\Shirt\shirt1_trang.jpg','03/03/2022',50,'Shirt_1_trang'),
	(15,1,'female',100,'','','..\images\Women\Shirt\shirt1_xanh.jpg','03/03/2022',50,'Shirt_1_xanh'),
	(16,1,'female',100,'','','..\images\Women\Shirt\shirt2_tim.jpg','03/03/2022',50,'Shirt_2_tim'),
	(17,1,'female',100,'','','..\images\Women\Shirt\shirt2_trang.jpg','03/03/2022',50,'Shirt_2_trang');

--../images/Men/Hoodie/hoodie_nam_1.jpg	

--Danh cho Men
insert into Product(product_ID,category_ID,gender,price,short_details,long_details,images_path,publish_date,quantity,name)
values 
	(18,5,'male',100,'','','..\images\Men\Hoodie\hoodie_nam_1.jpg','03/03/2022',50,'Hoodie_nam_1'),
	(19,5,'male',100,'','','..\images\Men\Hoodie\hoodie_nam_2.jpg','03/03/2022',50,'Hoodie_nam_2'),
	(20,5,'male',100,'','','..\images\Men\Hoodie\hoodie_nam_3.jpg','03/03/2022',50,'Hoodie_nam_3'),
	(21,4,'male',100,'','','..\images\Men\Jacket\jacket_nam_1.jpg','03/03/2022',50,'jacket_nam_1'),
	(22,4,'male',100,'','','..\images\Men\Jacket\jacket_nam_2.jpg','03/03/2022',50,'jacket_nam_2'),
	(23,4,'male',100,'','','..\images\Men\Jacket\jacket_nam_3.jpg','03/03/2022',50,'jacket_nam_3'),
	(24,4,'male',100,'','','..\images\Men\Jacket\jacket_nam_4.jpg','03/03/2022',50,'jacket_nam_4'),
	(25,4,'male',100,'','','..\images\Men\Jacket\jacket_nam_5.jpg','03/03/2022',50,'jacket_nam_5'),
	(26,1,'male',100,'','','..\images\Men\Shirt\Shirt_nam_1.jpg','03/03/2022',50,'shirt_nam_1'),
	(27,1,'male',100,'','','..\images\Men\Shirt\Shirt_nam_2.jpg','03/03/2022',50,'shirt_nam_2'),
	(28,1,'male',100,'','','..\images\Men\Shirt\Shirt_nam_3.jpg','03/03/2022',50,'shirt_nam_3'),
	(29,1,'male',100,'','','..\images\Men\Shirt\Shirt_nam_4.jpg','03/03/2022',50,'shirt_nam_4');

--Danh cho Kid
insert into Product(product_ID,category_ID,gender,price,short_details,long_details,images_path,publish_date,quantity,name)
values 
	(30,3,'boy',100,'','','..\images\Kid\Pant\Pant_boy_1.jpg','03/03/2022',50,'Pant_boy_1'),
	(31,3,'boy',100,'','','..\images\Kid\Pant\Pant_boy_2.jpg','03/03/2022',50,'Pant_boy_2'),
	(32,3,'boy',100,'','','..\images\Kid\Pant\Pant_boy_3.jpg','03/03/2022',50,'Pant_boy_3'),
	(33,3,'boy',100,'','','..\images\Kid\Pant\Pant_boy_4.jpg','03/03/2022',50,'Pant_boy_4'),
	(34,1,'boy',100,'','','..\images\Kid\Shirt\Shirt_boy_1.jpg','03/03/2022',50,'Shirt_boy_1'),
	(35,1,'boy',100,'','','..\images\Kid\Shirt\Shirt_boy_2.jpg','03/03/2022',50,'Shirt_boy_2'),
	(36,1,'boy',100,'','','..\images\Kid\Shirt\Shirt_boy_3.jpg','03/03/2022',50,'Shirt_boy_3'),
	(37,1,'boy',100,'','','..\images\Kid\Shirt\Shirt_boy_4.jpg','03/03/2022',50,'Shirt_boy_4'),
	(38,1,'boy',100,'','','..\images\Kid\Shirt\Shirt_boy_5.jpg','03/03/2022',50,'Shirt_boy_5'),
	(39,2,'girl',100,'','','..\images\Kid\Dress\Dress_1.jpg','03/03/2022',50,'Dress_1'),
	(40,2,'girl',100,'','','..\images\Kid\Dress\Dress_2.jpg','03/03/2022',50,'Dress_2'),
	(41,2,'girl',100,'','','..\images\Kid\Dress\Dress_3.jpg','03/03/2022',50,'Dress_3'),
	(42,2,'girl',100,'','','..\images\Kid\Dress\Dress_4.jpg','03/03/2022',50,'Dress_4'),
	(43,2,'girl',100,'','','..\images\Kid\Dress\Dress_5.jpg','03/03/2022',50,'Dress_5'),
	(44,2,'girl',100,'','','..\images\Kid\Dress\Dress_6.jpg','03/03/2022',50,'Dress_6'),
	(45,3,'girl',100,'','','..\images\Kid\Pant\Pant_1.jpg','03/03/2022',50,'Pant_1'),
	(46,3,'girl',100,'','','..\images\Kid\Pant\Pant_2.jpg','03/03/2022',50,'Pant_2'),
	(47,3,'girl',100,'','','..\images\Kid\Pant\Pant_3.jpg','03/03/2022',50,'Pant_3'),
	(48,3,'girl',100,'','','..\images\Kid\Pant\Pant_4.jpg','03/03/2022',50,'Pant_4'),
	(49,7,'girl',100,'','','..\images\Kid\Pant\Pant_5_compo.jpg','03/03/2022',50,'Pant_5_compo'),
	(50,7,'girl',100,'','','..\images\Kid\Pant\Pant_6_compo.jpg','03/03/2022',50,'Pant_6_compo');
	
UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 1

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 2

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 3

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 4



UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 30

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 31

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 32

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 33

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 34

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 35

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 36

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 37

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 38

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 39

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 40

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 41

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 42

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 43

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 44

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 45

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 46

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 47

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 48

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 49

UPDATE Product
SET short_details = 'The fabric should be smooth and not irritate the skin. It should be light weight.',
long_details = 'The fabric should be smooth and not irritate the skin. It should be light weight. The fabric should be selected according to the climate to make it more suitable for eg: during summer cotton clothes should be preferred as cotton absorbs perspiration easily.'
WHERE product_ID = 50


        --insert order
SELECT * FROM Orders
INSERT into Orders 
VALUES  (1,'2022-03-13',300,'credit card'),
        (1,'2022-03-13',100,'credit card'),
        (1,'2022-03-13',200,'credit card');
            -- phần test của Bình, Vui lòng đừng xóa, thank you :))
-- Support
	INSERT INTO Support (support_ID, user_ID, details, admin_ID, dates)
    VALUES(1, 1, 'GOOD SERVICE', 1, GETDATE())
    INSERT INTO Support (support_ID, user_ID, details, admin_ID, dates)
    VALUES(2, 2, 'GOOD SERVICE 2', 1, GETDATE())
    INSERT INTO Support (support_ID, user_ID, details, admin_ID, dates)
    VALUES(3, 3, 'GOOD SERVICE 3', 1, GETDATE())
    INSERT INTO Support (support_ID, user_ID, details, admin_ID, dates)
    VALUES(4, 4, 'GOOD SERVICE', 1, GETDATE())
    INSERT INTO Support (support_ID, user_ID, details, admin_ID, dates)
    VALUES(5, 5, 'GOOD SERVICE', 1, GETDATE())
    INSERT INTO Support (support_ID, user_ID, details, admin_ID, dates)
    VALUES(6, 6, 'GOOD SERVICE', 1, GETDATE())

-- Admin
    INSERT INTO Admin(admin_ID, username, password, name, email)
    VALUES (1, 'admin', '1', 'Vien Quoc Binh', 'binhvqse161554@fpt.edu.vn')

-- User
    INSERT INTO Users(user_ID, username, password, phone, name, email)
    VALUES (1, 'user1', 2, '0909090909', 'user 1', 'user1@gmail.com')

     INSERT INTO Users(user_ID, username, password, phone, name, email)
    VALUES (2, 'user2', 2, '0909090902', 'user 1', 'user2@gmail.com')

    INSERT INTO Users(user_ID, username, password, phone, name, email)
    VALUES (3, 'user3', 2, '0909090908', 'user 1', 'user3@gmail.com')

    INSERT INTO Users(user_ID, username, password, phone, name, email)
    VALUES (4, 'user4', 2, '0909090907', 'user 1', 'user4@gmail.com')

    INSERT INTO Users(user_ID, username, password, phone, name, email)
    VALUES (5, 'user5', 2, '0909090906', 'user 1', 'user5@gmail.com')

    INSERT INTO Users(user_ID, username, password, phone, name, email)
    VALUES (6, 'user6', 2, '0909090905', 'user 1', 'user6@gmail.com')

    SELECT user_ID, username, password, phone, name, email 
    FROM Users
    WHERE user_ID = 1
 
 SELECT s.support_ID, u.username, u.email, s.details, s.admin_ID, s.dates 
 FROM Support s
 JOIN Users u ON u.user_ID = s.user_ID

 SELECT COUNT(support_ID) FROM Support

 SELECT admin_ID  FROM Admin
 WHERE username LIKE 'admin' AND password = '1'
 
 UPDATE Users
 SET username = 'user',
 password = '2',
 phone ='0909090909',
 name='user 1',
 email='user1@gmail.com'
 WHERE user_ID = 1

 DELETE FROM Users
 WHERE user_ID = 1

 SELECT user_ID, username, password, phone, name, email 
 FROM Users
 WHERE username LIKE '%t%' OR phone LIKE '%a%' OR email LIKE '%u%'

  SELECT COUNT(user_ID) FROM Users

SELECT user_ID, username, password, phone, name, email FROM Users
WHERE username LIKE '%u%' OR phone LIKE '%u%' OR email LIKE '%u%'
ORDER BY user_ID ASC
OFFSET 0 ROW FETCH NEXT 5 ROW ONLY

 DELETE FROM Support
 WHERE support_ID = 1


 SELECT * FROM Admin
 SELECT * FROM Users
 SELECT * FROM Support
 SELECT * FROM Product

 update Users
 set user_ID = 7
 where user_ID = 8

DELETE Users WHERE user_ID = 7
DELETE Support WHERE support_ID = 7
 
INSERT INTO Users(user_ID, username, password, phone, name, email)
VALUES (7, 'usertest', 2, '09090909044', 'user test', 'usertest@gmail.com')

INSERT INTO Support (support_ID, user_ID, details, admin_ID, dates)
VALUES(7, 7, 'testwer', 1, GETDATE())

SELECT * FROM Support
ORDER BY dates DESC

SELECT user_ID, username, password, phone, name, email FROM Users
WHERE username LIKE '%u%' OR phone LIKE '%u%' OR email LIKE '%u%'
ORDER BY user_ID ASC
OFFSET 0 ROW FETCH NEXT 5 ROW ONLY
ORDER BY dates DESC


UPDATE Product
SET quantity = quantity - 1
WHERE product_ID = 1


