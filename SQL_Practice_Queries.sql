CREATE DATABASE sql_interview_practice;

USE sql_interview_practice;


-- =========================
-- 1. CUSTOMERS TABLE
-- =========================

CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

INSERT INTO customers
(customer_id, customer_name, city, age, gender)
VALUES
('C001', 'Rahul', 'Delhi', 25, 'Male'),
('C002', 'Priya', 'Mumbai', 31, 'Female'),
('C003', 'Aman', 'Delhi', 28, 'Male'),
('C004', 'Neha', 'Jaipur', 24, 'Female'),
('C005', 'Riya', 'Pune', 35, 'Female'),
('C006', 'Arjun', 'Delhi', 42, 'Male'),
('C007', 'Simran', 'Mumbai', 29, 'Female'),
('C008', 'Karan', 'Bangalore', 38, 'Male'),
('C009', 'Anjali', 'Pune', 26, 'Female'),
('C010', 'Rohit', 'Delhi', 45, 'Male');


-- =========================
-- 2. PRODUCTS TABLE
-- =========================

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products
(product_id, product_name, category, price)
VALUES
('P001', 'Laptop', 'Electronics', 65000),
('P002', 'Mouse', 'Electronics', 1200),
('P003', 'Keyboard', 'Electronics', 2500),
('P004', 'Monitor', 'Electronics', 18000),
('P005', 'Chair', 'Furniture', 8500),
('P006', 'Desk', 'Furniture', 15000),
('P007', 'Headphones', 'Electronics', 3500),
('P008', 'Printer', 'Electronics', 12000);


-- =========================
-- 3. ORDERS TABLE
-- =========================

CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    product_id VARCHAR(10),
    order_date DATE,
    quantity INT,
    amount DECIMAL(10,2),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

INSERT INTO orders
(order_id, customer_id, product_id, order_date, quantity, amount)
VALUES
('O001', 'C001', 'P001', '2026-01-05', 1, 65000),
('O002', 'C002', 'P002', '2026-01-08', 2, 2400),
('O003', 'C003', 'P004', '2026-01-12', 1, 18000),
('O004', 'C001', 'P007', '2026-01-15', 2, 7000),
('O005', 'C004', 'P005', '2026-02-02', 1, 8500),
('O006', 'C005', 'P006', '2026-02-05', 1, 15000),
('O007', 'C002', 'P003', '2026-02-10', 1, 2500),
('O008', 'C006', 'P001', '2026-02-18', 1, 65000),
('O009', 'C007', 'P008', '2026-03-03', 1, 12000),
('O010', 'C003', 'P002', '2026-03-07', 3, 3600),
('O011', 'C001', 'P004', '2026-03-15', 1, 18000),
('O012', 'C008', 'P006', '2026-03-20', 2, 30000),
('O013', 'C005', 'P001', '2026-04-02', 1, 65000),
('O014', 'C009', 'P007', '2026-04-08', 1, 3500),
('O015', 'C010', 'P005', '2026-04-12', 2, 17000),
('O016', 'C002', 'P001', '2026-04-20', 1, 65000),
('O017', 'C006', 'P008', '2026-05-01', 1, 12000),
('O018', 'C007', 'P003', '2026-05-05', 2, 5000),
('O019', 'C008', 'P004', '2026-05-12', 1, 18000),
('O020', 'C001', 'P002', '2026-05-18', 2, 2400);


-- =========================
-- 4. DEPARTMENTS TABLE
-- =========================

