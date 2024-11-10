create table countries(name text);
--1
create index name_index on countries (name);

--2
create index name_surname_index on employees (first_name, last_name);

--3
create unique index salary_index on employees (salary);

--4
create index name_substring_index on employees (substring(first_name from 1 for 4));

--5
create index departments_budget_index on departments(budget);
create index employees_salary_index on employees(salary);
create index employees_department_index on employees(department_id);
create index departments_department_index on departments(department_id);