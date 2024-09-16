--1
create database lab1 ;

--2
create table users(
    id serial,
    firstname varchar(50),
    lastname varchar(50)
);

--3
alter table users add isadmin integer;

--4
alter table users alter column isadmin type boolean using isadmin::boolean;

--5
alter table users alter column isadmin set default FALSE;

--6
alter table users add primary key (id);

--7
create table tasks(
    if serial,
    name varchar(50),
    user_id integer
);

--8
drop table tasks;

--9
drop database lab1;