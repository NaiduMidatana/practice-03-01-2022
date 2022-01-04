use naidudb;

-- exercise -1
CREATE TABLE employees ( employee_number int NOT NULL, 
                         last_name char(50) NOT NULL,
                         first_name char(50) NOT NULL,
                         salary int, dept_id int,
                         CONSTRAINT employees_pk PRIMARY KEY (employee_number) ); 
                         
INSERT INTO employees (employee_number, last_name, first_name, salary, dept_id) VALUES (1001, 'Smith', 'John', 62000, 500),
																						(1002, 'Anderson', 'Jane', 57500, 500),
																						(1003, 'Everest', 'Brad', 71000, 501),
																						(1004, 'Horvath', 'Jack', 42000, 501);
-- selecting employees whose salary is lessthan or equal to 55000												
select * from employees where salary <= '55000';

-- exercise -2
CREATE TABLE suppliers ( supplier_id int NOT NULL, 
                         supplier_name char(50) NOT NULL, 
                         city char(50), state char(25), 
                         CONSTRAINT suppliers_pk PRIMARY KEY (supplier_id) );
	
INSERT INTO suppliers (supplier_id, supplier_name, city, state) VALUES (100, 'Microsoft', 'Redmond', 'Washington'),
																		(200, 'Google', 'Mountain View', 'California'),
                                                                        (300, 'Oracle', 'Redwood City', 'California'),
                                                                        (400, 'Kimberly-Clark', 'Irving', 'Texas'),
                                                                        (500, 'Tyson Foods', 'Springdale', 'Arkansas'),
                                                                        (600, 'SC Johnson', 'Racine', 'Wisconsin'),
                                                                        (700, 'Dole Food Company', 'Westlake Village', 'California'),
                                                                        (800, 'Flowers Foods', 'Thomasville', 'Georgia'),
                                                                        (900, 'Electronic Arts', 'Redwood City', 'California');
select * from suppliers;
-- for selecting  unique city values
select city from suppliers  where state = 'california' ;
-- for ordering the results in descending order
select distinct city from suppliers  where state = 'california' order by city desc ;

-- exercise -3
CREATE TABLE customers ( customer_id int NOT NULL, 
						last_name char(50) NOT NULL,
                        first_name char(50) NOT NULL, 
                        favorite_website char(50), 
                        CONSTRAINT customers_pk PRIMARY KEY (customer_id) );
CREATE TABLE orders ( order_id int NOT NULL, 
					customer_id int, 
                    order_date date, 
                    CONSTRAINT orders_pk PRIMARY KEY (order_id) );
                    
INSERT INTO customers (customer_id, last_name, first_name, favorite_website)
				 VALUES (4000, 'Jackson', 'Joe', 'techonthenet.com'),
                        (5000, 'Smith', 'Jane', 'digminecraft.com'),
                        (6000, 'Ferguson', 'Samantha', 'bigactivities.com'),
                        (7000, 'Reynolds', 'Allen', 'checkyourmath.com'),
                        (8000, 'Anderson', 'Paige', NULL),
                        (9000, 'Johnson', 'Derek', 'techonthenet.com');
                        
INSERT INTO orders (order_id, customer_id, order_date) 
				VALUES (1,7000,'2016/04/18'),
					   (2,5000,'2016/04/18'),
                       (3,8000,'2016/04/19'),
                       (4,4000,'2016/04/20'),
                       (5,null,'2016/05/01');
                       
-- joining and ordering
select 
    c.customer_id, c.last_name as customer , o.order_id as ord
    from 
    customers c inner join orders o on c.customer_id = o.customer_id order by customer_id desc;

-- exercise - 4


SELECT customer_id, last_name
FROM customers
WHERE EXISTS
  ( SELECT orders.customer_id
    FROM orders
    WHERE orders.customer_id = customers.customer_id )
ORDER BY last_name ASC, customer_id DESC;