CREATE TABLE departments (
    department_id VARCHAR(10) PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments
(department_id, department_name)
VALUES
('D01', 'Sales'),
('D02', 'IT'),
('D03', 'HR'),
('D04', 'Finance');


-- =========================
-- 5. EMPLOYEES TABLE
-- =========================

CREATE TABLE employees (
    employee_id VARCHAR(10) PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id VARCHAR(10),
    manager_id VARCHAR(10),
    salary DECIMAL(10,2),

    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);

INSERT INTO employees
(employee_id, employee_name, department_id, manager_id, salary)
VALUES
('E001', 'Amit', 'D01', NULL, 90000),
('E002', 'Pooja', 'D01', 'E001', 55000),
('E003', 'Raj', 'D01', 'E001', 65000),
('E004', 'Sneha', 'D02', NULL, 100000),
('E005', 'Vikash', 'D02', 'E004', 60000),
('E006', 'Meena', 'D02', 'E004', 75000),
('E007', 'Nitin', 'D03', NULL, 80000),
('E008', 'Kavita', 'D03', 'E007', 50000),
('E009', 'Mohit', 'D04', NULL, 95000),
('E010', 'Tanya' , 'D04', 'E009', 58000);

SELECT * FROM employees
SELECT * FROM customers
SELECT * FROM products
SELECT * FROM departments
SELECT * FROM orders

--All records of employees table
SELECT * FROM employees

--Show employee_name & salary

SELECT employee_name,salary
FROM employees;

--Show unique departments

SELECT DISTINCT department_id
FROM employees;

--Find employees whose salary is above 50000

SELECT employee_name,salary
FROM employees
WHERE salary> 50000;

--Find employees whose salary is between 30000 - 60000

SELECT employee_name,salary
FROM employees
WHERE salary BETWEEN 30000 AND 60000;

--Find employees who belong to 'IT' department only

SELECT e.employee_name,d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
WHERE department_name='IT';

--Arrange the employees in descending order of salary

SELECT * FROM employees
ORDER BY salary DESC;

--Top 5 highest paid employees

SELECT * FROM employees
ORDER BY salary DESC
LIMIT 5;

--Find employees whose name start with A

SELECT employee_name
FROM employees
WHERE employee_name LIKE 'A%';

SELECT * FROM employees
SELECT * FROM customers
SELECT * FROM products
SELECT * FROM departments
SELECT * FROM orders

--calculate total salary

SELECT SUM(salary) AS total_salary
FROM employees;

--calculate AVG salary

SELECT AVG(salary) AS AVG_salary
FROM employees;

--calculate lowest salary

SELECT MIN(salary) AS lowest_salary
FROM employees;

--calculate Highest salary

SELECT MAX(salary) AS highest_salary
FROM employees;

--count of employees

SELECT COUNT(employee_id) AS count_of_employees
FROM employees;

--Employee count according to department

SELECT d.department_name, COUNT(e.employee_id) AS employee_count_by_dept
FROM employees e
 JOIN departments d
 ON e.department_id=d.department_id
 GROUP BY d.department_name;

 --AVG salary of employees by department

 SELECT d.department_name, AVG(e.salary) AS AVG_sal_by_dept
 FROM departments d
 JOIN employees e
 ON d.department_id=e.department_id
 GROUP BY d.department_name;

 --MAX salary by dept

 SELECT d.department_name, MAX(e.salary) AS MAX_sal_by_dept
 FROM departments d
 JOIN employees e
 ON d.department_id=e.department_id
 GROUP BY d.department_name;

 --Show those departments only whose employees are more than 10

 SELECT d.department_name, COUNT(e.employee_id)
 FROM departments d
 JOIN employees e
 ON d.department_id=e.department_id
 GROUP BY d.department_name
 HAVING COUNT(e.employee_id)>10;

 --Show those departments only whose AVG salary is more than 50000

 SELECT d.department_name, AVG (e.salary) AS AVG_salary
 FROM departments d
 JOIN employees e
 ON d.department_id=e.department_id
 GROUP BY d.department_name
 HAVING AVG (e.salary)> 50000;

 --Find the difference of highest & lowest salary

 SELECT MAX(salary), COALESCE(MIN(salary),0) AS Min_salary,
 MAX(salary) - COALESCE(MIN(salary),0) AS diff_of_highest_lowest_sal
 FROM employees;

 --Month-Wise total sales

 SELECT DATE_TRUNC('month',order_date) AS Month,
 SUM(amount) AS total_sales
 FROM Orders
 GROUP BY DATE_TRUNC('month',order_date)
 ORDER BY Month;

 SELECT * FROM employees
SELECT * FROM customers
SELECT * FROM products
SELECT * FROM departments
SELECT * FROM orders
 
 
 --Total revenue by customers

 SELECT c.customer_name, SUM(o.amount) AS total_revenue
 FROM customers c
 JOIN orders o
 ON c.customer_id=o.customer_id
 GROUP BY c.customer_name;

 --Top 5 customers by revenue

 SELECT c.customer_name, SUM(o.amount) AS Total_revenue
 FROM customers c
 JOIN orders o
 ON c.customer_id=o.customer_id
 GROUP BY c.customer_name
 ORDER BY total_revenue DESC
 LIMIT 5;

 --Find average salary by department

 SELECT d.department_name, AVG(e.salary) AS avg_salary
 FROM departments d
 JOIN employees e
 ON e.department_id=d.department_id
 GROUP BY d.department_name;

 --Find employee count by department

 SELECT d.department_name,COUNT(e.employee_id) AS employee_count
 FROM departments d
 JOIN employees e
 ON e.department_id=d.department_id
 GROUP BY d.department_name;

 --Find total salary by department

 SELECT d.department_name,SUM(e.salary) AS total_salary
 FROM departments d
 JOIN employees e
 ON d.department_id=e.department_id
 GROUP BY d.department_name;

 --Show those departments only whose avg salary is more than 60000

 SELECT d.department_name,AVG(e.salary) AS avg_salary
 FROM departments d
 JOIN employees e
 ON e.department_id=d.department_id
 GROUP BY d.department_name
 HAVING AVG(e.salary)>60000;

 --Find whose customers only who placed order more than 3

 SELECT c.customer_name, COUNT(o.order_id) AS count_of_orders
 FROM customers c
 JOIN orders o
 ON c.customer_id=o.customer_id
 GROUP BY c.customer_name
 HAVING COUNT(o.order_id)>3;

 
 SELECT * FROM employees
SELECT * FROM customers
SELECT * FROM products
SELECT * FROM departments
SELECT * FROM orders

 --Product wise total sales

 SELECT p.product_name,SUM(o.amount) AS total_sales
 FROM products p
 JOIN orders o
 ON p.product_id=o.product_id
 GROUP BY p.product_name;

 --Category wise revenue

 SELECT p.category, SUM(o.amount) AS total_revenue
 FROM products p
 JOIN orders o
 ON p.product_id=o.product_id
 GRoUP BY p.category;

 --Month wise order count

 SELECT DATE_TRUNC('Month',order_date) AS Month,
 COUNT(order_id) AS order_count
 FROM orders
 GROUP BY DATE_TRUNC('Month',order_date)
 ORDER BY Month;

 --Show those month only whose sales more than 1lakh

 SELECT DATE_TRUNC('Month',Order_date) AS Month,
 SUM(amount) AS total_sales
 FROM orders
 GROUP BY DATE_TRUNC('Month',order_date)
 HAVING SUM(amount) > 100000;

 --Show customer names with their orders

 SELECT c.customer_name, o.order_id,o.quantity
 FROM customers c
 JOIN orders o
 ON c.customer_id=o.customer_id;

 --Show all customers including those who didn't placed any order

 SELECT c.customer_name,o.order_id
 FROM customers c
 LEFT JOIN orders o
 ON c.customer_id=o.customer_id;

 --Customer wise toal order amount

 SELECT c.customer_name, SUM(o.amount) AS total_order_amount
 FROM customers c
 JOIN orders o
 ON c.customer_id=o.customer_id
 GROUP BY c.customer_name;

 --Customers who didn't placed any order

 SELECT c.customer_name
 FROM customers c
 LEFT JOIN orders o
 ON c.customer_id=o.customer_id
 WHERE o.order_id IS NULL;

 SELECT * FROM employees
SELECT * FROM customers
SELECT * FROM products
SELECT * FROM departments
SELECT * FROM orders

 --Combine product name with their sales information
 
 SELECT p.product_name, SUM(o.amount) AS total_sales
 FROM products p
 JOIN orders o
 ON p.product_id=o.product_id
 GROUP BY p.product_name ;

 -- Join Orders + customers + Products
 
 SELECT *
 FROM orders o
 JOIN customers c 
 ON c.customer_id=o.customer_id
 JOIN products p
 ON p.product_id=o.product_id ;

 -- customer wise count number of orders

 SELECT c.customer_name,COUNT(o.order_id) AS num_of_customers
 FROM customers c
 JOIN orders o
 ON c.customer_id=o.customer_id
 GROUP BY c.customer_name;

 --Highest spending customer

 SELECT c.customer_name,SUM(o.amount) AS spent_amount
 FROM customers c
 JOIN orders o
 ON c.customer_id=o.customer_id
 GROUP BY c.customer_name
 ORDER BY spent_amount DESC
 LIMIT 1;

 --Find the customers whose total purchase is more than 50000

 SELECT c.customer_name,SUM(o.amount) AS total_purchase
 FROM customers c
 JOIN orders o
 ON c.customer_id=o.customer_id
 GROUP BY c.customer_name
 HAVING SUM(o.amount) > 50000;

 --Join employees & department tables and show employee_name & department_name

 SELECT e.employee_name,d.department_name
 FROM employees e
 JOIN departments d
 ON e.department_id=d.department_id;

 --Give categories to employees based on their salary

 SELECT * ,
 CASE
 WHEN (salary) > '80000' THEN 'High'
 WHEN (salary) BETWEEN '50000' AND '80000' THEN 'Medium'
 ELSE 'Low'
 END AS categories
 FROM employees;

 --Divide customers in group according to their age

 SELECT * ,
 CASE 
 WHEN (age) > 40 THEN 'Old'
 WHEN (age) BETWEEN 20 AND 40 THEN 'Youth'
 ELSE 'Teenagers'
 END AS Age_group
 FROM customers;

 --Divide sales into categories

 SELECT order_id,amount,
 CASE 
 WHEN amount > 100000 THEN 'High Sales'
 WHEN amount BETWEEN 50000 AND 100000 THEN 'Medium Sales'
 ELSE 'Low Sales'
 END AS Categories_by_sales
 FROM orders
 GROUP BY order_id;

 --Show churned customers as churn & non-churn customers as Active
 
 SELECT c.customer_name,
 CASE 
 WHEN MAX(o.order_date) < CURRENT_DATE - INTERVAL'6 months' THEN 'Churned'
 ELSE 'Active'
 END AS Customer_status
 FROM customers c
 LEFT JOIN orders o
 ON c.customer_id=o.customer_id
 GROUP BY c.customer_name;

 SELECT * FROM employees
  SELECT * FROM customers
  SELECT * FROM products
SELECT * FROM departments
SELECT * FROM orders

 --Categorize products basis on profit margin of products

 SELECT  p.product_name,
 SUM(o.amount -p.price) AS total_margin,
 CASE
 WHEN SUM(o.amount -p.price)  > 8000 THEN 'High'
 WHEN SUM(o.amount -p.price) > 5000 THEN 'Medium'
 ELSE 'Low'
END AS Profit_margin
FROM products p
JOIN orders o
ON p.product_id=o.product_id
GROUP BY p.product_name;

--Find employees whose salary is more than Avg salary

SELECT AVG(salary) AS avg_salary
FROM employees;

SELECT employee_name,salary
FROM employees
WHERE salary > (SELECT AVG (salary) FROM employees);

--Find employee whose salary is highest

SELECT MAX(salary) AS Highest_sal
FROM employees;

SELECT employee_name,salary 
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

--Find Second highest salary
SELECT MAX(salary) AS Sec_Highest_sal
FROM employees;


SELECT MAX(salary) AS Sec_Highest_sal
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees );

