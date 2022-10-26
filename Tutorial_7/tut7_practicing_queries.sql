-- Find all students in class 4,the subject, the assessment method, the average mark for the class, and the teacher's name and role
SELECT CONCAT(stu.firstname || ' ' || stu.lastname) AS "Student",
       classid                                      AS "Class",
       topic                                        AS "Subject",
       assessment                                   AS "Assessment Method",
       classgradeaverage                            AS "Class Avg. Grade",
       CONCAT(s.firstname || ' ' || s.lastname)     AS "Teacher",
       role
FROM student stu
         JOIN class c ON stu.yeargroupid = c.yeargroupid
         JOIN subject sub ON c.subjectid = sub.subjectid
         JOIN staff s ON c.staffid = s.staffid
         JOIN roles r ON s.staffrole = r.roleid
WHERE classid = 4;


-- Find all students in KS3 studying English
SELECT firstname, lastname, topic, level
FROM student stu
         RIGHT JOIN yeargroup y ON stu.yeargroupid = y.yeargroupid
         RIGHT JOIN class c ON y.yeargroupid = c.yeargroupid
         RIGHT JOIN subject s ON c.subjectid = s.subjectid
WHERE c.level = 'KS3'
  AND s.topic = 'English';

DROP TABLE monitor_poor_teaching CASCADE;

CREATE TABLE IF NOT EXISTS monitor_poor_teaching
(
    alertno        serial PRIMARY KEY,
    classid        integer                NOT NULL,
    subject        character varying(100) NOT NULL,
    staffid        integer                NOT NULL,
    stafffirstname character varying(50)  NOT NULL,
    stafflastname  character varying(50)  NOT NULL,
    oldavg         numeric(4, 2)          NOT NULL,
    newavg         numeric(4, 2)          NOT NULL,
    timestamp      timestamp
);

DROP SEQUENCE IF EXISTS poorteaching_seq CASCADE;
CREATE SEQUENCE poorteaching_seq START 1 INCREMENT 1;

ALTER TABLE monitor_poor_teaching
    ALTER alertno SET DEFAULT NEXTVAL('poorteaching_seq');

CREATE OR REPLACE FUNCTION fnc_report_poor_teaching()
    RETURNS trigger
AS
$body$
DECLARE
    r_classid        class.classid%type;
    r_subjectid      class.subjectid%type;
    r_subjectname    subject.topic%type;
    r_staffid        staff.staffid%type;
    r_stafffirstname staff.firstname%type;
    r_stafflastname  staff.lastname%type;
    r_oldavg         class.classgradeaverage%type;
    r_newavg         class.classgradeaverage%type;
    timestamp        timestamp;

BEGIN
    SELECT DISTINCT c.classid,
                    c.subjectid,
                    su.topic,
                    c.staffid,
                    st.firstname,
                    st.lastname,
                    old.classgradeaverage,
                    new.classgradeaverage,
                    timestamp
    INTO r_classid, r_subjectid,r_subjectname, r_staffid, r_stafffirstname, r_stafflastname, r_oldavg, r_newavg, timestamp
    FROM class c
             JOIN staff st ON c.staffid = st.staffid
             JOIN subject su ON c.subjectid = su.subjectid
    WHERE st.staffid = c.staffid;

    IF new.classgradeaverage < 35
    THEN
        INSERT INTO monitor_poor_teaching
        VALUES (NEXTVAL('poorteaching_seq'), r_classid, r_subjectid, r_staffid, r_stafffirstname, r_stafflastname,
                r_oldavg, r_newavg, CURRENT_TIMESTAMP);
        RETURN new;
    END IF;
END;
-- $body$
    LANGUAGE plpgsql VOLATILE
                     COST 100;

-- DROP TRIGGER IF EXISTS trg_grades_drop ON class;

CREATE TRIGGER trg_grades_drop
    AFTER UPDATE
    ON class
    FOR EACH ROW
EXECUTE PROCEDURE fnc_report_poor_teaching();

SELECT *
FROM monitor_poor_teaching;


DROP FUNCTION func_findthreeworstteachers();

CREATE OR REPLACE FUNCTION func_findthreeworstteachers()
    RETURNS table
            (
                r_staffid        int,
                r_fullname       varchar,
                r_classesfailing integer
            )
    LANGUAGE 'plpgsql'
AS
$$
DECLARE
    f_staffid        monitor_poor_teaching.staffid%type;
    f_fullname       monitor_poor_teaching.stafffirstname%type;
    f_classesfailing int;
BEGIN
    RETURN QUERY
        SELECT pt.staffid, CONCAT(pt.stafffirstname || ' ' || pt.stafffirstname) as "Name", COUNT(pt.staffid) as "Total"
        INTO f_staffid, f_fullname, f_classesfailing
        FROM monitor_poor_teaching pt
                 LEFT JOIN staff s ON s.staffid = pt.staffid
                 LEFT JOIN class c ON pt.classid = c.classid
        GROUP BY pt.staffid, pt.stafffirstname
        ORDER BY COUNT(*) DESC
        LIMIT 3;
END;
$$;


SELECT *
FROM func_findthreeworstteachers();

SELECT pt.staffid,
       CONCAT(stafffirstname || ' ' || stafffirstname) AS "Name",
       COUNT(pt.staffid)
--         into f_staffid, f_fullname, f_classesfailing
FROM monitor_poor_teaching pt
         LEFT JOIN staff s ON s.staffid = pt.staffid
         LEFT JOIN class c ON pt.classid = c.classid
GROUP BY pt.staffid, "Name"
ORDER BY COUNT(*) DESC
LIMIT 3;