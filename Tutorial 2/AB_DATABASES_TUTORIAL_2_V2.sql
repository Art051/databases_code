DROP table Users_Products;
DROP table users;
DROP table product;


CREATE TABLE Users(
UserID integer primary KEY,
FirstName varchar(20),
LastName varchar(30),
Password varchar(50)
);

CREATE TABLE Product(
ProductID integer primary KEY,
	ProductName varchar(50),
	Price NUMERIC CONSTRAINT price_value_check CHECK (price > 0.01 AND Price < 1000.0), -- this adds a constraint to ensure the price is between 0.01 and 1000.0
	ReducedPrice NUMERIC CONSTRAINT reduced_price_CHK CHECK (Price > ReducedPrice) -- this adds a constraint to ensure the original price is higher than the reduced price
);

CREATE TABLE Users_Products(
UserProductsID integer primary KEY,
	UserID integer,
	ProductID integer,
	Quantity integer
);

-- adding constraints to columns - both assigning foreign keys
ALTER TABLE Users_Products ADD CONSTRAINT Users_Products_UserID_FK foreign key (UserID) references Users(UserID);
ALTER TABLE Users_Products ADD CONSTRAINT Users_Products_ProductID_FK foreign key (ProductID) references Product(ProductID);


--(SELECT MAX(UserID) FROM Users)

-- Begin automated seuqence for number entries
create sequence Users_seq increment 1 start 1;
create sequence Product_seq increment 1 start 1;
create sequence UserProduct_seq increment 1 start 1;

--SELECT every entry on both the tables (named after the 'FROM' keyword)
SELECT * FROM Users_products;
SELECT * FROM UserProduct_seq;

-- inserting an entry into users_products, with UserProductsID = sequential number automatically generated from line 35, UserID = 2, ProductID = 1, quantity = 100
-- NOTE:
-- THIS WILL NOT WORK UNTIL USERS HAVE BEEN ADDED TO THE USERS TABLE, THE CONSTRAINTS DEMAND A VALID USERID IS INPUT, WHICH YU WILL NOT HAVE IF THERE'S NO USER NUMBER '2'
-- LIKEWISE, IT WILL NOT WORK UNTIL THERE ARE PRDUCTS IN THE PRODUCT TABLE, AGAIN DUE TO CONSTRAINTS DEMANDING A VALID PRODUCTID
INSERT INTO users_products (UserProductsID, UserID, ProductID, Quantity) VALUES (NEXTVAL('UserProduct_seq'),2,2, 100);
INSERT INTO users_products (UserProductsID, UserID, ProductID, Quantity) VALUES (NEXTVAL('UserProduct_seq'),2,2, 20);
INSERT INTO users_products (UserProductsID, UserID, ProductID, Quantity) VALUES (NEXTVAL('UserProduct_seq'),2,2, 55);
INSERT INTO users_products (UserProductsID, UserID, ProductID, Quantity) VALUES (NEXTVAL('UserProduct_seq'),2,2, 12);


SELECT * FROM Users_Products WHERE User_ID = 2;


-- select all entries from each table
SELECT * FROM Users;
SELECT * FROM Product;

-- insert users into the users table, using the auto-incrementing sequence from Line 35
-- NOTE: I HAVE NOT USED THIS BLOCK - I SOLELY USED MOCKAROO FOR CONVENIENCE, SO THE USERS ARE CONSISTENT AND NOT MISSING 1 TO 10 AS MENTIONED IN TUTORIAL
INSERT INTO Users (UserID, FirstName, LastName, Password) VALUES (NEXTVAL('Users_seq'),'nathan','morgan','test');
INSERT INTO Users (UserID, FirstName, LastName, Password) VALUES (NEXTVAL('Users_seq'),'nathan','morgan','test');
INSERT INTO Users (UserID, FirstName, LastName, Password) VALUES (NEXTVAL('Users_seq'),'nathan','morgan','test');
INSERT INTO Users (UserID, FirstName, LastName, Password) VALUES (NEXTVAL('Users_seq'),'nathan','morgan','test');


-- insert users into the product table, using the auto-incrementing sequence from Line 33
INSERT INTO Product (ProductID, ProductName, Price) VALUES (NEXTVAL('Product_seq'),'Coffee', 2.40);
INSERT INTO Product (ProductID, ProductName, Price) VALUES (NEXTVAL('Product_seq'),'Water', 1.20);


-- selectinG productid, productname, productprice from product table
SELECT ProductID, ProductName, Price, ReducedPrice FROM Product WHERE ProductName = 'Coffee';
SELECT ProductID, ProductName, Price, ReducedPrice FROM Product WHERE ProductID = 2;


-- combining conditions inside a WHERE query (finding by first name and also password)
-- NOTE: THIS WILL NOT WORK DUE TO DELETIN THE NATHAN ENTRIES - CAN SUBSITITUTE OTHER NAMES FROM DATASET TO TEST IT WORKS
SELECT * FROM Users WHERE firstname = 'nathan' AND Password  = 'test';
	-- FOR MY MOCKAROO DATASET, THE FOLLOWING WILL RETURN A VALID RESULT:
SELECT * FROM Users WHERE firstname = 'Jillian' AND Password  = '6z967rid';


-- finding average price in product table
SELECT AVG(Price) FROM Product;

-- finding MAX price in product table
SELECT MAX(Price) FROM Product;

-- finding SUM of prices in product table
SELECT SUM(Price) FROM Product;

-- finding MIN price in product table
SELECT MIN(Price) FROM Product;

-- count the number of users from the users tables
SELECT COUNT(UserID) FROM Users;


-- Updating a record, we add a WHERE clause to specify the user to update
--NOTE: DON'T USE THIS, IT WAS JUST A TEST NATHAN USED TO TRICK POSTGRES
--UPDATE SET FirstName = 'Dave' WHERE UserID = (UserID % 2 = 2);

-- Select user with ID '1' to check their record and confirm the change was made
SELECT * FROM Users WHERE UserID = 1;

-- Deleting a user, we add a WHERE clause to specify the user to delete
DELETE FROM Users WHERE UserID = 1;

-- Select all from users_products where the user_id = 2
SELECT * FROM users_products WHERE UserID = 2;

-- SUM the total purchases count in users_products of products with product_id = 2  which are from user number 2
SELECT SUM (Quantity) FROM Users_products WHERE UserID = 2 AND ProductID = 2;

-- Using two select statements to then multiply with each other to find the total spent on product '2' from customer '2'
SELECT (
	(SELECT SUM(Quantity) FROM Users_Products WHERE UserID = 2 AND ProductID = 2) -- SUM quantity of products in 'users_products' which are linked to UserID '2' and ProductID '2'
		* (SELECT Price FROM Product WHERE ProductID = 2)); -- SELECT the price of product_ID '2' from the 'Product' table - this s then multiplied with the line above to get the total spent
