-- Create new data integrity trigger function
CREATE
    OR REPLACE FUNCTION log_last_sal_changes() RETURNS TRIGGER AS
$body$
BEGIN
    IF
        NEW.sal IS NULL THEN
        RAISE EXCEPTION '% sal cannot be null ', OLD.ename;
    END IF;
    IF
        NEW.sal < 0 THEN
        RAISE EXCEPTION '% sal cannot be negative ', OLD.ename;
    END IF;
    IF
        NEW.sal <> OLD.sal THEN
        INSERT INTO emp_audit(empno, ename, sal, changed_on)
        VALUES (OLD.empno, OLD.ename, OLD.sal, NOW());
    END IF;
    RETURN new;
END;
$body$
    LANGUAGE plpgsql VOLATILE
                     COST 100

-- Test the Trigger
UPDATE emp
SET sal = -1
WHERE empno = 7369;

UPDATE emp
SET sal = NULL
WHERE empno = 7369;

-- Check emp and emp_audit tables
SELECT *
FROM emp;
SELECT *
FROM emp_audit;


-- Insert, Update & Delete Trigger
CREATE TABLE new_emp
(
    empname text NOT NULL,
    salary  integer
);

CREATE TABLE new_emp_audit
(
    operation char(1)   NOT NULL,
    stamp     timestamp NOT NULL,
    userid    text      NOT NULL,
    empname   text      NOT NULL,
    salary    integer
);


-- Create Trigger Function
CREATE
    OR REPLACE FUNCTION process_new_emp_audit()
    RETURNS TRIGGER AS
$new_emp_audit$
BEGIN
    --
    -- Create a row in the emp_audit to reflect the operation on emp,
    -- make use of the special variable TG_OP to work out the operation.
    --
    IF
        (TG_OP = 'DELETE') THEN
        INSERT INTO new_emp_audit
        VALUES ('D', NOW(), USER, OLD.empname, OLD.salary);
        RETURN old;
    ELSIF
        (TG_OP = 'UPDATE') THEN
        INSERT INTO new_emp_audit
        VALUES ('U', NOW(), USER, NEW.empname, NEW.salary);
        RETURN new;
    ELSIF
        (TG_OP = 'INSERT') THEN
        INSERT INTO new_emp_audit
        VALUES ('I', NOW(), USER, NEW.empname, NEW.salary);
        RETURN new;
    END IF;
    RETURN NULL; -- result is ignored since this is an AFTER trigger
END;
$new_emp_audit$
    LANGUAGE plpgsql

-- Create Trigger Function
CREATE TRIGGER new_emp_audit
    AFTER INSERT OR UPDATE OR DELETE
    ON new_emp
    FOR EACH ROW
EXECUTE PROCEDURE process_new_emp_audit();


-- Test the Function and Trigger
-- Insert
Insert Into new_emp Values ('Abbey Williams', 45000),('Stephen Davies', 34000),('Henry Wood', 42000),('Sian Harris', 46000);

select * from new_emp;
select * from new_emp_audit;
