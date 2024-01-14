use mydb;

INSERT INTO mydb.customer_details (name, mailing_address, permanent_address, primary_email, primary_phoneno)
VALUES ('John', 'Robie Street', 'Robie Street', 'john@gmail.com', '782-882-1232');

INSERT INTO mydb.customer_details (name, mailing_address, permanent_address, primary_email, primary_phoneno)
VALUES ('Doe', 'Barrington Street', 'Barrington Street', 'doe@gmail.com', '782-882-5555');

INSERT INTO mydb.customer_details
(name, mailing_address, permanent_address, primary_email, primary_phoneno)
VALUES ('Alex', 'Inglish Street', 'Inglish Street', 'alex@gmail.com', '782-882-5555');

INSERT INTO mydb.account_details (account_balance, customerId)
VALUES (100000, '100');

INSERT INTO mydb.account_details (account_balance, customerId)
VALUES (150000, '101');

INSERT INTO mydb.account_details (account_balance, customerId)
VALUES (250000, '102');

select * from customer_details;
select * from account_details;





















