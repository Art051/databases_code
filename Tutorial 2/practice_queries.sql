-- SELECT --
-- select all data from 'product' table
SELECT *
FROM product;

-- select firstname data from 'product' table
SELECT firstname
FROM users;

-- select userid and quantity from 'users_products' table
SELECT userid, quantity
FROM users_products;


-- COLUMN ALIASES --
-- select productname but use alias 'product' for column title, from 'product' table
SELECT productname AS product
FROM product;

-- select first name, concat with a space, concat the lastname and use alias 'full_name' for the new column title
SELECT firstname || ' ' || lastname AS "full name"
FROM users;


-- ORDER BY --
-- select all users from users table, arranged in alphabetical order based on surname - ordering by a single column
SELECT *
FROM users
ORDER BY lastname DESC;
-- can also use ASC

-- select all data from users_products table, sort by quantity descending and then user id ascending
SELECT *
FROM users_products
ORDER BY quantity DESC,
         userid ASC;

-- select all users from users table, sort by first name length
SELECT *
FROM users
ORDER BY LENGTH(firstname);


-- SELECT DISTINCT --
-- select the first occurance of each productid in the users_products table
SELECT DISTINCT productid
FROM users_products;

-- select the first occurance of each userid in the users_products table and order by userid
SELECT DISTINCT ON (userid) userid,
                            productid
FROM users_products
ORDER BY userid;


-- WHERE --
-- select user from users table where firstname equals 'Burt'
SELECT *
FROM users
WHERE firstname = 'Burt';

-- select user from users table where firstname equals 'Zabrina' AND lastname equals 'Broyd'
SELECT *
FROM users
WHERE firstname = 'Zabrina'
  AND lastname = 'Broyd';

-- select product from product table where price < 10 OR price > 60
SELECT *
FROM product
WHERE price < 5
   OR price > 60;

-- select firstname and lastname from users table where firstname equals any of the listed names
-- (in this instance 'Willem', 'Elwyn', 'Stepha')
SELECT firstname, lastname
FROM users
WHERE firstname IN ('Willem', 'Elwyn', 'Stepha');

-- select products from product table where the name begins with 'Soup'
--  NOTE: Wildcard expression '%' means any number of any character
--        Wildcard expression '_' means one of any character (e.g. 'S__p' would search for the letter 'S' then 2 of any character and then 'P')
SELECT *
FROM product
WHERE productname LIKE 'Soup%';

-- select all products from product table where price > 50.00
SELECT *
FROM product
WHERE price > 50.00;
-- other standard operators apply as per usual

-- select all products from product table where price is BETWEEN 5 and 45.60
SELECT *
FROM product
WHERE price BETWEEN 5 AND 45.60;

-- select products from product table where the name DOESN'T contain 'Soup'
SELECT *
FROM product
WHERE productname <> '%Soup%';


-- LIMIT --
-- PostgreSQL LIMIT is an optional clause of the SELECT statement that constrains the number of rows returned by the query.
-- select productname and price froom products table, but only find the first 25 entries
SELECT productname, price
FROM product
LIMIT 25;

-- offset results so that the row count starts on the row following the paramter (e.g. 'OFFSET 3' means counting starts at 4)
SELECT productname, price
FROM product
LIMIT 25 OFFSET 3;

-- finding all products, sorting by DESC, LIMIT 5 - finds the 5 most expensive products
SELECT *
FROM product
ORDER BY price DESC
LIMIT 5;

-- finding all products, sorting by ASC, LIMIT 5 - finds the 5 cheapest products
SELECT *
FROM product
ORDER BY price ASC
LIMIT 5;


-- FETCH --
-- FETCH is the SQL standard clause, serves the same purpose as LIMIT, but LIMIT s not SQL-standard
-- finding all products, sorting by ASC, LIMIT 5 - finds the 5 most expensive - NOTE: use 'FETCH FIRST <number> ROWS ONLY'
SELECT *
FROM product
ORDER BY price DESC
FETCH FIRST 5 ROWS ONLY;


-- IN --
-- Returns true if the value input matches any of the values in the list
-- find all users_products if the productid field is 3, 5 or 7 and order the results descending n the quantity column
select *
from users_products
WHERE productid IN (3,5,7) -- can use 'NOT IN' or '<>' to remove entries which meet the criteria
ORDER BY quantity DESC;


-- IS NULL --
-- returns fields which have NULL value - where no data exists in that cell
SELECT *
FROM product
WHERE reducedprice IS NULL;

-- JOINS
-- INNER -> Returns data only where the data in the columns from each table match
-- LEFT -> Returns all data from first table and any corresponding data from right table
-- RIGHT -> Returns all data from second table and any corresponding data from left table
-- FULL -> returns all data from both tables
-- FULL can be used to return tables' data where there is no overlap of data:
/*
 SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
FULL JOIN basket_b
   ON fruit_a = fruit_b
WHERE a IS NULL OR b IS NULL;
 */


 -- UNION
 /*
  The UNION operator removes all duplicate rows from the combined data set. To retain the duplicate rows, you use the the UNION ALL instead.
  */

  -- INTERSECT
  /*
   Like the UNION and EXCEPT operators, the PostgreSQL INTERSECT operator combines result sets of two or more SELECT statements into a single result set.
   */
/*

*/
