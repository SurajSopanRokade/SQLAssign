SELECT * FROM test2_sql.employee;
/*CREATE DEFINER=`root`@`localhost` TRIGGER `service_request_AFTER_UPDATE` AFTER UPDATE ON `service_request` FOR EACH ROW BEGIN
DECLARE new_emp_rating INT;
DECLARE empl_id INT;
SELECT NEW.emp_id INTO empl_id
FROM service_request
WHERE service_id=NEW.service_id;


SET new_emp_rating = (SELECT ROUND (AVG(feedback_rating),2)
FROM service_request
WHERE status_id=3 AND emp_id=old.emp_id);

UPDATE employee SET emp_rating= new_emp_rating
WHERE emp_id=empl_id;
END
*/