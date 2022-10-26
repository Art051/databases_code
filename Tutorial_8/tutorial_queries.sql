-- Continuing yesterday's queries

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

-- DROP FUNCTION countandtotaleachbooksorders(querybookid int);

SELECT *
FROM countandtotaleachbooksorders(15);


-- Oli's solution (factors in multiple entries of book orders for the same book)
-- better approach than mine, mine did not consider multiple orders for the same bookid
-- DROP FUNCTION gettotalbookorders();

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


------------------------------------------------------------------ OF LECTURE 7 QUERIES ------------------------------------------------------------------

CREATE OR REPLACE FUNCTION books(sbookid int)
    RETURNS VARCHAR
    LANGUAGE plpgsql
AS
$$
DECLARE
    Title              varchar; -- declare variables to assign values to
    startTime CONSTANT time := NOW(); -- declare variables to assign values to
BEGIN
    RAISE NOTICE 'Executing block at: %', startTime;
    SELECT booktitle
    INTO Title
    FROM books
    WHERE bookid = sbookid;

    IF NOT FOUND THEN
        RAISE 'Nothing was found with the id of: %', sbookid;
    END IF;
    RETURN Title;
END;
$$;

SELECT *
FROM books(1);


-- using inout function to swap values, its taking the same values in as its putting out
CREATE OR REPLACE FUNCTION swap(INOUT x int, INOUT y int)
    LANGUAGE plpgsql
AS
$$
BEGIN
    SELECT x, y INTO y, x;
END;
$$;

SELECT swap(5, 4);


-- using inout for the function on line 210
CREATE OR REPLACE FUNCTION func_inoutbooks(INOUT bookname text)
    LANGUAGE plpgsql
AS
$$
DECLARE
    startTime CONSTANT time := NOW(); -- declare variables to assign values to
BEGIN
    PERFORM booktitle, startTime -- declare variables to assign values to
    FROM books
    WHERE books.booktitle LIKE bookname;
END;
$$;

SELECT func_inoutbooks('Why is this computer');


CREATE OR REPLACE FUNCTION func_NM_inoutbooks(INOUT bookname text)
    LANGUAGE plpgsql
AS
$$
DECLARE
    startTime CONSTANT time := NOW(); -- declare variables to assign values to
BEGIN
    RAISE NOTICE 'Executing block at: %', startTime;
    SELECT booktitle, startTime -- declare variables to assign values to
    FROM books
    WHERE books.booktitle LIKE bookname;
    IF NOT found THEN
        RAISE 'Noting was found with the name of: % ', bookname;
    END IF;
END;
$$;

SELECT *
FROM func_NM_inoutbooks(1);


-- LOOPS

-- fibonacci
DROP FUNCTION Fib(starting int);
CREATE OR REPLACE FUNCTION Fib(starting int) RETURNS int
    LANGUAGE plpgsql
AS
$$
DECLARE
    n       integer := starting;
    fib     integer := 0;
    counter integer := 0;
    i       integer := 0;
    j       integer := 1;
BEGIN
    IF (n < 1)
    THEN
        fib := 0;
    END IF;
    LOOP
        EXIT WHEN counter = n;
        counter := counter + 1;
        SELECT j, i + j INTO i, j;
    END LOOP;
    fib := i;
    RAISE NOTICE '%', fib;
    RETURN fib;
END;
$$;

SELECT *
FROM Fib(10);


DO
$$
    DECLARE
        count integer := 10;
        i     integer := 0;
    BEGIN
        LOOP
            EXIT WHEN i = count;
            RAISE NOTICE '%', i;
            i := i + 1;
        END LOOP;
    END;
$$;



BEGIN TRANSACTION

ROLLBACK TRANSACTION

COMMIT TRANSACTION

CREATE OR REPLACE FUNCTION BookCount2(sbookid integer, stockCheck integer)
    RETURNS integer
    LANGUAGE plpgsql
AS
$$
DECLARE
    _amountinstock int;
BEGIN
    IF (SELECT amountinstock
        FROM books
        WHERE bookid = sbookid) < stockCheck
    THEN
        RAISE 'Less than % in stock', stockCheck;
    END IF;
    RETURN _amountinstock;
END;
$$;

SELECT *
FROM bookcount2(37, 10);
SELECT *
FROM books
WHERE bookid = 5;



CREATE TABLE bankcustomer
(
    customerid    integer,
    name          varchar,
    balanceamount numeric
);


CASCADE
INSERT INTO bankcustomer(customerid, name, balanceamount)
VALUES (1, 'John', 10000.00);
INSERT INTO bankcustomer(customerid, name, balanceamount)
VALUES (2, 'Lucy', 5.00);
INSERT INTO bankcustomer(customerid, name, balanceamount)
VALUES (3, 'Dave', 0.00);


SELECT *
FROM bankcustomer;


CREATE
    OR REPLACE PROCEDURE MoveMoney(account1 integer, account2 integer, amount integer)
    LANGUAGE plpgsql AS
$$
BEGIN
    UPDATE bankcustomer SET balanceamount = balanceamount - amount WHERE customerid = 3;
    UPDATE bankcustomer SET balanceamount = balanceamount - amount WHERE customerid = ;

    IF (SELECT balanceamount FROM bankcustomer WHERE customerid = account1) < 0
    THEN
        ROLLBACK;
        raise 'not enough money';
        END IF;
    raise NOTICE 'Proceeding';
    COMMIT;
END
$$;

SELECT *
FROM bankcustomer;

CALL movemoney(3,2,3000);

SELECT *
FROM bankcustomer;


-- book orders from yesterday - ensure that orders for books cannot exceed stock level for that book
-- if it does, roll back

drop TRIGGER trgupdatestockvalue
drop function updatestockvalue

create or replace procedure stockupdate(sbookid integer, amount integer)
language plpgsql
AS $$
    BEGIN

        update books set amountinstock = amountinstock - amount where bookid = sbookid;

        if(select amountinstock from books where bookid = sbookid) < 1 OR
          (Select amountinstock from books where bookid = sbookid) is NULL then
            RAISE 'Not enough books in stock %', sbookid);
            ROLLBACK ;
            end IF;
        raise NOTICE 'Proceeding';
        END IF;
    END;
$$;
END;