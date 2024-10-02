   
CREATE TABLE bank (
    bank_name VARCHAR(50),
    bank_id INT primary key,
    location VARCHAR(50),
    branch_name VARCHAR(50),
    Pin_code int,
  CONSTRAINT check_bank_id CHECK (bank_id > 0),
  CONSTRAINT check_location_not_null CHECK (location IS NOT NULL)
);
INSERT INTO bank (bank_name, bank_id, location, branch_name, Pin_code)
VALUES ('YES Bank', 12345, 'VISHAKAPATNAM', 'Downtown Branch', 10001),
       ('SBI Bank', 54321, 'HYDERABAD', 'Uptown Branch', 90001),
       ('YONO Bank', 67890, 'MUMBAI', 'Midtown Branch', 60001),
       ('ICIC Bank', 98765, 'CHENNAI', 'Westside Branch', 80001),
       ('HDFC', 13579, 'KOLKATA', 'Eastside Branch', 70001);

CREATE TABLE employees (
    employee_name VARCHAR(50),
    employee_id INT,
    salary DECIMAL(10,2),
    gender VARCHAR(10),
    phone VARCHAR(15),
    mail VARCHAR(50)
);
INSERT INTO employees (employee_name, employee_id, salary, gender, phone, mail)
VALUES ('Ram', 1, 60000.00, 'male', '8928329424', 'ram@gmail.com'),
       ('Bob', 2, 55000.00, 'Male', '9876543210', 'bob@example.com'),
       ('charan', 3, 62000.00, 'male', '78239348294', 'carol@example.com'),
       ('rani', 4, 58000.00, 'FeMale', '89832983434', 'ranid@gmail.com'),
       ('shruthi', 5, 57000.00, 'Female', '9998887777', 'shruthi@gmail.com');

CREATE TABLE customers (
    customer_name VARCHAR(50),
    gender VARCHAR(10),
    customer_account_number INT primary key,
    phone VARCHAR(15),
    mail VARCHAR(50),
    CONSTRAINT chk_gender CHECK (gender IN ('Male', 'Female'))
);
INSERT INTO customers (customer_name, gender, customer_account_number, phone, mail)
VALUES ('Johny', 'Male', 1001, '6785684486', 'john.bank@gmail.com'),
       ('Jenny', 'Female', 1002, '9876543210', 'jenny.smith@gmail.com'),
       ('Alekya', 'Female', 1003, '8979798634', 'alice.johnson@gmail.com'),
       ('suresh', 'Male', 1004, '8934783400', 'suresh@gmail.com'),
       ('david', 'Female', 1005, '7834985345', 'david@gmail.com');

CREATE TABLE loan (
    principal_amount DECIMAL(10,2),
    interest_rate DECIMAL(5,2),
    term_length INT,
    monthly_payment DECIMAL(10,2),
    total_payment DECIMAL(10,2),
    CONSTRAINT check_principal_amount CHECK (principal_amount > 0),
    CONSTRAINT check_interest_rate CHECK (interest_rate > 0),
    CONSTRAINT check_term_length CHECK (term_length > 0),
    CONSTRAINT check_monthly_payment CHECK (monthly_payment > 0),
    CONSTRAINT check_total_payment CHECK (total_payment > 0)
);
INSERT INTO loan (principal_amount, interest_rate, term_length, monthly_payment, total_payment)
VALUES (10000.00, 5.25, 12, 900.00, 10800.00),
       (20000.00, 4.75, 24, 850.00, 20400.00),
       (15000.00, 6.00, 18, 1000.00, 18000.00),
       (25000.00, 4.50, 36, 700.00, 25200.00),
       (18000.00, 5.75, 30, 800.00, 24000.00);
-- select * from loan;
CREATE TABLE payment (
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(50),
    type_of_payment VARCHAR(50),
    CONSTRAINT check_amount CHECK (amount > 0),
    CONSTRAINT check_payment_date CHECK (payment_date <= CURRENT_DATE),
    CONSTRAINT check_payment_method CHECK (payment_method IN ('credit card', 'cash', 'paypal')),
    CONSTRAINT check_type_of_payment CHECK (type_of_payment IN ('online', 'offline'))
);
INSERT INTO payment (amount, payment_date, payment_method, type_of_payment)
VALUES (500.00, '2023-10-25', 'credit card', 'online'),
       (700.00, '2023-10-26', 'cash', 'offline'),
       (300.00, '2023-10-27', 'paypal', 'online'),
       (900.00, '2023-10-28', 'credit card', 'offline'),
       (600.00, '2023-10-29', 'cash', 'online');
