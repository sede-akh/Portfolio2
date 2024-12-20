
----1. Creating Database
CREATE DATABASE Amdor_Bank_loans;


 ----2.Using Database as host--
USE  Amdor_Bank_loans;

---3. Creating Table 1
CREATE TABLE Customers(
      Customer_id INT PRIMARY KEY,
	  Name VARCHAR(50),
	  Gender VARCHAR (30),
	  Date_of_Birth DATE,
	  Location VARCHAR (50),
	  Email VARCHAR(50),
	  Phone_Number VARCHAR (30),
	  Registration_date DATE,
	  Exit_Date DATE);

--- 4. Creating Table 2
CREATE TABLE Bank_Transaction(
	   Transaction_ID INT PRIMARY KEY,
	   Customer_ID INT,
	   Transaction_Date Date,
	   Transaction_type VARCHAR(50),
	   Transaction_detail VARCHAR (30),
	   Amount INT,
	   Status VARCHAR (30)
	   FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
	   ON DELETE CASCADE
	   ON UPDATE CASCADE
			
	   );

	  ----5.	Creating Table 3
	  CREATE TABLE Loans(
	         Loan_ID INT PRIMARY KEY,
			 Loan_Date DATE,
			 Customer_ID INT,
			 Amount DECIMAL (15),
			 Due_Date DATE,
			 FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
			ON DELETE CASCADE
			ON UPDATE CASCADE
			 );

	-----6.		Creating Table 4

	CREATE TABLE Loan_Payment (
			Payment_ID INT PRIMARY KEY,
			Loan_ID INT,
			Payment_date DATE,
			FOREIGN KEY (Loan_ID) REFERENCES Loans(Loan_ID)
			ON DELETE CASCADE
            ON UPDATE CASCADE);
/*Note: The inclusion of a foreign key in the design is crucial as it establishes a relationship 
between tables. This ensures data integrity by enforcing referential constraints, allowing for 
automatic updates and deletions (using ON UPDATE and ON DELETE actions) to maintain consistency 
across related table*/


-----7 Populating CUSTOMER Table--

	INSERT INTO Customers (customer_id, Name, Gender, Date_of_Birth, Location, Email, Phone_Number, Registration_date, Exit_Date)
VALUES
(101, 'Keeanan Jones', 'Female', '1985-06-15', 'Birmingham', 'Keeanan.Jones@gmail.com', '07867756788', '2020-01-10', NULL),
(103, 'Sophia Wright', 'Female', '1992-03-10', 'London', 'sophia.wright@gmail.com', '07898765432', '2021-05-15', NULL),
(104, 'Liam Turner', 'Male', '1988-12-22', 'Manchester', 'liam.turner@gmail.com', '07865784321', '2020-03-19', NULL),
(105, 'Olivia Brown', 'Female', '1995-09-14', 'Liverpool', 'olivia.brown@yahoo.com', '07987654321', '2021-08-10', NULL),
(106, 'Noah Wilson', 'Male', '1991-06-18', 'Glasgow', 'noah.wilson@hotmail.com', '07834567210', '2022-02-28', NULL),
(107, 'Emma Taylor', 'Female', '1990-11-30', 'Leeds', 'emma.taylor@gmail.com', '07765432109', '2019-10-05', NULL),
(108, 'James Moore', 'Male', '1987-04-25', 'Sheffield', 'james.moore@gmail.com', '07823456781', '2021-01-20', NULL),
(109, 'Ava Johnson', 'Female', '1994-08-19', 'Nottingham', 'ava.johnson@gmail.com', '07712345678', '2020-07-14', NULL),
(110, 'Mason Lee', 'Male', '1993-05-21', 'Cardiff', 'mason.lee@gmail.com', '07654321098', '2022-11-01', NULL),
(111, 'Isabella Clark', 'Female', '1989-01-15', 'Belfast', 'isabella.clark@gmail.com', '07887654310', '2021-03-25', NULL),
(112, 'Ethan Harris', 'Male', '1986-10-12', 'Bristol', 'ethan.harris@gmail.com', '07543210987', '2020-09-16', NULL),
(113, 'Mia Walker', 'Female', '1997-07-07', 'Edinburgh', 'mia.walker@gmail.com', '07834567123', '2021-12-12', NULL),
(114, 'Alexander King', 'Male', '1983-02-28', 'Aberdeen', 'alex.king@gmail.com', '07654321012', '2022-06-18', NULL),
(115, 'Amelia Hall', 'Female', '1996-11-02', 'Brighton', 'amelia.hall@yahoo.com', '07976543211', '2021-04-30', NULL),
(116, 'Lucas Scott', 'Male', '1990-08-03', 'Oxford', 'lucas.scott@gmail.com', '07765432098', '2022-01-15', NULL),
(117, 'Charlotte Hill', 'Female', '1992-12-18', 'Cambridge', 'charlotte.hill@gmail.com', '07854321099', '2019-05-22', NULL),
(118, 'Benjamin Adams', 'Male', '1985-03-09', 'Coventry', 'ben.adams@gmail.com', '07567843210', '2020-12-19', NULL),
(119, 'Harper Martin', 'Female', '1998-07-20', 'Plymouth', 'harper.martin@gmail.com', '07898765401', '2022-03-12', NULL),
(120, 'Elijah Lewis', 'Male', '1984-09-11', 'York', 'elijah.lewis@gmail.com', '07787654321', '2021-09-05', NULL),
(121, 'Grace Young', 'Female', '1993-10-30', 'Exeter', 'grace.young@gmail.com', '07965432100', '2020-06-07', NULL),
(122, 'Aiden Green', 'Male', '1982-01-25', 'Norwich', 'aiden.green@gmail.com', '07854321987', '2021-10-28', NULL);

  SELECT * FROM Customers;


  -----8 Populating Bank Transaction Table--

	
	
	INSERT INTO Bank_Transaction (Transaction_ID, Customer_ID, Transaction_Date, Transaction_type, Transaction_detail, Amount, Status)
