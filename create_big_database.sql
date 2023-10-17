select * from public.reference r 


SELECT array_to_string(ARRAY(
            SELECT chr((ascii('B') + round(random() * 25)) :: integer) 
            FROM generate_series(1,15)), 
             '');
             
SELECT array_to_string(ARRAY(
            SELECT int((ascii('B') + round(random() * 25)) :: integer) 
            FROM generate_series(1,15)), 
             '');
             
            
insert into reference (id, fisrt_name , surname , age )
select (nextval(reference.id),
		left(i::text,10)

	  	)
from generate_series(1,10) s(i)


ALTER TABLE reference 
ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;


ALTER TABLE shape 
ALTER COLUMN shape_id ADD GENERATED ALWAYS AS IDENTITY;

commit


insert into reference (fisrt_name, surname, age) 

random_string(15)::text , 'Deville', 45 


select random()::text ;




-- Create random_string
CREATE OR REPLACE FUNCTION random_string(integer) RETURNS text AS $body$
    SELECT array_to_string(array(SELECT substring('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' FROM (ceil(random()*62))::int FOR 1) FROM generate_series(1, $1)), '');
$body$ LANGUAGE SQL VOLATILE;
-----------

-- Create random_between
CREATE OR REPLACE FUNCTION random_between(low INT ,high INT) 
   RETURNS INT AS
$$
BEGIN
   RETURN floor(random()* (high-low + 1) + low);
END;
$$ language 'plpgsql' STRICT;
---
-- public.reference definition

-- Drop table

-- DROP TABLE public.reference;

CREATE TABLE public.reference (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	fisrt_name varchar NOT NULL,
	surname varchar NOT NULL,
	age varchar NOT NULL,
	CONSTRAINT reference_pk PRIMARY KEY (id)
);
CREATE INDEX reference_fisrt_name_idx ON public.reference USING btree (fisrt_name, surname);
---------

-- public.call_on definition

-- Drop table

-- DROP TABLE public.call_on;

CREATE TABLE public.call_on (
	reference_uuid int4 NOT NULL,
	create_at date NOT NULL,
	"position" varchar NOT NULL,
	position_uuid varchar NULL
)
PARTITION BY LIST(date_part('year'::text, create_at));

create table call_on_2020 PARTITION of call_on for values in (2020);
create table call_on_2019 PARTITION of call_on for values in (2019);
create table call_on_2018 PARTITION of call_on for values in (2018);
create table call_on_2017 PARTITION of call_on for values in (2017);
create table call_on_2016 PARTITION of call_on for values in (2016);
create table call_on_2015 PARTITION of call_on for values in (2015);
create table call_on_2014 PARTITION of call_on for values in (2014);
create table call_on_2013 PARTITION of call_on for values in (2013);
create table call_on_2012 PARTITION of call_on for values in (2012);
create table call_on_2011 PARTITION of call_on for values in (2011);
create table call_on_2010 PARTITION of call_on for values in (2010);
create table call_on_2009 PARTITION of call_on for values in (2009);
create table call_on_2008 PARTITION of call_on for values in (2008);
create table call_on_2007 PARTITION of call_on for values in (2007);
create table call_on_2006 PARTITION of call_on for values in (2006);
create table call_on_2005 PARTITION of call_on for values in (2005);
create table call_on_2004 PARTITION of call_on for values in (2004);
create table call_on_2003 PARTITION of call_on for values in (2003);
create table call_on_2002 PARTITION of call_on for values in (2002);
create table call_on_2001 PARTITION of call_on for values in (2001);
create table call_on_2000 PARTITION of call_on for values in (2000);


-- public.call_on foreign keys

ALTER TABLE public.call_on ADD CONSTRAINT call_on_fk FOREIGN KEY (reference_uuid) REFERENCES reference(id);
-----


-- Insert into reference table
insert into reference (fisrt_name, surname, age) 
select
random_string(15)::text , 
random_string(15)::text, 
random_between(1,110)::int
-------------------------------------------------





SELECT TO_CHAR(day, 'YYYY-MM-DD'), random() FROM generate_series
        ( '2017-02-01'::date
        , '2017-04-01'::date
        , '1 day'::interval) day
        
select random_string(15) 

SELECT random_between(1,110);
        
-- Insert into reference table
insert into reference (fisrt_name, surname, age) 
select
random_string(15)::text , 
random_string(15)::text, 
random_between(1,110)::int
-------------------------------------------------

from 
generate_series(1,10)

select NOW() + (random() * (NOW()+'90 days' - NOW())) + '30 days'
;

select timestamp '2020-01-10 20:00:00' +
       random() * (timestamp '1900-01-14 20:00:00' -
                   timestamp '2020-01-10 10:00:00')
from generate_series(1,10000)

for 
SELECT uuid_in(md5(random()::text || clock_timestamp()::text)::cstring)

create or replace function insert_un_tuc() returns setof reference AS
$BODY$
declare 
	rr int;
begin
	for rr in 
		select id from reference r2 
	loop
		insert into call_on (reference_uuid, create_at,"position",position_uuid)
		values (1, '2020/10/31 12:12:12', 'ici', 
				uuid_in(md5(random()::text || clock_timestamp()::text)::cstring))
		return next rr;
	end loop;
    return;
end
$BODY$ language plpgsql;

CREATE TABLE truc (id_truc INT, sousid_truc INT, nom_truc TEXT);
INSERT INTO truc VALUES (1, 2, 'trois');
INSERT INTO truc VALUES (4, 5, 'six');

CREATE OR REPLACE FUNCTION obtenir_tous_les_trucs() RETURNS SETOF reference AS
$BODY$
DECLARE
    r truc%rowtype;
BEGIN
    FOR r IN
        SELECT * FROM truc WHERE id_truc > 0
    LOOP
        -- quelques traitements
        RETURN NEXT r; -- renvoie la ligne courante du SELECT
    END LOOP;
    return ;
END
$BODY$
LANGUAGE plpgsql;

SELECT * FROM obtenir_tous_les_trucs();

select insert_un_tuc()
 



