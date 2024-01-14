CREATE TABLE mydb.customer_details (
  customerId INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  mailing_address VARCHAR(45) NULL,
  permanent_address VARCHAR(45) NULL,
  primary_email VARCHAR(45) NULL,
  primary_phoneno VARCHAR(45) NULL,
  PRIMARY KEY (customerId))
AUTO_INCREMENT = 100;

CREATE TABLE mydb.account_details (
  accountId INT NOT NULL AUTO_INCREMENT,
  account_balance DECIMAL NULL,
  customerId INT NOT NULL,
  PRIMARY KEY (accountId, customerId),
    FOREIGN KEY (customerId)
    REFERENCES mydb.customer_details (customerId))
AUTO_INCREMENT = 200;


CREATE TABLE mydb.transfer_details (
  transfer_details_id INT NOT NULL AUTO_INCREMENT,
  date_of_transfer DATE NULL,
  recipient_name VARCHAR(45) NULL,
  status VARCHAR(45) NULL,
  accountId INT NOT NULL,
  customerId INT NOT NULL,
  PRIMARY KEY (transfer_details_id, accountId, customerId),
	FOREIGN KEY (accountId , customerId)
	REFERENCES mydb.account_details (accountId , customerId))
AUTO_INCREMENT = 300;
