--1
create database lab4;

--2
create table Warehouses(
    code serial,
    location varchar(255),
    capacity int
);
create table Boxes(
    code char(4),
    contents varchar(255),
    value real,
    warehouse int
);

--3
insert into Warehouses values (1, 'Chicago', 3),
                              (2,'Chicago',4),
                              (3,'New York', 7),
                              (4,'Los Angeles', 2),
                              (5, 'San Francisco', 8);
insert into Boxes values ('0MN7', 'Rocks', 180, 3),
                         ('4H8P', 'Rocks', 250, 1),
                         ('4RT3', 'Scissors', 190, 4),
                         ('7G3H', 'Rocks', 200, 1),
                         ('8JN6', 'Papers', 75, 1),
                         ('8Y6U', 'Papers', 50, 3),
                         ('9J6F', 'Papers', 175, 2),
                         ('LL08', 'Rocks', 140, 4),
                         ('P0H6','Scissors', 125, 1),
                         ('P2T6', 'Scissors', 150, 2),
                         ('TU55', 'Papers', 90, 5);
--4
select * from Warehouses;

--5
select * from Boxes where value>150;

--6
select distinct on(contents) * from Boxes;

--7
select warehouse, count(*) from Boxes group by warehouse;

--8
select warehouse, c from (select warehouse, count(*) as c from Boxes group by warehouse) where c>2;

--9
insert into Warehouses values (default, 'New York', 3);

--10
insert into Boxes values ('H5RT', 'Papers', 200, 2);

--11
update Boxes set value=value*0.85 where value=(select distinct on(value) value from Boxes order by value desc limit 1 offset 2);

--12
delete from Boxes where value<150;

--13
delete from Boxes where warehouse in (select code from Warehouses where location='New York') returning *;