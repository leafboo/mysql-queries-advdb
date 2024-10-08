CREATE VIEW vwEmployeeList AS
SELECT EmpID, fnGetFullName(EmpId) AS "Full name", Gender, Birthdate, EmpType
FROM employee;

UPDATE employee 
SET middlename=null
WHERE empid='10005';

SELECT EmpID FROM employee;

SELECT * FROM vwEmployeeList;

DELIMITER $$
CREATE FUNCTION fnGetFullName 
(
	empid varchar(5)
) RETURNS varchar(150) DETERMINISTIC

BEGIN
	DECLARE fullname varchar(150);
    
    SELECT CONCAT(FirstName, " ", IFNULL(MiddleName, ''), " ", LastName ) AS "Full name"
    INTO fullname
    FROM employee
    WHERE employee.empid=empid;
    
    RETURN fullname;
END
$$

SELECT fnGetFullName('10003') AS "Full name";