CREATE TABLE emp
(
    empno    integer PRIMARY KEY,
    ename    varchar(10),
    job      varchar(9),
    mgr      integer,
    hiredtae date,
    sal      numeric(7, 2),
    comm     numeric(7, 2),
    deptno   INTEGER
);

CREATE TABLE emp_audit
(
    audit_id   SERIAL PRIMARY KEY,
    empno      INTEGER       NOT NULL,
    ename      VARCHAR(10)   NOT NULL,
    sal        NUMERIC(7, 2) NOT NULL,
    changed_on timestamp(6)  NOT NULL
);

CREATE
OR replace FUNCTION log_last_sal_changes()RETURNS TRIGGER AS
$body$
BEGIN if
NEW.sal <> OLD.sal THEN INSERT INTO emp_audit(empno, ename, sal, changed_on)
VALUES (OLD.empno, OLD.ename, OLD.sal, now());
END if;
RETURN new;
END;
$body$
LANGUAGE plpgsql volatile
cost 100

CREATE TRIGGER emp_sal_changes
    BEFORE UPDATE
    ON emp
    FOR EACH ROW
    EXECUTE procedure log_last_sal_changes();

INSERT INTO emp(empno, ename, job, mgr, sal, comm, deptno)
VALUES (7369, 'James Hart', 'Web Admin', 2345, 800, 600, 12);

SELECT *
FROM emp;

UPDATE emp
SET sal = 900.00
WHERE empno = 7369;

SELECT *
FROM emp_audit;


-- Data Integrity Trigger Function
CREATE
OR replace FUNCTION log_last_sal_changes()RETURNS TRIGGER AS
$body$
BEGIN if
NEW.sal IS NULL THEN
    raise EXCEPTION '% sal cannot be null ', OLD.ename;
END if;
        if
NEW.sal IS <0 THEN
    raise EXCEPTION '% sal cannot be negative ', OLD.ename;
END if;

if
NEW.sal <> OLD.sal THEN INSERT INTO emp_audit(empno, ename, sal, changed_on)
VALUES (OLD.empno, OLD.ename, OLD.sal, now());
END if;
RETURN new;
END;
$body$
LANGUAGE plpgsql volatile
cost 100
