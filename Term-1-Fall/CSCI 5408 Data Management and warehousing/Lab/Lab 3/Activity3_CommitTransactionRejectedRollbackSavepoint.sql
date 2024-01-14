use mydb;
CREATE PROCEDURE BankTransaction ()
	BEGIN
		SET autocommit = OFF;

		START TRANSACTION;

			UPDATE account_details
			SET account_balance = account_balance - 200
				WHERE accountId = 200;
    
			UPDATE account_details
			SET account_balance = account_balance + 200
				WHERE accountId = 201;

			INSERT INTO mydb.transfer_details (date_of_transfer, recipient_name, status, accountId, customerId)
			VALUES (CURDATE(), 'Doe', 'REJECTED', '201', '101');
			
			SELECT * FROM customer_details;
			SELECT * FROM account_details;
			SELECT * FROM transfer_details;
            
            IF EXISTS (SELECT 1 FROM transfer_details WHERE status = 'ACCEPTED' AND accountId = '201')
				THEN 
					COMMIT;
				ELSE
					ROLLBACK;
			END IF;
	END;



























































 


