
-- Procedure which gives the distinct count of values in specified column in specified table

CREATE OR REPLACE PROCEDURE DOSUM(tablename varchar ,FIELD VARCHAR)
LANGUAGE PLPGSQL
AS $$

DECLARE
	myvar integer;
	Q text;
BEGIN
	Q := 'SELECT COUNT(DISTINCT ' || FIELD || ') FROM ' || tablename;

	-- SELECT COUNT(DISTINCT FIELD)
	-- INTO MYVAR
	-- FROM EMPLOYEEINFO;

	EXECUTE Q INTO myvar;

	raise notice 'Total Department: %',myvar;
END
$$


DROP PROCEDURE DOSUM(FIELD VARCHAR)

CALL DOSUM('EMPLOYEEINFO', 'department')





-- Create a trigger: if input salary is >= 1CR not able to enter data 


-- Trigger function

create or replace function salary_threshold() returns trigger as 
$$
declare
	sal int;
begin
	if new.salary >= 10000000 then
		raise notice 'Invalid salary!';
		return old;
	else
	raise notice 'Data entered successfully!';
		return new;
	end if;
end;
$$
language plpgsql


-- Trigger
create trigger salary_thresh_trigger
before insert on employeeposition
for each row
execute function salary_threshold();




 