VALUES
(1236, 101, '2023-01-15', 'Credit', 'Incoming Transfer', 1500, 'Successful'),
(1237, 101, '2023-01-20', 'Debit', 'Bill Payment', 200, 'Successful'),
(1238, 103, '2023-02-05', 'Credit', 'Incoming Transfer', 1200, 'Successful'),
(1239, 103, '2023-02-08', 'Debit', 'Outgoing Transfer', 800, 'Failed'),
(1240, 104, '2023-03-10', 'Credit', 'Incoming Transfer', 1000, 'Successful'),
(1241, 104, '2023-03-15', 'Debit', 'Bill Payment', 150, 'Successful'),
(1242, 105, '2023-04-05', 'Credit', 'Incoming Transfer', 500, 'Successful'),
(1243, 105, '2023-04-12', 'Debit', 'Outgoing Transfer', 250, 'Failed'),
(1244, 106, '2023-05-01', 'Credit', 'Incoming Transfer', 1800, 'Successful'),
(1245, 106, '2023-05-06', 'Debit', 'Bill Payment', 400, 'Successful'),
(1246, 107, '2023-06-10', 'Credit', 'Incoming Transfer', 750, 'Successful'),
(1247, 107, '2023-06-15', 'Debit', 'Outgoing Transfer', 300, 'Successful'),
(1248, 108, '2023-07-20', 'Credit', 'Incoming Transfer', 200, 'Failed'),
(1249, 108, '2023-07-25', 'Debit', 'Bill Payment', 50, 'Successful'),
(1250, 109, '2023-08-05', 'Credit', 'Incoming Transfer', 2000, 'Successful'),
(1251, 109, '2023-08-12', 'Debit', 'Outgoing Transfer', 900, 'Successful'),
(1252, 110, '2023-09-15', 'Credit', 'Incoming Transfer', 1100, 'Failed'),
(1253, 110, '2023-09-20', 'Debit', 'Bill Payment', 400, 'Successful'),
(1254, 116, '2023-11-01', 'Credit', 'Incoming Transfer', 2200, 'Successful'),
(1255, 119, '2023-11-12', 'Debit', 'Outgoing Transfer', 600, 'Failed'),
(1256, 122, '2023-12-05', 'Credit', 'Incoming Transfer', 1500, 'Successful')
;
 SELECT * FROM Bank_Transaction;

----9. Populating Loans Table--
	INSERT INTO Loans (Loan_ID, Loan_Date, Customer_ID, Amount, Due_Date)
VALUES
(1236780, '2023-01-10', 101, 5000, '2024-01-10'),
(1236781, '2023-02-15', 103, 10000, '2024-02-15'),
(1236782, '2023-03-20', 104, 7000, '2024-03-20'),
(1236783, '2023-04-25', 105, 15000, '2024-04-25'),
(1236784, '2023-05-10', 106, 8000, '2024-05-10'),
(1236785, '2023-06-01', 107, 12000, '2024-06-01'),
(1236786, '2023-07-10', 108, 4000, '2024-07-10'),
(1236787, '2023-08-15', 109, 5000, '2024-08-15'),
(1236788, '2023-09-05', 110, 11000, '2024-09-05'),
(1236789, '2023-10-25', 111, 9000, '2024-10-25'),
(1236790, '2023-11-10', 116, 6500, '2024-11-10'),
(1236791, '2023-12-01', 119, 14000, '2024-12-01'),
(1236792, '2024-01-05', 122, 18000, '2025-01-05'),
(1236793, '2024-02-10', 112, 7000, '2025-02-10'),
(1236794, '2024-03-15', 113, 12000, '2025-03-15'),
(1236795, '2024-04-20', 114, 9500, '2025-04-20'),
(1236796, '2024-05-05', 115, 11000, '2025-05-05'),
(1236797, '2024-06-01', 117, 8500, '2025-06-01'),
(1236798, '2024-07-15', 118, 13500, '2025-07-15');

 SELECT * from Loans;
	    
