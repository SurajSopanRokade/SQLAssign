-- a.Write a query to  update  Ownername,mobile and email of owner of flat B111 
UPDATE owners o
INNER JOIN flats f ON (o.oid=f.oid)
SET ownername='S.S.Rokade', mobile='9870679845', email='suraj1232@gmail.com'
WHERE flatno='B111';

-- b.Write query to display owner details who owns more than 1 flats.	
SELECT o.*, COUNT(f.oid) AS cnt
FROM owners o
INNER JOIN flats f ON (o.oid=f.oid)
GROUP BY o.oid
HAVING cnt>1;

-- c.Delete Flat records whose Owner is A.V.Bhat and Occupiedstatus is ‘Tenent’. 
DELETE FROM flats f
WHERE f.oid=(SELECT oid FROM owners WHERE ownername='A.V.Bhat' AND Occupiedstatus='Tenant');

-- e.Create a stored procedure which accepts  building name and returns Representative Name and his flat no.	
CALL Get_ownername('A');

-- f.Show building wise total amount of maintenance collected and total balance amountin descending order
-- of maintenance collected.
SELECT buildingid, SUM(amount_paid) AS 'maintenance collected' , SUM(maintenance_amount) AS 'total balance'
FROM building b
INNER JOIN maintenance m ON (m.Flatno=b.RepresentativeID)
GROUP BY buildingid;

-- g.Write a jdbc program to create a map which has Flatno as key and Owner details as  value. 
-- Do not use any joins in the query while selecting data. 
-- Map Should be in descending order of Flat no
SELECT f.flatno, o.*
FROM owners o, flats f;

SELECT * FROM flats;


