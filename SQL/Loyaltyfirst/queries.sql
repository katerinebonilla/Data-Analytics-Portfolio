/*1) Select the offer id, action, and date provided by a particular branch name. (2.5%)*/

SELECT OFFER_ID, ACTION, O_DATE 
FROM OFFERS
JOIN OFFERS_BRANCHES 
USING (OFFER_ID)
JOIN BRANCHES
USING (BRANCH_ID)
WHERE BRANCHES.BRANCH_NAME='Woodwinds';

/*2)Display all the transaction references, transaction amounts, the number of points collected from
each transaction, and the transaction date for a particular customer name. (2.5%)*/

SELECT TREF ,AMOUNT,T_POINTS,T_DATE
FROM TRANSACTIONS
JOIN CUSTOMERS
USING(CID)
WHERE CUSTOMERS.CNAME= 'Samuel Rose';

/*3) Find the branch IDs and the number of offers provided by each branch id. (2.5%)*/

SELECT BRANCHES.BRANCH_ID, COUNT(*) AS NUMBER_OF_OFFERS
FROM BRANCHES 
JOIN OFFERS_BRANCHES 
ON(BRANCHES.BRANCH_ID=OFFERS_BRANCHES.BRANCH_ID)
JOIN OFFERS
ON(OFFERS_BRANCHES.OFFER_ID= OFFERS.OFFER_ID)
WHERE (OFFERS_BRANCHES.OFFER_ID= OFFERS.OFFER_ID)
GROUP BY BRANCHES.BRANCH_ID;

/*4) Find the branch names and the number of offers provided by each branch name. (2.5%)*/

SELECT BRANCHES.BRANCH_NAME, COUNT(*) AS NUMBER_OF_OFFERS
FROM BRANCHES 
JOIN OFFERS_BRANCHES 
ON(BRANCHES.BRANCH_ID=OFFERS_BRANCHES.BRANCH_ID)
JOIN OFFERS
ON(OFFERS_BRANCHES.OFFER_ID= OFFERS.OFFER_ID)
WHERE (OFFERS_BRANCHES.OFFER_ID= OFFERS.OFFER_ID)
GROUP BY BRANCHES.BRANCH_NAME;

/*5) Display for a particular transaction reference, the transaction reference, date, time, amount,
the number of points collected, and the product ids and names included in the transaction with
their quantities, prices, and number of points. (2.5%)*/

SELECT t.TREF, t.T_DATE, t.T_TIME, t.AMOUNT , t.T_POINTS , p. PROD_ID,p.PROD_NAME,p.PRICE ,p.PROD_POINTS, tp.QUANTITY 
FROM TRANSACTIONS t JOIN TRANSACTIONS_PRODUCTS tp 
ON(t.TREF=tp.TREF)
JOIN PRODUCTS p
ON(p.PROD_ID=tp.PROD_ID)
AND t.TREF=tp.TREF;

/*6) Find the number of expired cards available in the database. (2.5%)*/

SELECT COUNT(*) AS NUM_OF_EXPIRED_CARDS
FROM CARDS
WHERE STATUS='E';

/*7) Find the customer with the maximum number of expired cards. (2.5%)*/

SELECT CNAME , COUNT(DISTINCT STATUS) AS MAXIMUM_NO_OF_EXPIRED
FROM CUSTOMERS 
JOIN CARDS
ON (CUSTOMERS.CID= CARDS.CID)
WHERE CARDS.STATUS='E'
GROUP BY CNAME;

/*8) Find the redemption history of a particular customer name. You should display the prize ID,
prize description, customer name,center id, and number of points redeemed. (3%)*/

SELECT r.PRIZE_ID, p.P_DESCRIPTION, c.CNAME , r.CENTER_ID, p.POINTS_NEEDED
FROM REDEMPTION_HISTORY r
JOIN CUSTOMERS c
ON(r.CID=c.CID)
JOIN PRIZES p
ON(r.PRIZE_ID=p.PRIZE_ID); 


-- Select statements 9 through 18
-- Statement 9
SELECT c.CNAME, c.OCCUPATION
FROM CUSTOMERS c 
JOIN FAMILIES f
ON(c.FAMILY_ID= f.FAMILY_ID)
WHERE f.FAMILY_NAME='Brown';
-- Statement 10
SELECT SUM(NUM_OF_POINTS) FROM POINT_ACCOUNTS WHERE FAMILY_ID = 62034;
-- Statement 11
SELECT c.cname FROM CUSTOMERS c FULL JOIN POINT_ACCOUNTS pa ON c.cid = pa.cid WHERE pa.num_of_points = (SELECT MAX(num_of_points) FROM POINT_ACCOUNTS);
-- Statement 12 
SELECT SUM(quantity*points_needed) FROM (SELECT rh.prize_id, rh.quantity FROM REDEMPTION_HISTORY rh WHERE rh.r_date = '10-Jun-22') t JOIN prizes p ON t.prize_id = p.prize_id;
-- Statement 13 *
SELECT SUM(rh.quantity) FROM redemption_history rh WHERE rh.cid = 1635252884;
-- Statement 14
SELECT COUNT(*) FROM (SELECT DISTINCT rh.cid FROM redemption_history rh WHERE rh.center_id = 29439);
-- Statement 15
SELECT COUNT(*) FROM (SELECT DISTINCT * FROM PRIZES);
-- Statement 16
SELECT cname FROM (SELECT cid, cname FROM CUSTOMERS WHERE occupation = 'Engineer') c JOIN addresses a ON c.cid = a.cid WHERE city = 'Fairfax';
-- Statement 17
SELECT p.prod_name FROM (SELECT DISTINCT prod_id from transactions_products) tp RIGHT JOIN products p ON tp.prod_id = p.prod_id WHERE tp.prod_id IS NULL;
-- Statement 18
Select prod_id FROM (SELECT tp.prod_id, COUNT(tp.prod_id) AS occurences FROM transactions_products tp GROUP BY tp.prod_id) t where occurences = (SELECT max(occurences) FROM (SELECT tp.prod_id, COUNT(tp.prod_id) AS occurences FROM transactions_products tp GROUP BY tp.prod_id));