--------10. Populating Loan_payment Table--

		
INSERT INTO Loan_Payment (Payment_ID, Loan_ID, Payment_date)
VALUES
(807, 1236780, '2023-02-10'),
(808, 1236780, NULL),
(809, 1236782, '2023-04-25'),
(810, 1236782, '2024-04-01'),
(811, 1236783, '2023-06-05'),
(812, 1236783, '2024-05-15'),
(813, 1236784, NULL),
(814, 1236784, '2024-09-20'),
(815, 1236785, '2023-11-15'),
(816, 1236785, NULL),
(817, 1236786, '2023-12-02'),
(818, 1236786, '2024-02-20'),
(819, 1236787, '2024-01-10'),
(820, 1236787, NULL),
(821, 1236788, '2024-03-30'),
(822, 1236788, '2024-06-20'),
(823, 1236789, '2024-07-01'),
(824, 1236789, '2024-09-30'),
(825, 1236790, '2024-07-10'),
(826, 1236790, NULL),
(827, 1236791, '2024-11-01'),
(828, 1236792, '2024-12-25'),
(829, 1236793, NULL),
(830, 1236794, '2025-01-05'),
(831, 1236795, '2025-03-01'),
(832, 1236796, NULL),
(833, 1236797, '2025-06-01'),
(834, 1236798, '2025-04-20');

Select * From Loan_payment;
									--EXPLORATORY ANALYSIS--

									
-----11. Identifying Gender of customers using Where and Group by and further curating a query to count the genders--

SELECT Customer_id, Name,Gender
	FROM 
	Customers
	WHERE Gender= 'Female'
	GROUP BY Customer_id,Name, Gender;

	 -----Count of Gender-------
	SELECT 
    Gender,
    COUNT(*) AS Gender_Count
FROM 
    Customers
GROUP BY 
    Gender;

/*Findings: Female 11, Male 10*/



/* 12.	Objective: To query the `Bank_Transaction` table and the `Customer` table 
to retrieve the transaction type, transaction status, and the corresponding customer name. 
This query provides a clear view of customer activities and transaction details.*/

SELECT  CST.Customer_id,NAME, Transaction_type,Transaction_Date,Status
	FROM Customers AS CST
	INNER JOIN Bank_Transaction AS BKT
	ON CST.Customer_id=BKT.Customer_id
	GROUP BY CST.Customer_id,NAME, Transaction_type,Transaction_Date,Status;

/* 13. Objective**: To utilize a `JOIN` operation to create a comprehensive view of both the 
       `Loans` and `Loan_Payment` tables. This will allow concurrent access to detailed loan
	   information alongside payment records, providing a unified perspective on the loan lifecycle*/

SELECT * 
FROM Loans AS LN
INNER JOIN Loan_Payment AS LNPT
ON LN.Loan_ID = LNPT.Loan_ID;

/*14.	 Objective: To use the CASE-WHEN statement to dynamically determine and display the status of loan payments. 
		This approach will categorize payments as either "Cleared" or "Not Cleared" based on specific conditions,
		providing a clear and concise view of payment statuses*/



SELECT 
    LN.Loan_ID, 
    LN.Loan_Date,
    LN.Customer_ID,
    LN.Amount,
    LN.Due_Date,    
    LNPT.Payment_ID,
    LNPT.Payment_date,
    CASE 
        WHEN LNPT.Payment_date IS NULL THEN 'No Payment'
        WHEN LNPT.Payment_date <= LN.Due_Date THEN 'On Time Payment'
        WHEN LNPT.Payment_date > LN.Due_Date THEN 'Late Payment'
    END AS Loan_Status
FROM Loans AS LN
INNER JOIN Loan_Payment AS LNPT
ON LN.Loan_ID = LNPT.Loan_ID;

----15 Total Number of Customers--

SELECT  COUNT(DISTINCT Customer_id)
		FROM Customers;
/* Findngs: There is a total of 21 customers*/

 /* 16  Objective: To utilize a Common Table Expression (CTE) to create a temporary result set that calculates the 
		total number of customers categorized by their loan status. This approach provides an efficient and organized 
		method for summarizing customer data based on payment statuses*/