CREATE TABLE Transactions (
id INT PRIMARY KEY , 
customer_account_number INT ,
amount DECIMAL(10,2), 
transaction_date DATE , 
transaction_type VARCHAR(50), 
CONSTRAINT fk_customer_id FOREIGN KEY (customer_account_number) 
  REFERENCES Customers(customer_account_number), 
CONSTRAINT check_transaction_type CHECK 
  (transaction_type IN ('Deposit', 'Withdraw')) 
);
INSERT INTO Transactions (customer_account_number, amount, transaction_date, transaction_type)
VALUES 
(1001, 1500.00, '2023-11-01', 'Deposit'),
(1002, 2000.00, '2023-11-02', 'Deposit'),
(1003, 1000.00, '2023-11-03', 'Withdraw'),
(1004, 500.00, '2023-11-04', 'Deposit'),
(1005, 700.00, '2023-11-05', 'Withdraw');

CREATE TABLE Accounts (
  
  account_number INT PRIMARY KEY,
  customer_id INT,
  balance DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  CONSTRAINT fk_customer_id FOREIGN KEY (customer_id)
  REFERENCES Customers (customer_id)
);
INSERT INTO Accounts (account_number, customer_id, balance)
VALUES 
(1001, 1001, 5000.00),
(1002, 1002, 6000.00),
(1003, 1003, 4000.00),
(1004, 1004, 8000.00),
(1005, 1005, 9000.00);
CREATE TABLE Savings_Account (
    account_number INT PRIMARY KEY,
    customer_id INT,
    balance DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id)
        REFERENCES Customers (customer_id)
);
INSERT INTO Savings_Account (account_number, customer_id, balance)
VALUES 
(2001, 2001, 10000.00),
(2002, 2002, 15000.00),
(2003, 2003, 12000.00),
(2004, 2004, 18000.00),
(2005, 2005, 14000.00);


CREATE TABLE Current_Account (
    account_number INT PRIMARY KEY,
    customer_id INT,
    balance DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id)
        REFERENCES Customers (customer_id)
);
INSERT INTO Current_Account (account_number, customer_id, balance)
VALUES 
(3001, 3001, 6000.00),
(3002, 3002, 7000.00),
(3003, 3003, 5000.00),
(3004, 3004, 4000.00),
(3005, 3005, 3000.00);



CREATE TABLE Offline (
  offline_id INT PRIMARY KEY ,
  customer_id INT,
  amount DECIMAL(10,2),
  transaction_date DATE,
  transaction_type VARCHAR(50),
  CONSTRAINT fk_customer_id FOREIGN KEY (customer_id)
    REFERENCES Customers (customer_id),
  CONSTRAINT check_transaction_type CHECK
    (transaction_type IN ('Deposit', 'Withdraw'))
);

INSERT INTO Offline (customer_id, amount, transaction_date, transaction_type)
VALUES (1001, 1500.00, '2023-11-06', 'Deposit'),
(1002, 2000.00, '2023-11-07', 'Deposit'),
(1003, 1000.00, '2023-11-08', 'Withdraw'),
(1004, 500.00, '2023-11-09', 'Deposit'),
(1005, 700.00, '2023-11-10', 'Withdraw');


CREATE TABLE Online (
  online_id INT PRIMARY KEY ,
  customer_id INT,
  amount DECIMAL(10,2),
  transaction_date DATE,
  transaction_type VARCHAR(50),
  CONSTRAINT fk_customer_id FOREIGN KEY (customer_id)
    REFERENCES Customers (customer_id),
  CONSTRAINT check_transaction_type CHECK
    (transaction_type IN ('Deposit', 'Withdraw'))
);

INSERT INTO Online (customer_id, amount, transaction_date, transaction_type)
VALUES (1001, 1500.00, '2023-11-06', 'Deposit'),
(1002, 2000.00, '2023-11-07', 'Deposit'),
(1003, 1000.00, '2023-11-08', 'Withdraw'),
(1004, 500.00, '2023-11-09', 'Deposit'),
(1005, 700.00, '2023-11-10', 'Withdraw');



CREATE TABLE net_banking (
  account_number INT,
  account_holder VARCHAR(255),
  balance DECIMAL(10, 2)
);
INSERT INTO net_banking (account_number, account_holder, balance)
  VALUES
  (123456, 'Vishnu', 1000.00),
 (546265, 'Sanjay', 2000.00),
(685265, 'Sumanth', 3000.00),
 (654665, 'Nithin', 4000.00),
   (642656, 'Saketh', 5000.00);



CREATE TABLE bank_statements (
  statement_id INT,
  account_number INT,
  transaction_type VARCHAR(255),
  amount DECIMAL(10, 2),
  transaction_date DATE
);
INSERT INTO bank_statements (statement_id, account_number, transaction_type, amount, transaction_date)
  values
 (001, 123456, 'Deposit', 500.00, '2022-01-01'),
