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
	ProductName varchar(50)
);

CREATE TABLE Users_Products(
UserProductsID integer primary KEY,
	UserID integer,
	ProductID integer
);

ALTER TABLE Users_Products ADD CONSTRAINT Users_Products_UserID_FK foreign key (UserID) references Users(UserID);
ALTER TABLE Users_Products ADD CONSTRAINT Users_Products_ProductID_FK foreign key (ProductID) references Product(ProductID);

SELECT * FROM Users;
SELECT * FROM Product;
