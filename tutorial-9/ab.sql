
----2a------------------------------------------------------------------------
--procedure - when someone tries to buy a ticket, their age meets the age range of the film

CREATE OR REPLACE PROCEDURE purchaseTicketCheckAge(p_purchaseid INTEGER, p_customerid INTEGER, p_movieid INTEGER, p_showingid INTEGER, p_quantity INTEGER)
LANGUAGE plpgsql AS $$
    DECLARE
        age_rating integer;
        dob DATE;
BEGIN
    INSERT INTO ticketPurcase (purchaseid, customerid, movieid, showingid, quantity)
    VALUES (p_purchaseid, p_customerid, p_movieid, p_showingid, p_quantity);

    SELECT agerating INTO age_rating FROM movie WHERE movieid = p_movieid;
    SELECT customerdob INTO dob FROM customer WHERE CustomerID = p_customerid;

    IF (SELECT EXTRACT (year from (AGE(dob)) )) < age_rating THEN
        ROLLBACK;
        RAISE 'Too young to watch this film';
        END IF;
COMMIT;
END $$;


--------------

---------------

--check 2b
SELECT * FROM customer --id 1 is younger than 18

--check with a customer younger & older than 18
CALL purchaseTicketCheckAge(2, 2, 2, 1, 1)

SELECT * FROM ticketpurcase