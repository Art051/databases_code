CREATE FUNCTION add(a integer, b integer) RETURNS integer
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN a + b;
END;
$$;

SELECT *
FROM add(1, 2);


-- DECLARE variable 'bookcount'
-- SELECT SUM(amountinstock) [amountinstock is a field in the existing table]
-- INTO [assign it to the variable we declared]
-- FROM [books] table
-- RETURN [Our variable 'bookcount]
CREATE FUNCTION bookcount() RETURNS integer
    LANGUAGE plpgsql
AS
$$
DECLARE
    bookcount integer;
BEGIN
    SELECT SUM(amountinstock)
    INTO bookcount
    FROM books;
    RETURN bookcount;
END;
$$;

SELECT *
FROM bookcount();


CREATE FUNCTION getbooks(search varchar)
    RETURNS table
            (
                title       varchar,
                genre       varchar,
                priceofbook numeric,
                stock       integer
            )
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY SELECT booktitle, bookgenre, price, amountinstock
                 FROM books
                 WHERE booktitle ILIKE search;
END;
$$;


-- using function to search for books which name begins with 'c' followed by any characters
SELECT *
FROM getbooks('c%');


-- Do any kind of join to get a book record from a book order:
CREATE FUNCTION getbookfromorders(order_query int)
    RETURNS table
            (
                orderno     int,
                title       varchar,
                priceofbook numeric
            )
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY SELECT bo.bookorder, b.booktitle, b.price
                 FROM bookorder bo
                          FULL JOIN books b ON bo.bookid = b.bookid
                 WHERE bo.bookorder = order_query;
END;
$$;

DROP FUNCTION getbookfromorders(order_query integer);


-- select the data corresponding to the bookorder = 1
SELECT *
FROM getbookfromorders(1);


CREATE OR REPLACE FUNCTION updatestockvalue()
    RETURNS trigger
    LANGUAGE plpgsql
AS
$$
DECLARE
    bookcount   integer;
    orderamount integer;
BEGIN
    SELECT amountinstock INTO bookcount FROM books WHERE bookid = new.bookid;
    SELECT quantity INTO orderamount FROM bookorder WHERE bookorder = new.bookorder;
    UPDATE books SET amountinstock = (bookcount - orderamount) WHERE bookid = new.bookid;
    RETURN new;
END;
$$;

-- create a trigger which listens for any inserts on the bookorder table, when it's triggered, it runs the updatestockvalue() function automatically
CREATE OR REPLACE TRIGGER trgupdatestockvalue
    AFTER INSERT
    ON bookorder
    FOR EACH ROW
EXECUTE PROCEDURE updatestockvalue();

SELECT *
FROM bookorder
WHERE bookid = 1;

SELECT *
FROM books
WHERE bookid = 1;

INSERT INTO bookorder (bookorder, bookid, customerid, quantity)
VALUES (1004, 1, 4, 10);

SELECT *
FROM bookorder
WHERE bookorder = 1001;


-- create a function to see how many of each book has been ordered
CREATE OR REPLACE FUNCTION counteachbooksorders(querybookid int)
    RETURNS table
            (
                title       varchar,
                priceofbook numeric,
                totalorders int,
                totalvalue  numeric
            )
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY SELECT booktitle, price, quantity, (price * quantity)
                 FROM books
                          FULL JOIN bookorder b ON books.bookid = b.bookid
                 WHERE books.bookid = querybookid;

END;
$$;

SELECT *
FROM counteachbooksorders(15);



-- Extra attempt
-- create a function to see how many of each book has been ordered and the price to give total spend
CREATE FUNCTION countandtotaleachbooksorders(querybookid int)
    RETURNS table
            (
                title       varchar,
                priceofbook numeric,
                totalorders numeric,
                totalvalue  numeric
            )
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY SELECT booktitle, price, quantity, (price * quantity)
                 FROM books
                          FULL JOIN bookorder b ON books.bookid = b.bookid
                 WHERE books.bookid = querybookid;

END;
$$;

DROP FUNCTION countandtotaleachbooksorders(querybookid int);

SELECT *
FROM countandtotaleachbooksorders(15);


-- Oli's solution (factors in multiple entries of book orders for the same book)
-- better approach than mine, mine did not consider multiple orders for the same bookid
DROP FUNCTION gettotalbookorders();

CREATE OR REPLACE FUNCTION getTotalBookorders(inbookid integer)
    RETURNS TABLE
            (
                funcBookID integer,
                ordered    numeric
            )
    LANGUAGE 'plpgsql'
AS
$$
BEGIN
    RETURN QUERY SELECT bookid, SUM(quantity)
                 FROM bookorder
                 WHERE bookorder.bookID = inbookid
                 GROUP BY bookid;
END;
$$;

SELECT *
FROM getTotalBookorders(1);
