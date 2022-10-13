--Get the count of books of a specific genre 

SELECT COUNT(BookID) as bookCount from Books WHERE BookGenre = 'horror';

--Get the total amount of books

SELECT SUM(AmountInStock) from Books;

--Get the total cost of all of the held books
SELECT SUM(AmountInStock * Price) from Books;

--Get the total cost of all of the orders combined
SELECT SUM(Books.Price * BookOrder.Quantity)
From Books 
INNER JOIN BookOrder on Books.BookID = BookOrder.BookID

--How many of each book have been ordered 
select DISTINCT Books.BookTitle, Books.BookID, (SELECT SUM(Quantity) FROM BookOrder WHERE BookID = Books.BookID) as quantity
from Books
INNER JOIN BookOrder  on Books.BookID = BookOrder.BookID
group by Books.BookTitle, Books.BookID,quantity



--How many book titles start with B – hint “LIKE” 
SELECT * FROM BOOKS WHERE BookTitle LIKE 'B%';

--Fulljoin books – customers – orders
SELECT *
From Books 
FULL JOIN BookOrder on Books.BookID = BookOrder.BookID
FULL JOIN Customer on Customer.CustomerID = BookOrder.CustomerID;

--right join orders and books – to see what books have sold

SELECT * FROM books
RIGHT JOIN BookOrder on Books.BookID = BookOrder.BookID
--Left join on orders and books – what do you see
SELECT * FROM books
LEFT JOIN BookOrder on Books.BookID = BookOrder.BookID

--Inner join all tables 
SELECT *
From Books 
FULL JOIN BookOrder on Books.BookID = BookOrder.BookID
FULL JOIN Customer on Customer.CustomerID = BookOrder.CustomerID;
