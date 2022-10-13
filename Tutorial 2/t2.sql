-- DROP TABLE Users_Products;
-- DROP TABLE Users;
-- DROP TABLE Product;


create table Users(
UserID integer primary key,
FirstName varchar(20),
LastName varchar(30) CONSTRAINT FirstName_not_LastName CHECK (FirstName <> LastName),
Password varchar(50)
);

create table Product(
ProductID integer primary key,
ProductName varchar(50) NOT NULL,
Price NUMERIC CONSTRAINT price_value_check CHECK (price > 0.01 AND price < 10000.0),
ReducedPrice NUMERIC CONSTRAINT reduced_price_CHK CHECK (Price > ReducedPrice)    
);

create table Users_Products(
UserProductsID integer primary key,
UserID integer,  
ProductID integer
);

alter table Users_Products add constraint Users_Products_UserID_FK foreign key (UserID) references Users(UserID); 
alter table Users_Products add constraint Users_Products_ProductID_FK foreign key (ProductID) references Product(ProductID); 

--(SELECT MAX(UserID) FROM Users)

-- create sequence Users_seq increment 1 start ((SELECT MAX(UserID) FROM Users) + 1);

create sequence Users_seq increment 1 start 1;
create sequence Product_seq increment 1 start 1;

SELECT * FROM Users;
SELECT * FROM Product;

INSERT INTO Users (UserID, FirstName, LastName, Password) VALUES (NEXTVAL('Users_seq'),'Nathan','Morgan', 'test');
INSERT INTO Users (UserID, FirstName, LastName, Password) VALUES (NEXTVAL('Users_seq'),'Nathan23','Morgan', 'test');
INSERT INTO Users (UserID, FirstName, LastName, Password) VALUES (NEXTVAL('Users_seq'),'Nathan3','Morgan', 'test');
INSERT INTO Users (UserID, FirstName, LastName, Password) VALUES (NEXTVAL('Users_seq'),'Nathan4','Morgan', 'test');

INSERT INTO Product (ProductID, ProductName, Price) VALUES (NEXTVAL('Product_seq'), 'Coffee', 2.40);
INSERT INTO Product (ProductID, ProductName, Price) VALUES (NEXTVAL('Product_seq'), 'Water', 1.20);

--hello 




