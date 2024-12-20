# Amdor Bank Loans Database Design and Queries by Omosede

## Overview
The **Amdor_Bank_Loans** database is a relational database designed to manage customer information, transactions, loans, and loan payments efficiently. This README provides a detailed overview of the database structure, constraints, design methodology, and example queries to explore its functionality. The aim here is to showcase my ability to create  data from scratch and query accordingly.

---

## 1. Data Dictionary

### Customers Table
- **Customer_id** (INT): Primary key, uniquely identifying each customer.
- **Name** (VARCHAR(50)): Customer's name.
- **Gender** (VARCHAR(30)): Customer's gender.
- **Date_of_Birth** (DATE): Customer's date of birth.
- **Location** (VARCHAR(50)): Customer's residential location.
- **Email** (VARCHAR(50)): Customer's email address.
- **Phone_Number** (VARCHAR(30)): Customer's phone number.
- **Registration_date** (DATE): Date when the customer registered.
- **Exit_Date** (DATE): Date when the customer left (if applicable).

### Bank_Transaction Table
- **Transaction_ID** (INT): Primary key, uniquely identifying each transaction.
- **Customer_ID** (INT): Foreign key referencing `Customers.Customer_id`.
- **Transaction_Date** (DATE): Date of the transaction.
- **Transaction_type** (VARCHAR(50)): Type of the transaction (e.g., Credit, Debit).
- **Transaction_detail** (VARCHAR(30)): Description of the transaction.
- **Amount** (INT): Amount involved in the transaction.
- **Status** (VARCHAR(30)): Status of the transaction (e.g., Successful, Failed).

### Loans Table
- **Loan_ID** (INT): Primary key, uniquely identifying each loan.
- **Loan_Date** (DATE): Date when the loan was granted.
- **Customer_ID** (INT): Foreign key referencing `Customers.Customer_id`.
- **Amount** (DECIMAL(15)): Total loan amount.
- **Due_Date** (DATE): Due date for repayment.

### Loan_Payment Table
- **Payment_ID** (INT): Primary key, uniquely identifying each payment.
- **Loan_ID** (INT): Foreign key referencing `Loans.Loan_id`.
- **Payment_date** (DATE): Date when the payment was made.

---

## 2. Constraints Used and Their Rationale

### Primary Keys
- Ensure unique identification of records across all tables.

### Foreign Keys
- Establish relationships between tables:
  - `Bank_Transaction.Customer_ID` → `Customers.Customer_ID`
  - `Loans.Customer_ID` → `Customers.Customer_ID`
  - `Loan_Payment.Loan_ID` → `Loans.Loan_ID`
- Maintain referential integrity, preventing orphaned records.

### ON DELETE CASCADE / ON UPDATE CASCADE
- Automatically delete or update dependent records when referenced records are modified or deleted.

### NOT NULL Constraints
- Ensure critical fields like `Transaction_Date`, `Amount`, and `Due_Date` are always populated.

---

## 3. Methodology for Database Design

### Normalization
- The database schema is normalized to reduce redundancy and ensure consistency.

### Referential Integrity
- Achieved using foreign keys linking related tables.

### Transactional Integrity
- Financial transactions and loan payments are fully tracked with status history.

### Use of Constraints
- Constraints like primary keys, foreign keys, and NOT NULL ensure data accuracy and eliminate invalid data entries.

---

## 4. Example Queries

### Query 1: Identify Female Customers
```sql
SELECT Customer_id, Name, Gender
FROM Customers
WHERE Gender = 'Female'
GROUP BY Customer_id, Name, Gender;
```
- Retrieves all female customers, ensuring each customer is listed only once.

### Query 2: Join Bank_Transaction and Customers
```sql
SELECT CST.Customer_id, NAME, Transaction_type, Transaction_Date, Status
FROM Customers AS CST
INNER JOIN Bank_Transaction AS BKT
ON CST.Customer_id = BKT.Customer_id
GROUP BY CST.Customer_id, NAME, Transaction_type, Transaction_Date, Status;
```
- Provides a detailed view of customer activities, including transaction types and statuses.

### Query 3: Join Loans and Loan_Payment
```sql
SELECT * 
FROM Loans AS LN
INNER JOIN Loan_Payment AS LNPT
ON LN.Loan_ID = LNPT.Loan_ID;
```
- Combines loan details with corresponding payment information.

### Query 4: Dynamic Loan Payment Status
```sql
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
```
- Categorizes loan payment status as 'No Payment', 'On Time Payment', or 'Late Payment'.

### Query 5: Total Number of Customers
```sql
SELECT COUNT(DISTINCT Customer_id)
FROM Customers;
```
- Counts the total number of distinct customers.

### Query 6: Loan Payment Status by Customer
```sql
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
```
- Summarizes customers by their loan payment status using a CTE.

### Creating Views
#### Credit Transactions
```sql
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
INNER JOIN Bank_Transaction AS BNK
ON BNK.Customer_id = CST.Customer_id
WHERE Transaction_type = 'Credit';
```
- Provides an easy way to query credit transactions.

#### High-Value Credit Transactions
```sql
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
INNER JOIN Bank_Transaction AS BNK
ON BNK.Customer_id = CST.Customer_id
WHERE Transaction_type = 'Credit' AND
Amount >= 1000 AND
Status = 'Successful';
```
- Identifies high-value credit transactions exceeding £1,000.

### Stored Procedures and Functions
#### Loan Status by Customer
```sql
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
```
- Retrieves loan payment status by customer name.

#### Dynamic Bill Payment Function
```sql
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
ON BKT.Customer_id = CST.Customer_id
WHERE Transaction_detail = @Transaction_detail);
```
- Retrieves customers based on specific transaction details like "Bill Payment."

---

## 5. Conclusion
The **Amdor_Bank_Loans** database is designed to ensure data integrity and consistency while enabling efficient management of customer transactions and loans. The queries and views demonstrated above highlight the database's ability to support robust financial tracking, loan repayment monitoring, and customer activity analysis.
