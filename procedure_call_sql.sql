CALL getcountofemp(@cnt);
SELECT @cnt AS countemp;

CALL assign();
SELECT @t AS assign;

CALL getcustomerlevel(227,@level);
SELECT @level;

USE testcoursedb;
SELECT employee_id, department_name, city
FROM employees e
INNER JOIN departments d ON (e.department_id=d.department_id)
INNER JOIN locations l ON (d.location_id=l.location_id);

CALL GET_DEPARTMENT_NAME_CITY_OF_EMP(100, @dep_name);
SELECT @dep_name;