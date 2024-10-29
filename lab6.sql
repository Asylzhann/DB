--1
create database lab6;

--2
CREATE TABLE locations
(
    location_id    SERIAL PRIMARY KEY,
    street_address VARCHAR(25),
    postal_code    VARCHAR(12),
    city           VARCHAR(30),
    state_province VARCHAR(12)
);

CREATE TABLE departments
(
    department_id   SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget          INTEGER,
    location_id     INTEGER REFERENCES locations
);

CREATE TABLE employees
(
    employee_id   SERIAL PRIMARY KEY,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    email         VARCHAR(50),
    phone_number  VARCHAR(20),
    salary        INTEGER,
    department_id INTEGER REFERENCES departments
);

--3
select first_name, last_name, e.department_id, department_name
from employees e
         join departments d on d.department_id = e.department_id and (d.department_id = 40 or d.department_id = 80);

--4
select first_name, last_name, e.department_id, department_name
from employees e
         join departments d on d.department_id = e.department_id
where e.department_id = 40
   or e.department_id = 80;

--5
select first_name, last_name, department_name, city, state_province
from employees e
         join departments d on d.department_id = e.department_id
         join locations l on l.location_id = d.location_id;

--6
select *
from departments d
         left join employees e on d.department_id = e.department_id;

--7
select * from employees e left join departments d on e.department_id = d.department_id;