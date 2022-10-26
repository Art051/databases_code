CREATE OR REPLACE FUNCTION books(sbookid int)
returns VARCHAR
LANGUAGE plpgsql as $$
DECLARE
	TITLE varchar;
	startTime constant time := now();
BEGIN
raise notice 'Executing block at: %', startTime;

SELECT BookTitle into TITLE FROM books WHERE bookid = sbookid;


	if not found then
		raise 'Nothing was found with the id of: % ', sbookid;
	end if;

	return TITLE;
END $$;

SELECT * FROM books(1);


CREATE OR REPLACE FUNCTION books2(inout sbooktitle varchar) LANGUAGE plpgsql as $$
DECLARE
	startTime constant time := now();
BEGIN
	raise notice 'Executing block at: %', startTime;
		SELECT BookTitle into sbooktitle FROM books WHERE BookTitle = sbooktitle;
	if not found then
		raise 'Nothing was found with the name of: % ', sbooktitle;
	end if;
END $$;

SELECT * FROM Books2();




CREATE OR REPLACE FUNCTION swap(inout x int, inout y int)
LANGUAGE plpgsql as $$
BEGIN
SELECT X, Y INTO Y, X;
END $$;

SELECT * FROM swap(5,4)

drop function Fib
CREATE OR REPLACE FUNCTION Fib(starting int ) returns integer LANGUAGE plpgsql as $$
DECLARE
	n integer := starting;
	fib integer := 0;
	counter integer := 0;
	i integer := 0;
	j integer :=1;
BEGIN
	if(n < 1) then
		fib := 0;
	end if;
	loop
		exit when counter = n;
		counter := counter + 1;
		select j, i + j into i, j;
	end loop;
	fib := i;
	raise notice '%', fib;
	return fib;
end $$;

SELECT * FROM Fib(10)



DO  $$
DECLARE
count integer := 10;
i integer := 0;
BEGIN
	LOOP
	exit when i = count;
	raise notice '%', i;
	i := i + 1;
	end loop;
end
$$

BEGIN TRANSACTION

ROLLBACK TRANSACTION

COMMIT TRANSACTION



CREATE OR REPLACE FUNCTION BookCount2(sbookid integer, stockCheck integer) returns integer language plpgsql as $$
DECLARE
_amountinstock integer;
BEGIN

if (SELECT amountinstock  from books where bookid = sbookid) < stockCheck then
	raise 'Less than % in stock', stockCheck;
end if;
SELECT amountinstock into _amountinstock from books where bookid = sbookid;
return _amountinstock;
end
$$;

SELECT * FROM BookCount2(37, 10)

SELECT * FROM books where bookid = 5



DROP TABLE BankCustomer
CREATE TABLE BankCustomer(
CustomerID integer PRIMARY KEY,
Name varchar,
BalanceAmount numeric
);

insert into BankCustomer(CustomerID, Name, BalanceAmount) VALUES (1, 'John', 10000.00);
insert into BankCustomer(CustomerID, Name, BalanceAmount) VALUES (2, 'Lucy', 5.00);
insert into BankCustomer(CustomerID, Name, BalanceAmount) VALUES (3, 'Dave', 0.00);

DELETE
SELECT * FROM BankCustomer

CREATE OR REPLACE PROCEDURE MoveMoney(account1 integer, account2 integer,  amount integer) language plpgsql as $$
BEGIN
	UPDATE BankCustomer SET BalanceAmount = BalanceAmount - amount where CustomerID = account1;
	UPDATE BankCustomer SET BalanceAmount = BalanceAmount + amount WHERE CustomerID = account2;

	IF (SELECT BalanceAmount FROM BankCustomer WHERE CustomerID = account1 ) < 0 THEN
	 ROLLBACK;
	 raise 'not enough wonga ';
	 end if;
	RAISE notice 'Proceeding';
COMMIT;
END $$;

CALL MoveMoney(3,2,2000)


DROP TRIGGER trgCalcStockValue
DROP  FUNCTION updateStockvalue


create or replace procedure stockupdate(sbookid integer, amount integer )
LANGUAGE plpgsql as $$
BEGIN

UPDATE books set amountInStock = amountInStock - amount WHERE bookid = sbookid;

if (SELECT amountinstock from books where bookid = sbookid) < 1 OR (SELECT amountinstock FROM books where bookid = sbookid) is NULL then
	raise 'Not enough books in stock %', sbookid;
	ROLLBACK;
	END IF;
	RAISE NOTICE 'Proceeding';
	COMMIT;
END $$;

call stockupdate (44, 10);

SELECT * FROM books where bookid = 44
