-- count number of books in a specific genre
SELECT COUNT(books.bookgenre)
FROM books
WHERE bookgenre = 'horror';

-- total amount of books
SELECT COUNT(*)
FROM books;

-- total cost of all books
SELECT SUM(price)
FROM books;

-- total cost of all orders combined
SELECT SUM(bo.quantity * b.price)
FROM bookorder bo,
     books b
WHERE bo.bookid = b.bookid;

-- How many of each book has been ordered of all books
SELECT bookid,
       SUM(quantity)
FROM bookorder
GROUP BY bookid;

-- how many book titles start with B
SELECT COUNT(*)
FROM books b
WHERE b.booktitle LIKE 'B%';

-- fulljoin books - customers - orders
SELECT *
FROM books,
     customer,
     bookorder
         FULL JOIN bookorder b ON bookorder.bookid = b.bookid
         FULL JOIN customer c ON c.customerid = bookorder.customerid;

-- right join orders and books - too see what books have sold
SELECT *
FROM bookorder
         RIGHT JOIN books b ON bookorder.bookid = b.bookid;


-- left join orders and books - too see what books have sold
SELECT *
FROM bookorder
         LEFT JOIN books b ON bookorder.bookid = b.bookid;


-- inner join all tables
SELECT *
FROM bookorder bo
         INNER JOIN books b ON bo.bookid = b.bookid
         INNER JOIN customer c ON bo.customerid = c.customerid;
