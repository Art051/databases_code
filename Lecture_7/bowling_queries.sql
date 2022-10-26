
--  Create the frame table;
CREATE TABLE frame
(
    bowler_id    integer,
    game_id      integer,
    frame_number integer,
    strike       char(1) DEFAULT 'N',
    spare        char(1) DEFAULT 'N',
    score        integer,
    CONSTRAINT frame_pk
        PRIMARY KEY (bowler_id, game_id, frame_number)
);


-- Create the frame_audit table;
CREATE TABLE frame_audit
(
    operation    char(1),
    userid       text,
    stamp        timestamp,
    bowler_id    integer,
    game_id      integer,
    frame_number integer,
    old_strike   char(1),
    new_strike   char(1),
    old_spare    char(1),
    new_spare    char(1),
    old_score    integer,
    new_score    integer
);

-- Create an appropriate Function to write changes on Insert, Update and Delete of the frame table to the frame_audit table;
CREATE
    OR REPLACE FUNCTION log_update_frame_audit()
    RETURNS TRIGGER AS
$log_new_frame_score_audit$
BEGIN
    --
    -- Create a row in the frame_audit to reflect the operation on emp,
    -- make use of the special variable TG_OP to work out the operation.
    --
    IF
        (TG_OP = 'DELETE') THEN
        INSERT INTO frame_audit
        VALUES ('D', USER, NOW(),
                OLD.bowler_id,
                OLD.game_id,
                OLD.frame_number,
                OLD.strike,
                NEW.strike,
                OLD.spare,
                NEW.spare,
                OLD.score,
                NEW.score);
        RETURN old;
    ELSIF
        (TG_OP = 'UPDATE') THEN
        INSERT INTO frame_audit
        VALUES ('U', USER, NOW(),
                OLD.bowler_id,
                OLD.game_id,
                OLD.frame_number,
                OLD.strike,
                NEW.strike,
                OLD.spare,
                NEW.spare,
                OLD.score,
                NEW.score);
        RETURN new;
    ELSIF
        (TG_OP = 'INSERT') THEN
        INSERT INTO frame_audit
        VALUES ('I', USER, NOW(),
                OLD.bowler_id,
                OLD.game_id,
                OLD.frame_number,
                OLD.strike,
                NEW.strike,
                OLD.spare,
                NEW.spare,
                OLD.score,
                NEW.score);
        RETURN new;
    END IF;
    RETURN NULL; -- result is ignored since this is an AFTER trigger
END;
$log_new_frame_score_audit$
    LANGUAGE plpgsql

-- Create the Trigger to accompany the above Function;
CREATE TRIGGER frame_score_changes
    AFTER UPDATE OR INSERT OR DELETE
    ON frame
    FOR EACH ROW
EXECUTE PROCEDURE log_update_frame_audit();

--Add new record
INSERT INTO frame(bowler_id, game_id, frame_number, strike)
VALUES (1, 1, 1, 'Y');

select * from frame;
SELECT *
FROM frame_audit;

--updating the record
UPDATE frame
SET strike = 'N'
WHERE frame.bowler_id = 1
  AND game_id = 1
  AND frame_number = 1;

select * from frame;
SELECT *
FROM frame_audit;

--deleting the record
DELETE
FROM frame
WHERE bowler_id = 1
  AND game_id = 1
  AND frame_number = 1;

select * from frame;
SELECT *
FROM frame_audit;
