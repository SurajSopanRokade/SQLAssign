-- 3.	Show name of all voters who are same age as Nilesh.
SELECT votername
FROM voter
WHERE voterage IN (SELECT VoterAge FROM voter WHERE VoterName='Liam Harris');

-- 4.	Delete all records from VotingMapper for booth having number of co-ordinators more than 5
SELECT boothid
FROM boothdetails
WHERE noofcoordinators>5;

-- DELETE FROM votingmapper
-- WHERE boothid IN (SELECT boothid
-- FROM boothdetails
-- WHERE noofcoordinators>5);

-- 5.Change Name of the building to ‘Gharkul Apartment’ with voter name ‘Nilesh’.
UPDATE residenceaddress r
INNER JOIN voter v ON (r.vaddressid=v.vaddressid)
SET building='Gharkul Apartment'
WHERE votername='Liam Harris';

-- 6.Display minimum age and number of voters with minimum age from BoothID 1112.
SELECT b.boothid, MIN(voterage) AS MINAGE
FROM voter v
INNER JOIN votingmapper m ON (v.VoterId=m.VoterID)
INNER JOIN boothdetails b ON (m.BoothID=b.BoothId)
GROUP BY boothid
HAVING boothid=10;

-- 7.Show all female VoterID ,VoterName and their Address Details who are from BoothId 1112
SELECT v.voterid, votername,gender, r.*
FROM residenceaddress r
INNER JOIN voter v ON (v.VAddressID=r.VAddressId)
INNER JOIN votingmapper m ON (v.VoterId=m.VoterID)
INNER JOIN boothdetails b ON (m.BoothID=b.BoothId)
WHERE b.boothid=10 AND v.gender='Female';

