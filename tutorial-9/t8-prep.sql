CREATE TABLE movie
(
    movieID    integer PRIMARY KEY,
    movieTitle varchar,
    ageRating  integer,
    ticketCost numeric
);

CREATE TABLE customer
(
    CustomerID          integer PRIMARY KEY,
    CustomerFirstName   varchar(50),
    CustomerLastName    varchar(50),
    CustomerDOB         Date,
    CustomerPhoneNumber varchar(15),
    CustomerAddress     varchar(500),
    CustomerPostCode    varchar(10)
);
CREATE TABLE movieShowing
(
    ShowingID      integer PRIMARY KEY,
    ViewingDate    DATE,
    TotalSeats     integer,
    AvailableSeats integer,
    MovieID        integer

);


CREATE TABLE ticketPurchase
(
    purchaseID integer PRIMARY KEY,
    CustomerID integer,
    MovieID    integer,
    ShowingID  integer,
    Quantity   integer
);

ALTER TABLE movieShowing
    ADD CONSTRAINT MovieID_MovieShowing_FK FOREIGN KEY (MovieID) REFERENCES Movie (MovieID);
ALTER TABLE ticketPurchase
    ADD CONSTRAINT MovieID_ticketPurcase_FK FOREIGN KEY (MovieID) REFERENCES Movie (MovieID);
ALTER TABLE ticketPurchase
    ADD CONSTRAINT CustomerID_ticketPurcase_FK FOREIGN KEY (CustomerID) REFERENCES customer (CustomerID);
ALTER TABLE ticketPurchase
    ADD CONSTRAINT ShowingID_ticketPurcase_FK FOREIGN KEY (ShowingID) REFERENCES movieShowing (ShowingID);

DROP TABLE movieshowing CASCADE;
INSERT INTO movie (MovieID, MovieTitle, ageRating, TicketCost)
VALUES (1, 'Lord of teh rungs', 18, 20.00);
INSERT INTO movie (MovieID, MovieTitle, ageRating, TicketCost)
VALUES (2, 'Lord of teh rungs: the two towers', 18, 20.00);
INSERT INTO movie (MovieID, MovieTitle, ageRating, TicketCost)
VALUES (3, 'Lord of teh rungs: big battle time', 18, 20.00);


INSERT INTO customer(CustomerID, CustomerFirstName, CustomerLastName, CustomerDOB, CustomerPhoneNumber, CustomerAddress,
                     CustomerPostCode)
VALUES (1, 'dave', 'jones', '2022-08-21', '01792 444222', '53 street street', 'sa5 5po');


INSERT INTO movieShowing (ShowingID, ViewingDate, TotalSeats, AvailableSeats, MovieID)
VALUES (1, '2022-10-28', 100, 9, 1);
INSERT INTO movieShowing (ShowingID, ViewingDate, TotalSeats, AvailableSeats, MovieID)
VALUES (2, '2022-10-25', 100, 0, 1);
INSERT INTO movieShowing (ShowingID, ViewingDate, TotalSeats, AvailableSeats, MovieID)
VALUES (3, '2022-10-29', 100, 100, 1);
INSERT INTO movieShowing (ShowingID, ViewingDate, TotalSeats, AvailableSeats, MovieID)
VALUES (4, '2022-10-30', 100, 0, 1);


-------------------- Queries during lecture --------------------
SELECT *
FROM movieShowing;


CREATE OR REPLACE FUNCTION updateAvailableSeats() RETURNS trigger AS
$$
DECLARE
    seatCount ;
    orderAmount;
BEGIN
    SELECT availableseats INTO seatCount FROM movieshowing WHERE ShowingID = new.showingId;
    SELECT quantity INTO orderAmount FROM ticketPurchase WHERE purchaseID = new.purchaseID;

    UPDATE movieshowing SET availableseats = (seatCount - orderAmount) WHERE showingid = new.showingid;
    RETURN new;
END;
$$
    LANGUAGE plpgsql;

CREATE TRIGGER trg_updateavailableseats
    AFTER INSERT
    ON ticketPurchase
    FOR EACH ROW
EXECUTE PROCEDURE updateAvailableSeats();

INSERT INTO ticketPurchase(purchaseID, CustomerID, MovieID, ShowingID, Quantity)
VALUES (1, 1, 1, 1, 8);

SELECT *
FROM ticketPurchase;

SELECT *
FROM movieshowing
WHERE ShowingID = 1;


