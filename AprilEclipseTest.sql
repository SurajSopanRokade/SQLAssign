-- 4. Find the amount , name of customer whose acc_no is 1001 [1M].
SELECT t.amount, t.acc_no, cname
FROM customer_master c
INNER JOIN accounts a ON (c.cust_id=a.cust_id)
INNER JOIN transaction t ON (a.acc_no=t.acc_no)
WHERE t.acc_no=1001;

-- 5. Display the customer name ,contact of customers whose account type is ‘saving’ order by descending order of cname .[1M]
SELECT cname, contact
FROM customer_master c
INNER JOIN accounts a ON (c.cust_id=a.cust_id)
INNER JOIN accounttype o ON (a.acctype_id=o.acctype_id)
WHERE acctype='savings'
ORDER BY cname DESC;

-- 6. Display bank name , total balance of all customers in that bank of all banks in 
-- descending order of balance.[1M]
SELECT name, SUM(balance) AS total
FROM accounts a
INNER JOIN customer c ON (a.cust_id=c.cust_id)
INNER JOIN bank b ON (c.bank_id=b.bankid)
GROUP BY name
ORDER BY total DESC;


-- 7. Update account no of customers of ‘state bank of india’ . Prefix ‘SBI’ before account 
-- no.[1M]
UPDATE accounts
SET acc_no=CONCAT('SBI','',acc_no)
WHERE cust_id IN (SELECT cust_id
FROM customer
WHERE bank_id=(SELECT bankid FROM bank WHERE name='ABC Bank'));

-- 8. Create Trigger on Transaction table when transaction is done accordingly it should 
-- be reflected in balance of Accounts. If transaction is debit reduce the balance , for 
-- credit increase balance [1M]

INSERT INTO transaction VALUES (6, 1001, 2000, 2,null);

-- 9. Create a collection to store acctype as key and value as list of all customers with 
-- respective acctype for bank name HDFC(without using joins)[2M]
