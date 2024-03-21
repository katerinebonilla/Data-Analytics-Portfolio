CREATE TABLE Branches(
opening_hours TIMESTAMP, b_location VARCHAR2(20),
branch_id NUMBER(15), branch_name VARCHAR2(20),
PRIMARY KEY(branch_id))
;
CREATE TABLE Offers(
offer_id NUMBER(15), action VARCHAR2(10), o_date DATE,
o_description VARCHAR2(20),
PRIMARY KEY (offer_id))
;
CREATE TABLE Apply_Offer
( offer_id NUMBER(15), branch_id NUMBER(15),
PRIMARY KEY (offer_id,branch_id),
FOREIGN KEY (offer_id) REFERENCES Offers(offer_id)
ON DELETE SET NULL,
FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
ON DELETE CASCADE)
;

CREATE TABLE Transaction
(tref NUMBER(15),t_date DATE,t_time TIMESTAMP,t_points NUMBER(15),
t_description VARCHAR2(20),
PRIMARY KEY(tref))
;
CREATE TABLE Offer_Applied
(offer_id NUMBER(15), tref NUMBER(15),
PRIMARY KEY (offer_id,tref),
FOREIGN KEY (offer_id) REFERENCES Offers(offer_id)
ON DELETE SET NULL,
FOREIGN KEY (tref) REFERENCES Transaction(tref)
ON DELETE CASCADE)
;

CREATE TABLE Cards(card_id NUMBER(15), exp_date DATE,
status VARCHAR2(20),
PRIMARY KEY(card_id))
;
CREATE TABLE Products(
prod_name VARCHAR2(20), price NUMBER(5),
prod_points NUMBER(5),prod_id NUMBER(15),
PRIMARY KEY(prod_id))
;
CREATE TABLE Contain_Product
(quantity NUMBER(15),prod_id NUMBER(15),
tref NUMBER(15),
PRIMARY KEY(prod_id,tref),
FOREIGN KEY (prod_id) REFERENCES Products(prod_id) 
ON DELETE CASCADE, 
FOREIGN KEY (tref) REFERENCES Transaction(tref)
ON DELETE CASCADE)
;

CREATE TABLE Customer
(cid NUMBER (15),mstatus VARCHAR2(20),is_member VARCHAR2(3),email VARCHAR2(25),
dob DATE, occupation VARCHAR2(20),ssn NUMBER(15),
gender VARCHAR2(15),c_date DATE,card_id NUMBER(15),tref NUMBER(15),
PRIMARY KEY(cid),
FOREIGN KEY (card_id) REFERENCES Cards(card_id)
ON DELETE SET NULL,
FOREIGN KEY(tref) REFERENCES Transaction(tref)
ON DELETE CASCADE)
;
CREATE TABLE Prizes
(p_description VARCHAR2(20),prize_id NUMBER(15),
points_needed NUMBER(15),
PRIMARY KEY (prize_id))
;
CREATE TABLE Point_Accounts
( point_acct_no NUMBER(15),num_of_points NUMBER (15),
tref NUMBER(15),cid NUMBER (15),
PRIMARY KEY(point_acct_no),
FOREIGN KEY (tref) REFERENCES Transaction(tref)
ON DELETE CASCADE,
FOREIGN KEY (cid) REFERENCES Customer(cid)
ON DELETE CASCADE)
;
CREATE TABLE ExchgCenters(
center_id NUMBER(15),c_location VARCHAR2(20),
center_name VARCHAR2(20),
PRIMARY KEY (center_id)
)
;
CREATE TABLE Reedem
( quantity NUMBER(15),r_date DATE, 
prize_id NUMBER(15), cid NUMBER(15),point_accounts NUMBER(15),center_id,
point_acct_no NUMBER(15),
PRIMARY KEY(prize_id,cid),
FOREIGN KEY(prize_id) REFERENCES Prizes(prize_id)
ON DELETE SET NULL,
FOREIGN KEY (cid) REFERENCES Customer(cid)
ON DELETE CASCADE,
FOREIGN KEY (point_acct_no) REFERENCES Point_Accounts(point_acct_no)
ON DELETE CASCADE,
FOREIGN KEY (center_id) REFERENCES ExchgCenters(center_id)
ON DELETE SET NULL)
;



CREATE TABLE Families
(family_id NUMBER(15), num_members NUMBER(3),
family_name VARCHAR2(20),point_acct_no NUMBER(15),
percent_added NUMBER(3), cid NUMBER(15),
PRIMARY KEY(family_id),
FOREIGN KEY (point_acct_no) REFERENCES Point_Accounts
ON DELETE SET NULL,
FOREIGN KEY(cid) REFERENCES Customer 
ON DELETE CASCADE)
;
CREATE TABLE Login
(username VARCHAR2(20),password VARCHAR2(20),
PRIMARY KEY (username))
;
CREATE TABLE Customer_Phone
( pnum NUMBER(15),
PRIMARY KEY (pnum))
;
CREATE TABLE Customer_Address
(street VARCHAR2(20),apt VARCHAR2(20),city VARCHAR2(20),
state VARCHAR2(20),zip NUMBER(6),
PRIMARY KEY (apt)
)
