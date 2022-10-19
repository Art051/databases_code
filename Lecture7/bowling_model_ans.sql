-- Bowling Audit Trigger Exercise
Create Table frame(
	bowler_id 		integer,
	game_id			integer,
	frame_number 	integer,
	strike			char(1) Default 'N',
	spare			char(1) Default 'N',
	score			integer,
	Constraint frame_pk
		Primary Key (bowler_id, game_id, frame_number));

Create Table frame_audit(
	operation 		char(1),
	userid			text,
	stamp			timestamp,
	bowler_id		integer,
	game_id			integer,
	frame_number	integer,
	old_strike		char(1),
	new_strike		char(1),
	old_spare		char(1),
	new_spare		char(1),
	old_score		integer,
	new_score		integer);

Create or Replace Function process_new_frame_audit()
Returns Trigger AS
$$
BEGIN
	IF (TG_OP = 'INSERT') THEN
		INSERT INTO frame_audit(operation, userid, stamp, bowler_id,
			game_id, frame_number, new_strike, new_spare, new_score)
		VALUES('I', user, now(), new.bowler_id, new.game_id, new.frame_number,
			new.strike, new.spare, new.score);
		RETURN new;
	ELSIF (TG_OP = 'UPDATE') THEN
		INSERT INTO frame_audit(operation, userid, stamp, bowler_id,
			game_id, frame_number, old_strike, new_strike,
			old_spare, new_spare,
			old_score, new_score)
		VALUES('U', user, now(), old.bowler_id, old.game_id, old.frame_number,
			old.strike, new.strike,
			old.spare, new.spare,
			old.score, new.score);
		RETURN new;
	ELSIF (TG_OP = 'DELETE') THEN
		INSERT INTO frame_audit(operation, userid, stamp, bowler_id, game_id,
			frame_number, old_strike, old_spare, old_score)
		VALUES('D', user, now(), old.bowler_id, old.game_id, old.frame_number,
			old.strike, old.spare, old.score);
		RETURN old;
	END If;

	RETURN NULL;
END; $$
LANGUAGE plpgsql

Create or Replace Trigger new_frame_audit
	AFTER INSERT OR UPDATE OR DELETE ON frame
		FOR EACH ROW EXECUTE
			PROCEDURE process_new_frame_audit();

INSERT INTO frame(bowler_id, game_id, frame_number, strike)
	VALUES(1, 1, 1, 'Y');

Select bowler_id, game_id, frame_number, strike
From frame;

Update frame
Set strike = 'N'
Where bowler_id = 1
And game_id = 1
And frame_number = 1;

Delete From frame
Where bowler_id = 1
And game_id = 1
And frame_number = 1;

