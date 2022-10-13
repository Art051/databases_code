CREATE SEQUENCE Users_seq INCREMENT 1 START 1;
CREATE SEQUENCE loan_seq INCREMENT 1 START 1;

CREATE TABLE Books
(
    bookID integer PRIMARY KEY,
    isbn   integer,
    title  varchar(100),
    author varchar(100),
    genre  varchar(50),
    year   date
);


CREATE TABLE Users
(
    UserID    integer PRIMARY KEY,
    FirstName varchar(20),
    LastName  varchar(30),
    Password  varchar(50)
);

CREATE TABLE loaned_books
(
    loan_no        integer PRIMARY KEY,
    bookID         integer,
    userid         integer,
    loan_start     date,
    loan_end       date,
    return_date    date,
    daily_late_fee money,
    payments_made  money
);

ALTER TABLE loaned_books
    ADD CONSTRAINT userid FOREIGN KEY (userid) REFERENCES Users (userid);

SELECT *
FROM books;
SELECT *
FROM users;
SELECT *
FROM loaned_books;
SELECT userid, firstname, lastname
FROM users
WHERE firstname IN ('Océanne', 'Lóng', 'Réservés');


SELECT Users.userid, firstname, lastname, Books.bookid, loan_no
FROM users,
     Books,
     loaned_books
WHERE Users.UserID IN (5, 20, 99);


SELECT userid, firstname, lastname
FROM users
WHERE firstname IN ('Océanne', 'Lóng', 'Réservés');


SELECT Users.userid, firstname, lastname, Books.bookid, loan_no
FROM users,
     Books,
     loaned_books
WHERE Users.UserID IN (5, 20, 99);

SELECT userid, firstname, lastname
FROM users
WHERE firstname IN ('Océanne', 'Lóng', 'Réservés');


SELECT *
FROM books
LIMIT 25 OFFSET 3;


SELECT *
FROM books
ORDER BY year DESC
LIMIT 25;


SELECT users.firstname, users.lastname, books.bookid, books.title, loaned_books.loan_no
FROM users
         INNER JOIN loaned_books ON users.userid = loaned_books.userid
         INNER JOIN books ON books.bookid = loaned_books.bookid;


SELECT bookid, title, author, year
FROM books
ORDER BY year ASC
LIMIT 10;

-- select the following fields, then create a new column: takes return date - loan end date * daily fee to find the late charge
-- soecifies the primary table as loaned books
--      then joins that with users table where loaned_books' and users' 'userid' matches
--      then joins that with books table where loaned_books' and users' 'bookid' matches
-- then limits the results to only show results where the book was returned after the loan ended, in order to only show customers who owe a positive amount
SELECT users.userid,
       firstname,
       lastname,
       books.isbn,
       title,
       loan_no,
       loan_end,
       return_date,
       loaned_books.daily_late_fee,
       ((return_date - loan_end) * daily_late_fee) AS charge
FROM loaned_books
         FULL JOIN users ON users.userid = loaned_books.userid
         FULL JOIN books ON books.bookid = loaned_books.bookid
WHERE return_date > loaned_books.loan_end;

-- Same as above, but trying SUBQUERY
-- in this case, looking to return all customers with the same queries above, but only customers who have an odd numbered userid
SELECT users.userid,
       firstname,
       lastname,
       books.isbn,
       title,
       loan_no,
       loan_end,
       return_date,
       loaned_books.daily_late_fee,
       ((return_date - loan_end) * daily_late_fee) AS charge
FROM loaned_books
         FULL JOIN users ON users.userid = loaned_books.userid
         FULL JOIN books ON books.bookid = loaned_books.bookid
WHERE return_date > loaned_books.loan_end
  AND loaned_books.userid IN
      (SELECT loaned_books.userid
       FROM Users
       WHERE (loaned_books.userid % 2) != 0);

-- Same as above, but trying SUBQUERY
-- in this case, looking to return all customers with the same queries above, but only customers who have an odd numbered userid
-- gave loaned_books alias of 'lb'
SELECT users.userid,
       firstname,
       lastname,
       books.isbn,
       title,
       lb.loan_no,
       loan_end,
       return_date,
       daily_late_fee,
       ((return_date - loan_end) * daily_late_fee) AS charge
FROM loaned_books lb
         FULL JOIN users ON users.userid = lb.userid
         FULL JOIN books ON books.bookid = lb.bookid
WHERE (return_date > lb.loan_end) >
      (SELECT avg(return_date - loaned_books.loan_end) as avg_charge
       FROM loaned_books
       WHERE (return_date - loan_end) > AVG(return_date - loan_end));