-- Creating triggers, functions, transactions
-- BEGIN
-- commit
-- rollback
----------------------------- CHALLENGES -------------------------------


--challenges--Age check procedure
-- SELECT ( SELECT extract(year from (age(timestamp '2020-01-02'))) < 18)
CREATE OR REPLACE PROCEDURE proc_checkCustAge(p_purchaseid integer, p_customerid integer, p_movieid integer,
                                              p_showingid integer, p_quantity integer)
    LANGUAGE plpgsql AS
$$
DECLARE
    age         date;
    d_agerating integer;
BEGIN
    SELECT customerdob INTO age FROM customer WHERE CustomerID = p_customerid;
    SELECT agerating INTO d_agerating FROM movie WHERE movieID = p_movieid;
    INSERT INTO ticketPurchase (purchaseID, CustomerID, MovieID, ShowingID, Quantity)
    VALUES (p_purchaseid, p_customerid, p_movieid, p_showingid, p_quantity);
    IF (SELECT EXTRACT(YEAR FROM (AGE(age))) < d_agerating)
    THEN
        ROLLBACK;
        RAISE 'Too young';
    END IF;
    COMMIT;
END
$$;

SELECT *
FROM customer;

CALL proc_checkcustage(6, 1, 1, 1, 1);


--function calc price of tickets
CREATE OR REPLACE FUNCTION func_calcTicketPrices(p_movieid integer)
    RETURNS decimal

    LANGUAGE plpgsql
AS
$$
DECLARE
    totalPrices decimal;
BEGIN
    SELECT ticketCost
    INTO totalPrices
    FROM movie
    WHERE movie.movieID = p_movieid;
    RETURN totalPrices;
END;
$$;

SELECT *
FROM func_calcTicketPrices(1);


--procedure to check if enough seats are available

DROP FUNCTION func_checkseatavailability(movieshowing integer);
CREATE OR REPLACE FUNCTION func_checkSeatAvailability(movieShowingid int)
    RETURNS boolean
    LANGUAGE plpgsql
AS
$$
DECLARE
    seatsAvail     boolean;
    seatsRemaining integer;
BEGIN

    SELECT AvailableSeats
    FROM movieshowing
    WHERE movieShowing.MovieID = movieShowingid
    INTO seatsRemaining;
    IF (seatsRemaining = 0) THEN
        seatsAvail = FALSE;
    END IF;
    RETURN seatsAvail;
END;
$$;


SELECT *
FROM func_checkSeatAvailability(1);


--function to get movies in the future

CREATE OR REPLACE FUNCTION fnc_getfutureshowings()
    RETURNS table
            (
                r_movieshowingid integer,
                r_viewingdate    date,
                r_totalseats     integer,
                r_availableseats integer,
                r_movieid        integer

            )
    LANGUAGE 'plpgsql'

AS
$$
BEGIN
    RETURN QUERY
        SELECT ShowingID, ViewingDate, TotalSeats, AvailableSeats, MovieID
        FROM movieshowing
        WHERE ViewingDate > NOW();
END;
$$;

SELECT *
FROM fnc_getfutureshowings();



--update the calc price of tickets function to age check, if the age is < 16, charge 50% for a child ticket!
CREATE OR REPLACE FUNCTION func_findTicketPriceDiscount(p_movieid integer, p_custID int)
    RETURNS decimal

    LANGUAGE plpgsql
AS
$$
DECLARE
    fullPrice  decimal;
    finalprice decimal;
    cust_dob   date;
BEGIN
    SELECT ticketCost, CustomerDOB, fullPrice
    INTO fullPrice, cust_dob , fullPrice
    FROM movie m,
         customer c
    WHERE m.movieID = p_movieid
      AND c.CustomerID = p_custID;
    IF (SELECT EXTRACT(YEAR FROM (AGE(cust_dob))) < 16)
    THEN
        finalprice = fullPrice * 0.5;
    END IF;
    IF (SELECT EXTRACT(YEAR FROM (AGE(cust_dob))) > 16)
    THEN
        finalprice = fullPrice;
    END IF;
    RETURN finalprice;
END;
$$;

-- should return price of 10 -> movie 1 is priced £20, customerid 4 is 2 months old
SELECT * FROM func_findTicketPriceDiscount(1, 4);


--ultimate challenge get all this to work within one function
-- DROP FUNCTION fnc_getfutureshowings();