(002, 546265, 'Withdrawal', 100.00, '2022-01-02'),
(003, 685265, 'Deposit', 300.00, '2022-01-03'),
 (004, 654665, 'Withdrawal', 200.00, '2022-01-04'),
 (005, 642656, 'Deposit', 1000.00, '2022-01-05');

CREATE TABLE cyber_crime (
  crime_id INT,
  crime_type VARCHAR(255),
  description varchar,
  report_date varchar
);
INSERT INTO cyber_crime (crime_id, crime_type, description, report_date)
VALUES (001, 'Hacking', 'Unauthorized access to system', '2022-01-10'),
 (002, 'Phishing', 'Deceptive attempt to obtain sensitive information', '2022-01-15'),
 (003, 'Identity Theft', 'Fraudulently using someone else\', '2022-01-20'),
(004, 'Malware Attack', 'Installation of harmful software for malicious purposes', '2022-01-25'),
(005, 'Cyberbullying', 'Harassment or threats online', '2022-01-30');
-- -- Select query 1: Show all customers with their account numbers
-- SELECT customer_name, customer_account_number
-- FROM customers;
-- -- Select query 2: Show all employees with their salaries greater than 60000
-- SELECT employee_name, salary
-- FROM employees
-- WHERE salary > 60000;
-- -- Select query 3: Show all transactions with the transaction date after '2023-11-03'
-- SELECT *
-- FROM Transactions
-- WHERE transaction_date > '2023-11-03';
-- -- Select query 4: Show all offline transactions with transaction type as 'Deposit'
-- SELECT *
-- FROM Offline
-- WHERE transaction_type = 'Deposit';
-- -- Query 1: Group customers by gender and count the number of customers for each gender
-- SELECT gender, COUNT(customer_account_number) as customer_count
-- FROM customers
-- GROUP BY gender;

-- -- Query 2: Group transactions by transaction type and show the total amount for each transaction type having total amount greater than 1000
-- SELECT transaction_type, SUM(amount) as total_amount
-- FROM Transactions
-- GROUP BY transaction_type
-- HAVING total_amount > 1000;

-- -- Query 3: Group offline transactions by customer_id and show average amount with having condition for average amount greater than 500
-- SELECT customer_id, AVG(amount) as average_amount
-- FROM Offline
-- GROUP BY customer_id
-- HAVING average_amount > 500;
-- Nested query using IN
-- SELECT * 
-- FROM Offline
-- WHERE transaction_type IN 
--     (SELECT transaction_type
--      FROM Transactions
--      WHERE amount > 1000);

-- -- Nested query using NOT IN
-- SELECT * 
-- FROM Offline
-- WHERE transaction_type NOT IN 
--     (SELECT transaction_type
--      FROM Transactions
--      WHERE amount <= 1000);


    -- correlated nested query using EXISTS
    -- SELECT * 
    -- FROM Offline o
    -- WHERE EXISTS (
    --     SELECT 1
    --     FROM Transactions t
    --     WHERE t.customer_account_number = o.customer_id
    -- );

    -- -- correlated nested query using NOT EXISTS
    -- SELECT * 
    -- FROM Offline o
    -- WHERE NOT EXISTS (
    --     SELECT 1
    --     FROM Transactions t
    --     WHERE t.customer_account_number = o.customer_id
    -- );

    -- -- AGGREGATE OPERATORS
    -- -- Count
    -- SELECT COUNT(*) FROM customers;

    -- -- Sum
    -- SELECT SUM(salary) FROM employees;

    -- -- Average
    -- SELECT AVG(balance) FROM Accounts;

    -- -- Maximum
    -- SELECT MAX(amount) FROM Transactions;

    -- -- Minimum
    -- SELECT MIN(principal_amount) FROM loan;
-- Union
-- SELECT customer_name, customer_account_number
-- FROM customers
-- UNION
-- SELECT employee_name, employee_id
-- FROM employees;

-- -- Intersect
-- SELECT employee_name, employee_id
-- FROM employees
-- INTERSECT
-- SELECT customer_name, customer_account_number
-- FROM customers;

-- -- Except
-- SELECT employee_name, employee_id
-- FROM employees
-- EXCEPT
-- SELECT customer_name, customer_account_number
-- FROM customers;
-- Inner Join
-- SELECT *
-- FROM customers
-- JOIN Accounts ON customers.customer_account_number = Accounts.account_number;

-- -- Left Join
-- SELECT *
-- FROM customers
-- LEFT JOIN Transactions ON customers.customer_account_number = Transactions.customer_account_number;

-- -- Right Join
-- SELECT *
-- FROM customers
-- RIGHT JOIN loan ON customers.customer_account_number = loan.customer_account_number;

-- -- Full Outer Join
-- SELECT *
-- FROM customers
-- FULL OUTER JOIN bank_statements ON customers.customer_account_number = bank_statements.account_number;


-- Bank (bank_name: VARCHAR, bank_id: INT (Primary Key), location: VARCHAR, branch_name: VARCHAR, Pin_code: INT)
  
--   Employee (employee_name: VARCHAR, employee_id: INT (Primary Key), salary: DECIMAL, gender: VARCHAR, phone: VARCHAR, mail: VARCHAR)
--   Customer (customer_name: VARCHAR, gender: VARCHAR, customer_account_number: INT (Primary Key), phone: VARCHAR, mail: VARCHAR), 
--   Loan (principal_amount: DECIMAL, interest_rate: DECIMAL, term_length: INT, monthly_payment: DECIMAL, total_payment: DECIMAL)
--   Payment (amount: DECIMAL, payment_date: DATE, payment_method: VARCHAR, type_of_payment: VARCHAR), Transaction (id: INT (Primary Key),customer_account_number: INT (Foreign Key), amount: DECIMAL, transaction_date: DATE, transaction_type: VARCHAR)
--   Account (account_number: INT (Primary Key), customer_id: INT (Foreign Key), balance: DECIMAL), Savings Account (account_number: INT (Primary Key), customer_id: INT (Foreign Key), balance: DECIMAL)
--   Current Account (account_number: INT (Primary Key), customer_id: INT (Foreign Key), balance: DECIMAL), 
--   Offline Transaction (offline_id: INT (Primary Key), customer_id: INT (Foreign Key), amount: DECIMAL, transaction_date: DATE, transaction_type: VARCHAR),

--   Online Transaction (online_id: INT (Primary Key), customer_id: INT (Foreign Key), amount: DECIMAL, transaction_date: DATE, transaction_type: VARCHAR), 
--   Net Banking (account_number: INT (Primary Key)
--   account_holder: VARCHAR, balance: DECIMAL), Bank Statement (statement_id: INT (Primary Key), account_number: INT (Foreign Key)
--   transaction_type: VARCHAR, amount: DECIMAL, transaction_date: DATE) 
--   Cyber Crime (crime_id: INT (Primary Key), crime_type: VARCHAR, description: VARCHAR, report_date: DATE)



-- Create a view to show all employees with their salaries greater than 60000
-- CREATE VIEW view_high_salary_employees AS
-- SELECT employee_name, salary
-- FROM employees
-- WHERE salary > 60000;

-- -- Create a view to show all transactions with the transaction date after '2023-11-03'
-- CREATE VIEW view_recent_transactions AS
-- SELECT *
-- FROM Transactions
-- WHERE transaction_date > '2023-11-03';

-- -- Create a view to show all offline transactions with transaction type as 'Deposit'
-- CREATE VIEW view_offline_deposits AS
-- SELECT *
-- FROM Offline
-- WHERE transaction_type = 'Deposit';
-- CREATE TRIGGER trigger1
-- AFTER INSERT ON customers
-- FOR EACH ROW
-- BEGIN
--     INSERT INTO customer_logs (log_message, log_date)
--     VALUES ('New customer added: ' || NEW.customer_name, NOW());
-- END;

-- CREATE TRIGGER trigger2
-- AFTER INSERT ON Transactions
-- FOR EACH ROW
-- BEGIN
--     UPDATE Accounts
--     SET balance = balance - NEW.amount
--     WHERE account_number = NEW.customer_account_number;
-- END;
DECLARE customer_cursor CURSOR FOR
SELECT * FROM customers;

OPEN customer_cursor;
FETCH customer_cursor INTO customer_name, gender, customer_account_number, phone, mail;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Customer: ' + customer_name + ', Account Number: ' + CONVERT(VARCHAR, customer_account_number);
    FETCH customer_cursor INTO customer_name, gender, customer_account_number, phone, mail;
END

CLOSE customer_cursor;
DEALLOCATE customer_cursor;

DECLARE employee_cursor CURSOR FOR
SELECT * FROM employees;

OPEN employee_cursor;
FETCH employee_cursor INTO employee_name, employee_id, salary, gender, phone, mail;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Employee: ' + employee_name + ', ID: ' + CONVERT(VARCHAR, employee_id);
    FETCH employee_cursor INTO employee_name, employee_id, salary, gender, phone, mail;
END

CLOSE employee_cursor;
DEALLOCATE employee_cursor;