WITH LoanStatus AS (
    SELECT 
        LN.Loan_ID, 
        LN.Loan_Date,
        LN.Customer_ID,
        LN.Amount,
        LN.Due_Date,    
        LNPT.Payment_ID,
        LNPT.Payment_date,
        CASE 
            WHEN LNPT.Payment_date IS NULL THEN 'No Payment'
            WHEN LNPT.Payment_date <= LN.Due_Date THEN 'On Time Payment'
            WHEN LNPT.Payment_date > LN.Due_Date THEN 'Late Payment'
        END AS Loan_Status
    FROM Loans AS LN
    INNER JOIN Loan_Payment AS LNPT ON LN.Loan_ID = LNPT.Loan_ID
)

SELECT 
    Loan_Status,
    COUNT(DISTINCT Customer_ID) AS Customer_Count
FROM LoanStatus
GROUP BY Loan_Status;

/* 17 Creating a view to display only credit transactions by combining data from the 
Customers table and the Transactions table. This allows for the inclusion of
customer names and locations for better context. */

CREATE VIEW Credit_Transactions AS
 SELECT 
	   CST.Customer_id,
	   CST.Name,
	   CST.Location,
	   BNK.Transaction_ID,
	   BNK.Transaction_Date,
	   BNK.Transaction_type,
	   BNK.Transaction_detail,
	   BNK.Amount,
	   BNK.status

	   FROM Customers AS CST 	
	   INNER JOIN Bank_Transaction As BNK

	ON BNK.Customer_id= CST.Customer_id
	WHERE Transaction_type ='Credit';

	SELECT * FROM Credit_Transactions;

/*18  Creating a view to display credit transactions exceeding £1,000 with a status of 'Successful, 
	  aimed at identifying high-value customers by combining data 
	  from the Customers table and the Bank_Transaction table*/


	  CREATE VIEW HighValueCustomers AS
	   SELECT 
	   CST.Customer_id,
	   CST.Name,
	   CST.Location,
	   BNK.Transaction_ID,
	   BNK.Transaction_Date,
	   BNK.Transaction_type,
	   BNK.Transaction_detail,
	   BNK.Amount,
	   BNK.status

	   FROM Customers AS CST 	
	   INNER JOIN Bank_Transaction As BNK

	ON BNK.Customer_id= CST.Customer_id
	WHERE Transaction_type ='Credit' AND
	AMOUNT>=1000 AND
	Status= 'Successful';
	


SELECT * FROM HighValueCustomers;

/*19    This procedure is designed to fetch the status of loans (either "Cleared" or "Not Cleared") 
		for a specific customer based on their name. By executing this procedure and providing the customer’s name,
		the loan details and their respective statuses will be displayed.
		This functionality allows quick and efficient tracking of a customer's loan payment status.*/
 
 

		  CREATE PROCEDURE LoanStatusByNames
    @CustomerName VARCHAR(50) 
AS
    BEGIN
    SELECT 
        LNPT.Loan_ID,
        CST.NAME,
        LN.Loan_Date,
        Location,
        CASE 
            WHEN LNPT.Payment_date <= LN.Due_Date THEN 'Cleared'
            ELSE 'Not Cleared'
        END AS STATUS 
    FROM 
        Loan_Payment AS LNPT
    INNER JOIN 
        Loans AS LN
        ON LNPT.Loan_ID = LN.Loan_ID
    INNER JOIN 
        Customers AS CST
        ON CST.Customer_id = LN.Customer_id
    WHERE 
        CST.NAME = @CustomerName; 
   END;

EXEC LoanStatusByNames 'Emma Taylor';

/*20		Objective: To create a dynamic table-valued function that retrieves a list of customers 
			who use their accounts for specific transaction types, such as "Bill Payment." This function
			will allow flexibility by accepting a transaction type as an input parameter, making it reusable 
			for other transaction types as well.*/

CREATE FUNCTION dbo.BillpaymentCustomers
(
    @Transaction_detail Varchar(50)
	)
	RETURNS TABLE
	AS 
	RETURN
	(
SELECT CST.Customer_ID,
	   CST.NAME,
	   BKT.Transaction_detail
	FROM Bank_Transaction AS BKT
	INNER JOIN
	Customers AS CST
	ON BKT.Customer_id= CST.Customer_id
	WHERE Transaction_detail = @Transaction_detail); -- BY using @Transaction_detail i am ensuring the function can be dynamic-- 
	
	SELECT * FROM dbo.BillpaymentCustomers('Bill Payment');
	
	SELECT * FROM dbo.BillpaymentCustomers('Outgoing Transfer');


									--END--