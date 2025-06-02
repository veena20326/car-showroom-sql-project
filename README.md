# Car Showroom SQL Project

## 📌 Project Overview
This SQL project is designed to manage the data for a car showroom. It includes tables and operations related to:
- Car Inventory
- Customers
- Employees
- Sales Records
- Service Records

## 🧩 Technologies Used
- MySQL

## 🗃️ Database Schema
Includes the following tables:
- `car_inventory`
- `customer`
- `employee`
- `sales`
- `service_record`

## 📁 Sample Data Inserted
Each table has sample records to demonstrate:
- Car models in stock
- Customer and employee details
- Sales and service history

## queries 
#question1)  List all cars with brand, model, year, and stock quantity.
	SELECT brand, model, year, stock_quantity FROM Car_Inventory;
    
#question2) Find all sales made in May 2025.
SELECT * FROM Sales WHERE sale_date BETWEEN '2025-05-01' AND '2025-05-31';

#question3) Show customer names with the car model they purchased.
SELECT c.name AS customer_name, ci.model AS car_model FROM Sales s
JOIN Customer c ON s.customer_id = c.customer_id
JOIN Car_Inventory ci ON s.car_id = ci.car_id;

#question4) Display total sales amount handled by each employee.
SELECT e.name AS employee_name, SUM(s.amount) AS total_sales FROM Sales s
JOIN Employee e ON s.employee_id = e.employee_id
GROUP BY e.name;

#question5. List customers who have availed service and their service cost.
SELECT c.name AS customer_name, sr.service_details, sr.cost FROM Service_Record sr
JOIN Customer c ON sr.customer_id = c.customer_id;

#question6. Find the most expensive car available in stock.
SELECT * FROM Car_Inventory ORDER BY price DESC LIMIT 1;

#question7. Count how many cars of each brand are available in stock.
SELECT brand, SUM(stock_quantity) AS total_stock FROM Car_Inventory GROUP BY brand;

#question8. Update stock quantity after a sale (manual deduction for car_id = 1).
UPDATE Car_Inventory SET stock_quantity = stock_quantity - 1 WHERE car_id = 1;

#question9. Delete a service record for a specific customer (e.g., customer_id = 101).
DELETE FROM Service_Record WHERE customer_id = 101;

#question10. Get a detailed sales report with customer, car, employee, and payment details.
SELECT s.sale_id, c.name AS customer, ci.brand, ci.model, e.name AS employee,
s.sale_date, s.payment_method, s.amount FROM Sales s
JOIN Customer c ON s.customer_id = c.customer_id
JOIN Car_Inventory ci ON s.car_id = ci.car_id
JOIN Employee e ON s.employee_id = e.employee_id;


## 📂 How to Use
1. Import `car_showroom_project.sql` into your MySQL database.
2. Run the script to create and populate the database.
3. Use `SELECT` queries to explore the data.

## 🎯 Purpose
- Practice full SQL workflow: Create → Insert → Select
- Prepare for SQL-based interviews
- Showcase in portfolio/resume
