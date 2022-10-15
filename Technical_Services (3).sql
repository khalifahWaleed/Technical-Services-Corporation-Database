Create Database Technical_Services ;
use Technical_Services;


create table Customer (
	customer_id INT primary key Not NULL ,
	customer_name VARCHAR(50) NOT NULL,
	street_address VARCHAR(50)  ,
	city VARCHAR(50),
	representative_name VARCHAR(50),
	customer_phone VARCHAR(50)
 
);
create table Products (
	product_id INT primary key,
	product_name VARCHAR(50),
	stock INT,
	product_price INT,
	production_date DATE,
	established_country VARCHAR(50)
    
);
create table Department (
	dept_id INT primary key,
	dept_name VARCHAR(50),
	location VARCHAR(50)
);

create table Employees (
	employee_id INT primary key,
	Fname VARCHAR(50),
	Lname VARCHAR(50),
	Job_Title VARCHAR(50),
	Employee_Phone VARCHAR(50),
	dept_id INT,
    	supervisor_id int,
	FOREIGN KEY (dept_id) REFERENCES department(dept_id),
	FOREIGN KEY (supervisor_id) REFERENCES Employees (employee_id)
);

create table Restock (
	Employee_id INT ,
	product_id INT,
	Check_for_products VARCHAR(9),
    
    PRIMARY key (Employee_id, product_id),
    FOREIGN key (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);
create table Salary (
	salary_slip_id INT,
	Employee_id INT,
	issue_date DATE,
	Month VARCHAR(5),
	Amount INT,

	FOREIGN key (Employee_id) REFERENCES employees (employee_id)
);
create table Orders (
	Order_id INT primary key,
	product_id INT,
	customer_id INT,
	Employee_id int,
	price INT,
	quantity INT,
	date_of_order DATE,
	order_status VARCHAR(11),

	FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
create table Order_processing (
	Order_id INT,
	Employee_id INT,
	processing_time INT,
    
    PRIMARY KEY(order_id, Employee_id),
    
    FOREIGN key (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);


insert into Customer (customer_id, customer_name, street_address, city, representative_name, customer_phone) values
      (1, 'Saleh Aleid', 'Prince Mateeb street', 'alahsa', 'Saleh', '0554543523'),
      (2, 'Abdullah almoussa', 'King Abdullah street', 'Dammam', 'Abdullah', '0554543513'),
      (3, 'Ali Alessa', 'Prince Sultan street', 'Abha', 'Ali', '0504543553'),
      (4, 'Murtada Alsaleh', 'King Fisal street', 'Alqassim', 'Murtada', '0554543153'),
      (5, 'Mohammed Alahmed', 'King Abdulaziz street', 'Riyadh', 'Mohammed', '052454353'),
      (6, 'Naif ALqhatani', 'Abu bakir street', 'Diriyah', 'Naif', '0531454353'),
      (7, 'Hamad Alzwaimel', 'Albader street', 'dawadmi', 'Hamad', '0544543323'),
      (8, 'Khalid Alzamil', 'king Fahad street', 'Hofuf', 'Khaild', '0554554453'),
      (9, 'Fahad Almoale', 'king Abdullah street', 'Jhumra', 'Fahad', '0554543543'),
      (10, 'Hassan Alzaier', 'Altahlea street', 'AlUla', 'Hassan', '055411353'),
      (11, 'Hussin Almounsri', 'ALkhaldiya', 'Jhumra', 'Hussin', '0554543522'),
      (12, 'Naeem Oedah', 'ALzahra ', 'Riyadh', 'Naeem', '0554543577'),
      (13, 'Huessin Alkatoot', 'ALazizah', 'Alahsa', 'Hussin', '0554543500'),
      (14, 'Alwaleed Alzariq', 'Albndriayh street', 'Abha', 'ALwaleed', '0554543522'),
      (15, 'Othman ALomatiri', 'Alamalmeen street', 'Diriyah', 'Otman', '0554543511'),
      (16, 'Omar almousa', 'Omar khatab street', 'Makkah', 'Omar', '0554543512'),
      (17, 'Nawaf Albader', 'HAMZA street', 'Tabuk', 'Nawaf', '0554543530'),
      (18, 'Abdulalzez Albdewi', 'ALamoira Street', 'Taif', 'Abdualzez', '0554543531'),
      (19, 'Imam Abdualrahman university', 'ALRakah', 'Dammam', 'Hammad', '0135882323'),
      (20, 'King Saud University', 'Bakeryah street', 'Riyadh', 'Saleh', '0135882311');


insert into Products (product_id, product_name, stock, product_price, production_date, established_country) values
(1, 'network switch', 54, 288, '2021-09-18', 'Japan'),
 (2, 'Router 3.0', 72, 301, '2022-03-30', 'China'),
 (3, 'SATA HDD 500', 780, 47, '2021-11-20', 'Russia'),
  (4, 'SSD 512 Sanddisk', 550, 22, '2022-02-08', 'China'),
 (5, 'Projector F121', 82, 290, '2021-12-19', 'Poland'),
 (6, 'Touchpad 432', 87, 200, '2022-03-06', 'Barbados'),
 (7, 'gaming keyboard', 84, 500, '2021-06-14', 'France'),
 (8, 'DG Scanner 3.0', 66, 390, '2021-05-29', 'Indonesia'),
 (9, 'Inkjet Printer Alpha', 71, 360, '2021-11-11', 'Russia'),
(10, 'Webcam 3.0', 66, 440, '2021-07-07', 'Russia'),
   (11, 'Network Interface Card', 60, 37, '2021-10-10', 'China'),
  (12, 'Wireless Repeater', 93, 340, '2021-09-22', 'Indonesia'),
 (13, 'Bunch router', 77, 260, '2021-10-23', 'Philippines'),
  (14, 'Specialized camera', 56, 31, '2021-09-29', 'Kenya'),
 (15, 'Light Pen', 85, 310, '2022-03-05', 'Czech Republic'),
 (16, 'Arduino 564', 71, 470, '2021-11-04', 'China'),
 (17, 'Enterprise Windows', 670, 20, '2022-02-15', 'Poland'),
(18, 'Office Products', 80, 460, '2021-11-02', 'United States'),
(19, 'iGraphics tool', 57, 370, '2022-04-10', 'United States'),
 (20, 'SharpCode tool', 56, 380, '2022-03-02', 'Czech Republic');



insert into Department (dept_id, dept_name, location) values
 (1, 'Business Development', 'ALkobar'),
 (2, 'Legal', 'ALHasa'),
 (3, 'Human Resources', 'ALkobar'),
 (4, 'Accounting', 'ALkobar'),
 (5, 'Research and Development', 'ALkobar'),
 (6, 'Human Resources', 'ALkobar'),
 (7, 'Human Resources', 'ALkobar'),
 (8, 'Engineering', 'ALkobar'),
 (9, 'Business Development', 'ALHasa'),
 (10, 'Services', 'ALHasa');



insert into Employees (employee_id, Fname, Lname, Job_Title, Employee_Phone, dept_id, supervisor_id) values
 (1, 'Khalifah', 'Alzwaimel', 'Senior Financial Analyst', '0550459053', 2, null),
 (2, 'Yahya', 'ALhabboub', 'Compensation Analyst', '0550459022', 9, 1),
 (3, 'Adam', 'Almednai', 'Financial Advisor', '0550459011', 9, 2),
 (4, 'Turki', 'Alabjii', 'VP Product Management', '0550459012', 10,1),
 (5, 'Muhnnad', 'AlQhatani', 'Practicioner', '0550459021', 5,3),
 (6, 'Ibrahim', 'Alqossabi', 'Automation Specialist I', '0550459099', 1,4),
 (7, 'Hussain', 'Al	Usman', 'Technical Writer', '0550459012', 5,2),
 (8, 'Sabar', 'AlAhmad', 'Financial Analyst', '0550459022', 4,5),
 (9, 'Nawaf', 'AlUmer', 'manager', '0550459011', 5, 7),
 (10, 'Khalid', 'Aleid', 'Product Engineer', '0550459044', 7,3);



insert into Restock (Employee_id, product_id, Check_for_products) values 
 (5, 9, 'required'),
 (4, 20, 'in stock'),
 (10, 10, 'required'),
 (5, 12, 'in stock'),
 (5, 15, 'required'),
 (5, 13, 'empty'),
 (1, 18, 'empty'),
 (7, 19, 'in stock'),
 (8, 8, 'required'),
 (4, 2, 'Available'),
 (6, 4, 'required'),
 (2, 7, 'Available'),
 (5, 7, 'empty'),
 (2, 19, 'required'),
 (10, 3, 'Available'),
 (6, 16, 'in stock'),
 (1, 13, 'OK'),
 (7, 5, 'OK'),
 (8, 4, 'in stock'),
 (6, 10, 'empty');


insert into Salary (salary_slip_id, Employee_id, issue_date, Month, Amount) values
 (1, 1, '2021-11-16', 'feb', 28006),
(2, 2, '2021-07-12', 'april', 35600),
(3, 3, '2022-02-02', 'jan', 19500),
(4, 4, '2021-10-17', 'march', 17200),
(5, 5, '2022-01-11', 'feb', 26008),
(6, 6, '2021-04-29', 'jan', 24002),
(7, 7, '2022-02-05', 'jan', 24900),
(8, 8, '2021-06-28', 'july', 13000),
(9, 9, '2021-07-07', 'feb', 32300);


insert into Orders (Order_id, product_id, customer_id, Employee_id, price, quantity, date_of_order, order_status) values
 (3, 1, 9, null , 3400, 163, '2022-04-03', 'In progress'),
(4, 9, 11, 6, 48, 900, '2022-03-28', 'Pending'),
(5, 1, 19, 3, 45, 882, '2022-04-09', 'Pending'),
(6, 15, 18, null, 822, 306, '2022-04-08', 'Pending'),
(7, 12, 14, 3, 23, 774, '2022-03-14', 'Pending'),
(8, 2, 19, 7, 22, 932, '2022-03-22', 'Waiting'),
(9, 10, 11, 4, 34, 836, '2022-03-29', 'Completed'),
(10, 3, 17, 1, 23, 873, '2022-04-04', 'In progress'),
(11, 8, 6, 3, 24, 991, '2022-04-08', 'In progress'),
(12, 5, 12, 2, 27, 790, '2022-04-01', 'Waiting'),
(13, 7, 14, 8, 40, 803, '2022-04-10', 'Completed'),
(14, 11, 15, 3, 16, 994, '2022-04-01', 'Pending'),
(15, 18, 3, 4, 20, 761, '2022-03-21', 'Pending'),
(16, 8, 12, 9, 23, 809, '2022-04-10', 'Completed'),
(17, 10, 14, 5, 45, 717, '2022-04-07', 'In progress'),
(18, 9, 12, 2, 26, 443, '2022-03-17', 'Completed'),
(19, 4, 3, 3, 23, 446, '2022-04-10', 'Waiting'),
(20, 18, 15, 4, 15, 826, '2022-03-19', 'In progress');


insert into Order_processing (Order_id, Employee_id, processing_time) values
(14, 10, 1),
 (12, 6, 7),
 (13, 1, 1),
 (3, 9, 3),
 (15, 1, 5),
 (4, 7, 6),
 (12, 3, 5),
 (4, 2, 6),
 (7, 7, 4),
 (3, 1, 6);

 SELECT SUM(processing_time)
FROM Order_processing;
 
 SELECT MIN(processing_time)
FROM Order_processing;

SELECT MAX(processing_time)
FROM Order_processing;

SELECT AVG(processing_time)
FROM Order_processing;



DELIMITER 

CREATE PROCEDURE GetAllProducts()
BEGIN
	SELECT * FROM Products
END 

DELIMITER ;




CALL GetAllProducts();


#creating Admin user
---------------------

CREATE USER 'Admin'@'localhost' IDENTIFIED BY 'password';


#grant permission


GRANT ALL PRIVILEGES ON Technical_Services  TO 'Admin'@'localhost' WITH GRANT OPTION;

---------------------
#Creating Users:
---------------------

CREATE USER 'Users'@'localhost' IDENTIFIED BY 'password';

---------------------
#grant permission:
---------------------

GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on Technical_Services TO 'Users'@'localhost' WITH GRANT OPTION;

---------------------
#Show all users:
---------------------

Select user from mysql.user;  

---------------------
#Views:
---------------------

#create a view to show all employees with their departments.

---------------------
#SQL:
---------------------

create view employee_dept AS select e.*, d.dept_name, d.location from employees e inner join department d on e.dept_id = d.dept_id;


--------------------------
#TRIGGER ON Employee Update
--------------------------

CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    lname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
 INSERT INTO employees_audit
 SET action = 'update',
     employee_id = OLD.employee_id,
     lname = OLD.lname,
     changedat = NOW();

----------------
#Trigger Testing
----------------

UPDATE employees 
SET 
    lName = 'Phan'
WHERE
    employee_id = 3;


SELECT * FROM employees_audit;

#-----------------------
#Create Database Backup
#-----------------------


 #mysqldump -u root -p --database database >'C:\MySQLBackup\database.sql'

#-----------------------
#Database Restore
#-----------------------

#mysql -u root -p database < C:\MySQLBackup\database.sql



ALTER table customer
ADD CHECK ( Gender IN ('M', 'F') );
ALTER table Customer
DROP COLUMN Gender;

 #Queries:
 #1 Show All Employees whose job title is technical writer and Financial Analyst.

 select * From Employees
WHERE Job_Title IN ( 'Technical Writer', 'Financial Analyst');
#2 Show all employees whose salary between 10000-25000
SELECT * from employees inner join salary on employees.employee_id = 
salary.Employee_id where amount BETWEEN 10000 AND 25000;
#3 Show all customer with union and city of jhumra.

select * from customer UNION SELECT * from customer where city = 'Jhumra';
#4 Show average salary of all employees
Select AVG(amount) As Average_salary from salary;
#5 Show the top 3 employees taking maximum salary.
SELECT employees.*, Amount from employees inner join salary on 
employees.employee_id = salary.Employee_id 
ORDER BY Amount desc limit 3;
#6 Show all orders with missing order date of pending orders.
SELECT * FROM `Orders` WHERE date_of_order IS NOT NULL and order_status = 
'Pending';
#7 What is the average product price of Russia.
Select AVG(product_price) FROM products where established_country = ‘Russia’;
#8 show the total bill for each customer including customer name and details.
SELECT customer.customer_id, customer_name, price*quantity total from customer 
inner join orders on orders.customer_id = customer.customer_id
order by total desc;

#9 Show Employees where they work in a Department. Using INTERSECT;
SELECT Fname
FROM Employees
INTERSECT;
SELECT dept_name
FROM Department;
#10 Show the total salary for each department having working employees with total amount above 20000.
SELECT e.dept_id, dept_name, SUM(amount) as total_amount FROM employees e 
inner join department d on e.dept_id = d.dept_id
inner join salary s on s.Employee_id = e.employee_id
group by e.dept_id, dept_name
having total_amount > 20000;
#11 Show the customers whose name start with k and A
SELECT * FROM `customer` WHERE `customer_name` LIKE 'K%' OR 
`customer_name` LIKE 'A%';
#12 Show all information of customer with their orders.
SELECT * FROM `orders` inner join customer on orders.customer_id = 
customer.customer_id;
#13 Update all the prices of product to 10 dollar extra
UPDATE products set `product_price` = `product_price` +10 where `product_name` 
LIKE 'C%';
#14 Delete all customers with no orders
delete from customer where 'customer_id' NOT IN (
SELECT 'customer_id' from orders
);
#15 list of employees and their supervisor
SELECT a.employee_id AS "Emp_ID",a.Fname AS "Employee Name",
b.employee_id AS "Supervisor ID",b.Fname AS "Supervisor Name"
FROM employees a, employees b
WHERE a.supervisor_id = b.employee_id;
#16 Show SUM salary of all employees
SELECT SUM(Amount)
From Salary;
#17 show the status of prdouct
SELECT Products.product_name,Restock.Check_for_products
From Restock
CROSS JOIN Products;
#18 create a view to show all employees with their departments
create view employee_dept AS select e.*, d.dept_name, d.location from employees e 
inner join department d on e.dept_id = d.dept_id;

