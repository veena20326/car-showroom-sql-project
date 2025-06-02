create database car_showroom;
use car_showroom;

#car_inventory
create table car_inventory
(
  car_id INT PRIMARY KEY,
  brand VARCHAR(50), 
  model VARCHAR(50), 
  year INT, 
  color VARCHAR(30), 
  price DECIMAL(10,2), 
  stock_quantity INT 
  );
  
  #Customer 
   CREATE TABLE Customer 
  ( 
  customer_id INT PRIMARY KEY, 
  name VARCHAR(100), 
  contact VARCHAR(15), 
  email VARCHAR(100), 
  address TEXT 
  );
  
  
  #Employees 
  CREATE TABLE Employee 
  ( 
  employee_id INT PRIMARY KEY, 
  name VARCHAR(100), 
  role VARCHAR(50), 
  contact VARCHAR(15), 
  salary DECIMAL(10,2) 
  );
  
  #Sales 
  CREATE TABLE Sales 
  ( 
  sale_id INT PRIMARY KEY, 
  car_id INT, 
  customer_id INT, 
  employee_id INT, 
  sale_date DATE, 
  payment_method VARCHAR(50), 
  amount DECIMAL(10,2),
  FOREIGN KEY (car_id) REFERENCES Car_Inventory(car_id), 
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id), 
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id) 
  );
  
  #Service_Record 
  CREATE TABLE Service_Record 
  ( 
  service_id INT PRIMARY KEY, 
  car_id INT, customer_id INT, 
  service_date DATE, 
  service_details TEXT, 
  cost DECIMAL(10,2), 
  FOREIGN KEY (car_id) REFERENCES Car_Inventory(car_id), 
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) 
  );
  
  #Car Inventory 
  INSERT INTO Car_Inventory VALUES 
  (1, 'Toyota', 'Innova', 2022, 'White', 1800000.00, 5), 
  (2, 'Hyundai', 'Creta', 2023, 'Black', 1600000.00, 3), 
  (3, 'Maruti', 'Baleno', 2021, 'Red', 950000.00, 10);
  
  #Customers 
  INSERT INTO Customer VALUES 
  (101, 'Anil Kumar', '9876543210', 'anil@example.com', 'Chennai'), 
  (102, 'Priya Sharma', '9123456780', 'priya@example.com', 'Coimbatore');
  

#Employees 
INSERT INTO Employee VALUES 
(201, 'Ravi', 'Sales Executive', '9001234567', 30000.00), 
(202, 'Meena', 'Manager', '9012345678', 45000.00);

#Sales 
INSERT INTO Sales VALUES 
(1001, 1, 101, 201, '2025-04-10', 'Credit Card', 1800000.00), 
(1002, 3, 102, 202, '2025-05-05', 'Cash', 950000.00);

#Service Records 
INSERT INTO Service_Record VALUES 
(501, 1, 101, '2025-05-01', 'Oil Change and Brake Check', 3500.00), 
(502, 3, 102, '2025-05-20', 'Full Service', 4500.00);

select * from car_inventory;
select * from customers;
select * from employee;
select * from sales;
select * from service_record;

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






  
  
  


 