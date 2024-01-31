-- a.	Write a query to  see details of male  senior citizen(age above 60) voters  
-- who stays in Sahakar Nagar area of Pune City	
SELECT * 
FROM voter v
INNER JOIN residenceaddress r ON (v.VAddressID=r.VAddressId)
WHERE Area='Sahakar Nagar' AND city='Pune' AND VoterAge>60;

-- b.	Write query to fetch City wise total male and total female voters.
SELECT city, COUNT(Gender) AS male
FROM voter v
INNER JOIN residenceaddress r ON (v.VAddressID=r.VAddressId)
WHERE gender='male' 
GROUP BY city;

SELECT city, COUNT(Gender) AS female
FROM voter v
INNER JOIN residenceaddress r ON (v.VAddressID=r.VAddressId)
WHERE gender='female' 
GROUP BY city;

SELECT city, SUM(CASE WHEN Gender = 'Male' THEN 1 ELSE 0 END) AS TotalMaleVoters, SUM(CASE WHEN Gender = 'Female' THEN 1 ELSE 0 END) AS TotalFemaleVoters
FROM voter v
INNER JOIN residenceaddress r ON (v.VAddressID=r.VAddressId)
GROUP BY city;

-- c.	Delete VotingMapper records if Election Date is before  Jan 2019 for Pune city.

SELECT o.voterid
FROM voter o
INNER JOIN residenceaddress r ON (o.vaddressid=r.vaddressid)
WHERE  r.city='Pune';

DELETE FROM 
votingmapper
WHERE voterid IN (SELECT o.voterid
FROM voter o
INNER JOIN residenceaddress r ON (o.vaddressid=r.vaddressid)
WHERE  r.city='Pune') AND ElectionDate<'2019-1-1';

-- d.	Change Booth ID of All voters from Parvati Voting area to 1113.
UPDATE boothdetails
SET boothid=1113
WHERE boothid=(SELECT boothid
FROM votingmapper
WHERE voterid=(SELECT voterid
FROM voter
WHERE votingarea='Parvati'));

-- e.	Write a stored procedure which accepts new boothId of voters having age above 60 and  are with same
--  address id  and voter name as parameter .
CALL getVoterInfo(4);

-- residenceaddress