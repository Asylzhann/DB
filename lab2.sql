--1
create database lab2;

--2
create table countries(
    country_id serial primary key,
    country_name text,
    region_id integer,
    population integer
);

--3
insert into countries values (default, 'Kazakhstan', 1, 20000000);

--4
insert into countries(country_id, country_name) values (default, 'Russia');

--5
insert into countries(region_id) values (null);

--6
insert into countries values (default,'China',10,1500000000),
                             (default,'India',20,1500000000),
                             (default,'USA',30,350000000);

--7
alter table countries alter column country_name set default 'Kazakhstan';

--8
insert into countries(country_name) values (default);

--9
insert into countries default values;

--10
create table countries_new(like countries);

--11
insert into countries_new select * from countries;

--12
update countries_new set region_id=1 where region_id is null;

--13
select country_name, population * 1.1 as "New Population" from countries;

--14
delete from countries where population<100000;

--15
delete from countries_new using countries where countries.country_id=countries_new.country_id returning *;

--16
delete from countries returning *;