--Find eighth highest salary
SELECT salary
FROM (SELECT salary,
DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk 
FROM employees) AS eighth_highest_sal
WHERE rnk=8;

SELECT * FROM employees
  SELECT * FROM customers
  SELECT * FROM products
SELECT * FROM departments
SELECT * FROM orders

--Find Customers who saled more than avg sale
SELECT AVG(amount) AS avg_sales
FROM orders;
SELECT c.customer_name, AVG(o.amount) AS avg_sales
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING AVG(o.amount) > (SELECT AVG(amount)
FROM orders);

--3 Highest spending Customers
SELECT c.customer_name, amount FROM customers c
JOIN orders o ON c.customer_id=o.customer_id ORDER BY amount DESC;

SELECT c.customer_name, SUM(O.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.customer_name
HAVING SUM(o.amount)=(SELECT MAX(total_spent)
FROM (SELECT SUM(o.amount) AS total_spent
FROM orders
GROUP BY customer_id) AS highest_Spending_cust);

--Find products whose sales is greater than avg product sales

SELECT p.product_name, SUM (o.amount) AS total_sales
FROM products p
JOIN orders o ON p.product_id=o.product_id
GROUP BY p.product_name
HAVING SUM(o.amount) > (SELECT AVG(total_sales)
FROM (SELECT SUM(amount) AS total_sales
FROM orders
GROUP BY product_id) AS total_sales);

--Find highest salary of department

SELECT d.department_name,MAX(e.salary) AS highest_salary
FROM departments d
JOIN employees e
ON d.department_id=e.department_id
GROUP BY d.department_name;

--Find employees whose salary is greater than department_avg salary

SELECT employee_name, salary
FROM employees e
WHERE salary > (SELECT AVG(e2.salary)
FROM employees e2
WHERE e2.department_id=e.department_id );
 
 --Use CTE and calculate avg salary by department

 WITH dept_salary AS(
 SELECT d.department_name, AVG(e.salary) AS avg_salary
 FROM departments d
 JOIN employees e
 ON d.department_id=e.department_id
 GROUP BY d.department_name)
 SELECT * FROM dept_salary;
 
 SELECT * FROM employees
  SELECT * FROM customers
  SELECT * FROM products
SELECT * FROM departments
SELECT * FROM orders

 --use CTE and find top 5 customers by revenue

 WITH Top_cust AS (
SELECT c.customer_name, SUM(o.amount) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name
ORDER BY revenue DESC
LIMIT 5)
SELECT * FROM Top_cust;

--use CTE , calculate monthly sales and find highest sales month

WITH monthly_sales AS (
SELECT DATE(DATE_TRUNC('Month',order_date)) AS Month,
SUM(amount) AS total_sales
FROM orders
GROUP BY DATE_TRUNC('Month',order_date)
ORDER BY total_sales DESC
) 
SELECT * FROM monthly_sales;

 -- use multiple CTEs , calculate total sales and filter high value customers

 WITH cust_total_sales AS(
SELECT c.customer_id, c.customer_name, SUM(o.amount) AS total_sales
FROM customers c
JOIN orders o 
ON c.customer_id=o.customer_id
GROUP BY c.customer_id, c.customer_name),
high_value_cust AS( 
SELECT customer_id,customer_name, total_sales ,
RANK () OVER (ORDER BY total_sales DESC) AS sales_rank
FROM cust_total_sales)
SELECT customer_id,customer_name, total_sales 
FROM high_value_cust
WHERE sales_rank< 3;

--Use CTE ,find avg salary of employees and find above avg salary employees

WITH emp AS (
SELECT AVG(salary) AS avg_salary
FROM employees)
SELECT employee_name,salary
FROM employees,emp
WHERE salary > avg_salary;

--Rank employees(Department_wise) on the babis of salary

SELECT e.employee_name , d.department_name, e.salary ,
DENSE_RANK() OVER(PARTITION BY d.department_name ORDER BY e.salary DESC) AS salary_rank
FROM employees e
JOIN departments d
ON d.department_id=e.department_id;

--Find top 3 highest paid employees of each department

 WITH ranked_emp AS(SELECT e.employee_name, d.department_name, e.salary,
DENSE_RANK() OVER (PARTITION BY d.department_name ORDER BY e.salary DESC) AS salary_rank
FROM employees e
JOIN departments d
ON e.department_id=d.department_id)
SELECT * 
FROM ranked_emp
WHERE salary_rank<=3;

--Find highest paid employee of each department

WITH paid_emp AS (SELECT e.employee_name,d.department_name,e.salary,
DENSE_RANK() OVER(PARTITION BY d.department_name ORDER BY e.salary DESC) AS highest_paid_emp
FROM employees e
JOIN departments d
ON e.department_id=d.department_id) 
SELECT * FROM paid_emp
WHERE highest_paid_emp =1;

--Find top 2 employees of each department

WITH emp AS ( SELECT e.employee_name,d.department_name,e.salary,
ROW_NUMBER() OVER(PARTITION BY d.department_name ORDER BY e.salary DESC) AS top_2_emp
FROM employees e
JOIN departments d
ON e.department_id=d.department_id)
SELECT *
FROM emp
WHERE top_2_emp <=2;

--Give numbers to orders (customer_wise) according to date
SELECT c.customer_name,o.order_id,o.order_date,
ROW_NUMBER() OVER(PARTITION BY c.customer_name ORDER BY o.order_date) AS ORDERS_NUM
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id;

--calculate running total sales

SELECT order_date,amount,SUM(amount) OVER (ORDER BY order_date) AS running_total
FROM orders;

--Find Sales of previous months using LAG

WITH mon_sale AS(SELECT DATE_TRUNC('month',order_date) AS month,
SUM(amount) AS monthly_sales
FROM orders
GROUP BY DATE_TRUNC('month',order_date) 
ORDER BY month)
SELECT month,monthly_sales,LAG(monthly_sales) OVER (ORDER BY month) AS pre_months_sales
FROM mon_sale
ORDER BY month;


--Find next month sales using LEAD

WITH mon_sale AS (SELECT DATE_TRUNC('month',order_date) AS month,
SUM(amount) AS monthly_sales
FROM orders
GROUP BY DATE_TRUNC('month',order_date)
ORDER BY month)
SELECT month,monthly_sales,LEAD(monthly_sales) OVER (ORDER BY month) AS next_month_sale
FROM mon_sale
ORDER BY month;

--Show the total salary of employees and department avg salary in the same result

SELECT employee_name, SUM(salary) OVER() AS total_salary,
AVG(salary) OVER (PARTITION BY department_id ) AS AVG_salary
FROM employees;

--Find top 10 customers by revenue

SELECT c.customer_name, SUM(o.amount) AS total_amt
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name,o.order_id
ORDER BY o.amount DESC
LIMIT 10;

--Find month to month growth

WITH mon_sales AS(SELECT DATE_TRUNC('month',order_date) AS month,
SUM(amount) AS total_sales
FROM orders
GROUP BY DATE_TRUNC('month',order_date) ORDER BY month)

SELECT month,total_sales,LAG(total_sales) OVER(ORDER BY month) AS pre_sales,
ROUND((total_sales - LAG(total_sales) OVER(ORDER BY month ))
/LAG(total_sales) OVER (ORDER BY month) * 100,
2
) AS sales_growth
FROM mon_sales
ORDER BY month;

--Find the customers who haven't placed an order in the last 6 months

SELECT c.customer_name,c.customer_id,MAX(o.order_date) AS last_order
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_id,c.customer_name
HAVING MAX(o.order_date) < CURRENT_DATE - INTERVAL '6 MONTH'
ORDER BY last_order;

 --Identify repeat customers

 SELECT c.customer_name,c.customer_id,COUNT(o.order_id) AS rep_cust
 FROM customers c
 JOIN orders o 
 ON c.customer_id=o.customer_id
 GROUP BY c.customer_name,c.customer_id
 HAVING COUNT(o.order_id) > 1;

 --Calculate total count of customers,churned customers, churn rate and revenue loss

 WITH Cust_summ AS(
 SELECT c.customer_id,c.customer_name,
 COUNT(o.order_id) AS total_orders,
 MAX(o.order_date) AS last_pur,
 SUM(o.amount) AS total_spent
 FROM customers c
 LEFT JOIN orders o
 ON c.customer_id=o.customer_id
 GROUP BY c.customer_id,c.customer_name)
 SELECT COUNT(customer_id) AS total_cus,
 SUM(CASE WHEN last_pur < CURRENT_DATE - INTERVAL '6 month' OR last_pur
 IS NULL THEN 1 ELSE 0 END) AS churned_cus,
ROUND((SUM(CASE WHEN last_pur < CURRENT_DATE - INTERVAL '6 month' OR last_pur 
 IS NULL THEN 1 ELSE 0 END) * 100.0) /COUNT (customer_id),2) AS churn_rate,
 SUM(CASE WHEN last_pur < CURRENT_DATE - INTERVAL '6 month' OR  last_pur
 IS NULL THEN total_spent ELSE 0 END) AS revenueloss
 FROM Cust_summ;

 --Find second highest salary without using limit

 SELECT employee_name, MAX (salary) AS highest_Sal
 FROM employees
 GROUP BY employee_name
 ORDER BY highest_sal DESC;
SELECT employee_name,MAX(salary) AS sec_highest_sal
FROM employees
WHERE salary< (SELECT MAX (salary) FROM employees)
GROUP BY employee_name
 ORDER BY sec_highest_sal DESC;

 --Find duplicate records in employees table

 SELECT employee_name,COUNT(*) AS dup_record
 FROM employees
 GROUP BY employee_name
 HAVING COUNT(*)> 1;

 --Remove duplicate records

WITH rem_dup AS (
SELECT ctid,
ROW_NUMBER() OVER(PARTITION bY employee_name ORDER BY (SELECT NULL)) AS row_num
FROM employees
)
DELETE FROM employees
USING rem_dup
WHERE employees.ctid=rem_dup.ctid
AND rem_dup.row_num>1;

--Find employees whose salary is same

SELECT employee_name, salary
FROM (SELECT employee_name,salary,COUNT(*) OVER (PARTITION BY salary ORDER BY salary) AS sal_count
FROM employees)sal
WHERE sal_count>1 ;

--Find customers who has mutliple orders

SELECT c.customer_name,COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 1;

--Find the highest salary of each department

SELECT d.department_name,MAX(e.salary) AS highest_sal
FROM departments d
JOIN employees e
ON e.department_id=d.department_id
GROUP BY d.department_name
ORDER BY highest_sal DESC;

--Find top 2 salaries from each department

WITH dept_sal AS(
SELECT d.department_name, e.salary,
DENSE_RANK() OVER(PARTITION BY d.department_name ORDER BY e.salary DESC) AS top_three
FROM departments d
JOIN employees e
ON d.department_id=e.department_id)
SELECT department_name,salary,top_three
FROM dept_sal
WHERE top_three <= 2;

 --Customers who ordered more than once

 SELECT c.customer_name, COUNT(o.order_id) AS order_count
 FROM customers c
 JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id)>1;

--Products that have never been ordered 

SELECT p.product_name, COUNT(o.order_id) AS order_count
FROM products p
 LEFT JOIN orders o
ON p.product_id=o.product_id
GROUP BY p.product_name
HAVING COUNT(o.order_id) <1;

SELECT * FROM employees

--Find employees whose salary is greater than manager's salary

SELECT e1.employee_name AS emp_name, e2.salary AS emp_salary
FROM employees e1
JOIN employees e2
On e1.manager_id=e2.employee_id
WHERE e1.salary> e2.salary;
 

