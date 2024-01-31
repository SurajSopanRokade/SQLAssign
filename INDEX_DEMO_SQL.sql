SELECT * 
FROM employees
WHERE salary=17000;

-- create index on table
CREATE INDEX salary ON employees(salary);

-- explain index info on table
EXPLAIN SELECT * 
FROM employees
WHERE salary=17000;

-- drop index on table
DROP INDEX salary ON employees;
