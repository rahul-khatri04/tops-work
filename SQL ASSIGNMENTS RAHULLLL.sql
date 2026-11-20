
CREATE DATABASE kirana_store_db;

USE kirana_store_db;


session-2 SELECT STATEMENT

-- Products Table
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price_inr DECIMAL(10,2),
    stock_qty INT
);

-- Sales Table
CREATE TABLE sales (
    sale_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO products VALUES
(1, 'Rice', 'Grains', 60, 100),
(2, 'Wheat', 'Grains', 45, 80),
(3, 'Sugar', 'Grocery', 50, 120),
(4, 'Salt', 'Grocery', 20, 150),
(5, 'Milk', 'Dairy', 30, 60),
(6, 'Butter', 'Dairy', 55, 40),
(7, 'Tea', 'Beverages', 120, 50),
(8, 'Coffee', 'Beverages', 200, 30),
(9, 'Soap', 'Personal Care', 35, 90),
(10, 'Shampoo', 'Personal Care', 150, 25),
(11, 'Oil', 'Cooking', 140, 70),
(12, 'Biscuits', 'Snacks', 25, 110);

INSERT INTO sales VALUES
(101, 1, 2, 120, '2026-11-01'),
(102, 2, 3, 135, '2026-11-02'),
(103, 3, 5, 250, '2026-11-03'),
(104, 4, 4, 80, '2026-11-04'),
(105, 5, 2, 60, '2026-11-05'),
(106, 6, 1, 55, '2026-11-06'),
(107, 7, 2, 240, '2026-11-07'),
(108, 8, 1, 200, '2026-11-08'),
(109, 9, 3, 105, '2026-11-09'),
(110, 10, 2, 300, '2026-11-10'),
(111, 11, 2, 280, '2026-11-11'),
(112, 12, 5, 125, '2026-11-12'),
(113, 1, 1, 60, '2026-11-13'),
(114, 3, 2, 100, '2026-11-14'),
(115, 7, 1, 120, '2026-11-15');


-- Q1: Display product name, category and price with renamed columns
SELECT
    product_name AS Item,
    category AS Section,
    unit_price_inr AS `Price (Rs)`
FROM products;

-- Q2: Calculate stock value and price after 5% hike
SELECT
    product_name,
    unit_price_inr * stock_qty AS stock_value_inr,
    unit_price_inr * 1.05 AS price_after_5pct_hike
FROM products;

-- Q3: Display all sales records
SELECT * FROM sales;

session-3   WHERE CLAUSE AND OPERATORS


1.
<p>Write a restock alert in `kirana_where.sql` that returns product_name, category and stock_qty from `products` for items with stock_qty below 20, and a second query returning products priced at or above 150 using `>=`. Both queries must return at least 3 rows. Hint: Run `USE kirana_store_db;` at the top of the file.</p>

-- Q1: Find products with stock below 20 and price at least 150
SELECT product_name, category, stock_qty
FROM products
WHERE stock_qty < 20;

SELECT product_name, category, unit_price_inr
FROM products
WHERE unit_price_inr >= 150;

2.
<p>Write a Diwali-offer query on `products` that returns items in the Snacks category or the Oils category, but only when unit_price_inr is at most 200. Use parentheses so the category check is evaluated as one group, then run it without the parentheses and keep both versions in `kirana_where.sql` with the row count of each as a comment. Hint: AND is evaluated before OR.</p>

-- Q2: Find Snacks and Oils products priced at 200 or less

SELECT *
FROM products
WHERE (category = 'Snacks' OR category = 'Oils')
AND unit_price_inr <= 200;


SELECT *
FROM products
WHERE category = 'Snacks'
OR category = 'Oils'
AND unit_price_inr <= 200;

3.
<p>Finish `kirana_where.sql` with a query on `sales` that returns rows where sale_date is not 2026-10-02 and quantity is not 1, written once with NOT and once with `<>`. Both versions must return the same rows, which you confirm by comparing counts. Run the full file top to bottom and submit it.</p>


-- Q3: Find sales excluding date 2026-10-02 and quantity 1
SELECT *
FROM sales
WHERE NOT (sale_date = '2026-10-02')
AND NOT (quantity = 1);

SELECT *
FROM sales
WHERE sale_date <> '2026-10-02'
AND quantity <> 1;

session-4    WILDCARDS AND PATTERN MATCHING

q-1 1.
<p>Create a database `coaching_class_db` and a table `class_marks` (mark_id INT primary key, student_name, batch, subject, marks_out_of_100 INT, attendance_pct INT, exam_date DATE) in `coaching_setup.sql`. Insert 30 rows for 10 fictional students, each with Maths, Science and English papers, 3 or 4 students per batch (Morning, Evening, Weekend), marks from 28 to 98, attendance from 55 to 98, exam_date between 2026-08-01 and 2026-10-31, at least 3 names starting with A and at least 3 students averaging above 70. Hint: Use one multi-row INSERT.</p>

CREATE TABLE class_marks (
    mark_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    batch VARCHAR(20),
    subject VARCHAR(30),
    marks_out_of_100 INT,
    attendance_pct INT,
    exam_date DATE
);

INSERT INTO class_marks VALUES
(1,'Aarav','Morning','Maths',85,92,'2026-09-05'),
(2,'Aarav','Morning','Science',78,92,'2026-09-10'),
(3,'Aarav','Morning','English',82,92,'2026-09-15'),
(4,'Aashi','Evening','Maths',90,95,'2026-09-05'),
(5,'Aashi','Evening','Science',88,95,'2026-09-10'),
(6,'Aashi','Evening','English',92,95,'2026-09-15'),
(7,'Ansh','Weekend','Maths',75,85,'2026-09-05'),
(8,'Ansh','Weekend','Science',80,85,'2026-09-10'),
(9,'Ansh','Weekend','English',72,85,'2026-09-15'),
(10,'Rahul','Morning','Maths',65,78,'2026-09-05'),
(11,'Rahul','Morning','Science',70,78,'2026-09-10'),
(12,'Rahul','Morning','English',68,78,'2026-09-15'),
(13,'Rohan','Evening','Maths',55,65,'2026-08-12'),
(14,'Rohan','Evening','Science',62,65,'2026-08-18'),
(15,'Rohan','Evening','English',58,65,'2026-08-25'),
(16,'Priya','Weekend','Maths',95,98,'2026-10-05'),
(17,'Priya','Weekend','Science',92,98,'2026-10-12'),
(18,'Priya','Weekend','English',98,98,'2026-10-20'),
(19,'Karan','Morning','Maths',45,60,'2026-08-10'),
(20,'Karan','Morning','Science',52,60,'2026-08-15'),
(21,'Karan','Morning','English',48,60,'2026-08-22'),
(22,'Nisha','Evening','Maths',82,90,'2026-09-08'),
(23,'Nisha','Evening','Science',76,90,'2026-09-16'),
(24,'Nisha','Evening','English',85,90,'2026-09-24'),
(25,'Vishal','Weekend','Maths',35,55,'2026-10-05'),
(26,'Vishal','Weekend','Science',42,55,'2026-10-15'),
(27,'Vishal','Weekend','English',38,55,'2026-10-25'),
(28,'Mehul','Morning','Maths',72,80,'2026-09-12'),
(29,'Mehul','Morning','Science',68,80,'2026-09-19'),
(30,'Mehul','Morning','English',75,80,'2026-09-26');

SELECT * FROM class_marks;

2
<p>Write a name-search query in `coaching_patterns.sql` that returns student_name, subject and marks_out_of_100 for students whose name starts with 'A' or contains 'sh' anywhere, using LIKE with `%`. Then add a second query using `_` to match names with exactly five letters. Each query must return at least one row.</p>

-- Names starting with A or containing sh
SELECT student_name, subject, marks_out_of_100
FROM class_marks
WHERE student_name LIKE 'A%'
OR student_name LIKE '%sh%';

-- Names containing exactly five letters
SELECT DISTINCT student_name
FROM class_marks
WHERE student_name LIKE '_____';

3
<p>Write a name-search query in `coaching_patterns.sql` that returns student_name, subject and marks_out_of_100 for students whose name starts with 'A' or contains 'sh' anywhere, using LIKE with `%`. Then add a second query using `_` to match names with exactly five letters. Each query must return at least one row.</p>

SELECT mark_id, student_name, marks_out_of_100
FROM class_marks
WHERE marks_out_of_100 BETWEEN 60 AND 80
AND exam_date BETWEEN '2026-09-01' AND '2026-09-30';

4.
<p>Finish `coaching_patterns.sql` with a scholarship shortlist query that returns papers where subject IN ('Maths', 'Science'), batch IN ('Morning', 'Weekend') and marks_out_of_100 is at least 75. Run the whole file and make sure every query returns rows. Constraint: Do not use OR to match the multiple values.</p>

SELECT *
FROM class_marks
WHERE subject IN ('Maths', 'Science')
AND batch IN ('Morning', 'Weekend')
AND marks_out_of_100 >= 75;



session-5   DISTINCT ,ORDER BY

1.
<p>Open `coaching_class_db` and write a query in `coaching_sorting.sql` that uses DISTINCT to list the unique student_name values (expect 10 rows), and a second query that lists the unique batch and subject pairs (expect 9 rows). Hint: `DISTINCT` applies to the whole column list, not only the first column.</p>

-- Unique student names (10 rows)
SELECT DISTINCT student_name
FROM class_marks;

-- Unique batch and subject combinations (9 rows)
SELECT DISTINCT batch, subject
FROM class_marks;

2.
<p>Write a leaderboard query on `class_marks` returning student_name, subject and marks_out_of_100 sorted by marks_out_of_100 in descending order, then by student_name in ascending order for ties. Add it to `coaching_sorting.sql` and check that the first row holds the highest mark in the table.</p>

SELECT student_name, subject, marks_out_of_100
FROM class_marks
ORDER BY marks_out_of_100 DESC, student_name ASC;

3.
<p>Write a query that shows the top 5 Maths papers by marks_out_of_100 using WHERE, ORDER BY and LIMIT 5, and add it to `coaching_sorting.sql`. The result must have exactly 5 rows with marks in descending order. Constraint: Do not use any aggregate function, because it is taught in the next session.</p>

SELECT student_name, subject, marks_out_of_100
FROM class_marks
WHERE subject = 'Maths'
ORDER BY marks_out_of_100 DESC
LIMIT 5;

4.
<p>Finish `coaching_sorting.sql` with a query returning page 2 of the full leaderboard (rows 6 to 10) using `LIMIT 5 OFFSET 5`, plus the 3 lowest attendance_pct papers using ORDER BY and LIMIT 3. Run the complete file and check page 2 against the first leaderboard query by eye.</p>

SELECT student_name, subject, marks_out_of_100
FROM class_marks
ORDER BY marks_out_of_100 DESC, student_name ASC
LIMIT 5 OFFSET 5;

-- 3 lowest attendance papers
SELECT student_name, subject, attendance_pct
FROM class_marks
ORDER BY attendance_pct ASC
LIMIT 3;



session-6   AGGEREGREATE FUNCTIONS

1.
<p>Write a single query in `coaching_aggregates.sql` on `class_marks` that returns total_papers (COUNT), total_marks (SUM), avg_marks (AVG rounded to 2 decimals with ROUND), lowest_mark (MIN) and highest_mark (MAX). The result must be one row with 5 columns and total_papers must equal 30.</p>

SELECT
    COUNT(*) AS total_papers,
    SUM(marks_out_of_100) AS total_marks,
    ROUND(AVG(marks_out_of_100), 2) AS avg_marks,
    MIN(marks_out_of_100) AS lowest_mark,
    MAX(marks_out_of_100) AS highest_mark
FROM class_marks;

2.
<p>Write a query for the Evening batch only that returns the lowest, highest and average attendance_pct (average rounded to 1 decimal), and a second query that counts how many papers in the whole table scored below 35. Use WHERE with aggregate functions and add both to `coaching_aggregates.sql`. Hint: `COUNT(*)` counts rows after WHERE has filtered them.</p>

SELECT
    MIN(attendance_pct) AS lowest_attendance,
    MAX(attendance_pct) AS highest_attendance,
    ROUND(AVG(attendance_pct), 1) AS average_attendance
FROM class_marks
WHERE batch = 'Evening';

-- Count papers scoring below 35
SELECT COUNT(*) AS papers_below_35
FROM class_marks
WHERE marks_out_of_100 < 35;


3.
<p>Finish `coaching_aggregates.sql` with a query returning `distinction_pct`, the percentage of papers with marks of 75 or more, rounded to 2 decimals. Then copy the table into Excel and cross-check all your results with SUM, AVERAGE and COUNTIF. Hint: `ROUND(AVG(marks_out_of_100 >= 75) * 100, 2)` works because a true condition counts as 1.</p>

SELECT
    ROUND(AVG(marks_out_of_100 >= 75) * 100, 2)
    AS distinction_pct
FROM class_marks;


session-7   GROUP BY AND HAVING

1.
<p>Write a query in `coaching_groupby.sql` that groups `class_marks` by batch and returns batch, papers (COUNT), avg_marks (rounded to 1 decimal) and best_mark (MAX), sorted by avg_marks from highest to lowest. The result must have exactly 3 rows. Hint: Every non-aggregated column in SELECT must appear in GROUP BY.</p>

SELECT
    batch,
    COUNT(*) AS papers,
    ROUND(AVG(marks_out_of_100), 1) AS avg_marks,
    MAX(marks_out_of_100) AS best_mark
FROM class_marks
GROUP BY batch
ORDER BY avg_marks DESC;


2.
<p>Write a query that groups by subject and batch and keeps only the groups with avg_marks of at least 60 and at least 3 papers, using HAVING. Add it to `coaching_groupby.sql` and add a comment with the number of groups that HAVING removed compared with the unfiltered version.</p>


SELECT
    subject,
    batch,
    COUNT(*) AS papers,
    ROUND(AVG(marks_out_of_100), 1) AS avg_marks
FROM class_marks
GROUP BY subject, batch
HAVING AVG(marks_out_of_100) >= 60
AND COUNT(*) >= 3;


3.
<p>Write a query on papers taken on or after '2026-09-01' that groups by batch and keeps batches with avg_attendance above 70. Use WHERE for the date and HAVING for the average in the same query. Add it to `coaching_groupby.sql`. Constraint: Do not put an aggregate function inside WHERE.</p>


SELECT
    batch,
    ROUND(AVG(attendance_pct), 1) AS avg_attendance
FROM class_marks
WHERE exam_date >= '2026-09-01'
GROUP BY batch
HAVING AVG(attendance_pct) > 70;


4.
<p>Finish `coaching_groupby.sql` with a toppers query that groups by student_name and returns papers, avg_marks and best_mark for students whose avg_marks is at least 70, sorted by avg_marks descending with LIMIT 5. Run the whole file and confirm at least 3 students appear.</p>


SELECT
    student_name,
    COUNT(*) AS papers,
    ROUND(AVG(marks_out_of_100), 1) AS avg_marks,
    MAX(marks_out_of_100) AS best_mark
FROM class_marks
GROUP BY student_name
HAVING AVG(marks_out_of_100) >= 70
ORDER BY avg_marks DESC
LIMIT 5;




session-8   JOINS INNER LEFT RIGHT
1.
<p>Create a database `tiffin_service_db` with tables `customers` (customer_id primary key, customer_name, area, plan_type) and `orders` (order_id primary key, customer_id foreign key to customers, order_date, meal_type, amount_inr) in `tiffin_joins.sql`. Insert 8 fictional customers and 20 orders placed by only 6 of them, with amounts from 60 to 180. Hint: Create `customers` first and use `FOREIGN KEY (customer_id) REFERENCES customers(customer_id)`.</p>


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    area VARCHAR(50),
    plan_type VARCHAR(30)
);

-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    meal_type VARCHAR(30),
    amount_inr INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert 8 customers
INSERT INTO customers VALUES
(1, 'Rahul', 'Maninagar', 'Monthly'),
(2, 'Amit', 'Satellite', 'Weekly'),
(3, 'Priya', 'Bopal', 'Monthly'),
(4, 'Neha', 'Vastrapur', 'Weekly'),
(5, 'Karan', 'Navrangpura', 'Monthly'),
(6, 'Pooja', 'Chandkheda', 'Daily'),
(7, 'Rohan', 'Nikol', 'Monthly'),
(8, 'Mehul', 'Gota', 'Weekly');

-- Insert 20 orders by only 6 customers
INSERT INTO orders VALUES
(101, 1, '2026-11-01', 'Lunch', 100),
(102, 1, '2026-11-02', 'Dinner', 120),
(103, 1, '2026-11-03', 'Lunch', 110),
(104, 2, '2026-11-01', 'Dinner', 150),
(105, 2, '2026-11-02', 'Lunch', 100),
(106, 2, '2026-11-03', 'Dinner', 130),
(107, 3, '2026-11-01', 'Lunch', 90),
(108, 3, '2026-11-02', 'Dinner', 140),
(109, 3, '2026-11-03', 'Lunch', 100),
(110, 4, '2026-11-01', 'Dinner', 160),
(111, 4, '2026-11-02', 'Lunch', 120),
(112, 4, '2026-11-03', 'Dinner', 180),
(113, 5, '2026-11-01', 'Lunch', 80),
(114, 5, '2026-11-02', 'Dinner', 150),
(115, 5, '2026-11-03', 'Lunch', 100),
(116, 6, '2026-11-01', 'Dinner', 130),
(117, 6, '2026-11-02', 'Lunch', 90),
(118, 6, '2026-11-03', 'Dinner', 120),
(119, 1, '2026-11-04', 'Lunch', 110),
(120, 3, '2026-11-04', 'Dinner', 160);

SELECT * FROM customers;
SELECT * FROM orders;


2.
<p>Write an INNER JOIN in `tiffin_joins.sql` that returns customer_name, area, order_date, meal_type and amount_inr for every order, joined on customer_id with table aliases `c` and `o`. The result must have exactly 20 rows and no customer who has no orders.</p>

SELECT
    c.customer_name,
    c.area,
    o.order_date,
    o.meal_type,
    o.amount_inr
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id;

3.
<p>Write a LEFT JOIN from `customers` to `orders` that returns the customers who have never placed an order, with their customer_name and area. The result must have exactly 2 rows. Add it to `tiffin_joins.sql`. Hint: Unmatched rows have NULL on the right side, so filter with `WHERE o.order_id IS NULL`.</p>

SELECT
    c.customer_name,
    c.area
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

4.
<p>Finish `tiffin_joins.sql` by writing the same never-ordered customers query using RIGHT JOIN, with `orders` on the left and `customers` on the right. Run the whole file and check both queries return the same 2 customers.</p>

SELECT
    c.customer_name,
    c.area
FROM orders AS o
RIGHT JOIN customers AS c
ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;

session-9   ADVANCE JOINS SELF CROSS FULL JOINS
1.
<p>In `tiffin_service_db`, create `delivery_partners` (partner_id primary key, partner_name, manager_id) with 8 fictional partners, 2 of them having no manager, and write a SELF JOIN with LEFT JOIN that returns each partner_name with their manager's name as `manager_name`. Save it as `tiffin_advanced_joins.sql`. The result must have 8 rows, with NULL for the 2 top managers.</p>


CREATE TABLE delivery_partners (
    partner_id INT PRIMARY KEY,
    partner_name VARCHAR(100),
    manager_id INT
);

INSERT INTO delivery_partners VALUES
(1, 'Rajesh', NULL),
(2, 'Amit', NULL),
(3, 'Karan', 1),
(4, 'Rahul', 1),
(5, 'Vishal', 2),
(6, 'Mehul', 2),
(7, 'Rohan', 1),
(8, 'Jay', 2);

SELECT
    p.partner_name,
    m.partner_name AS manager_name
FROM delivery_partners AS p
LEFT JOIN delivery_partners AS m
ON p.manager_id = m.partner_id;

2.
<p>Create tables `meal_types` (Veg, Jain, Diet) and `delivery_slots` (Lunch, Dinner) and write a CROSS JOIN that returns every meal type with every slot as a 6-row menu grid. Add it to `tiffin_advanced_joins.sql`. Constraint: Do not write any ON condition.</p>

CREATE TABLE meal_types (
    meal_id INT PRIMARY KEY,
    meal_name VARCHAR(50)
);

CREATE TABLE delivery_slots (
    slot_id INT PRIMARY KEY,
    slot_name VARCHAR(50)
);

INSERT INTO meal_types VALUES
(1, 'Veg'),
(2, 'Jain'),
(3, 'Diet');

INSERT INTO delivery_slots VALUES
(1, 'Lunch'),
(2, 'Dinner');

SELECT
    m.meal_name,
    d.slot_name
FROM meal_types AS m
CROSS JOIN delivery_slots AS d;

3.
<p>Create `customer_feedback` (feedback_id, customer_id with no foreign key, rating 1 to 5) with 8 rows, of which 2 use a customer_id missing from `customers`. Write two queries, a LEFT JOIN and a RIGHT JOIN, that together list every unmatched row from both sides, which is what FULL OUTER JOIN would return. Add them to `tiffin_advanced_joins.sql`. Constraint: Do not use UNION yet.</p>

CREATE TABLE customer_feedback (
    feedback_id INT PRIMARY KEY,
    customer_id INT,
    rating INT
);

INSERT INTO customer_feedback VALUES
(1, 1, 5),
(2, 2, 4),
(3, 3, 5),
(4, 4, 3),
(5, 5, 4),
(6, 6, 5),
(7, 99, 2),
(8, 100, 1);
-- LEFT JOIN: Find feedback without matching customers
SELECT
    c.customer_id,
    c.customer_name,
    f.feedback_id,
    f.rating
FROM customers AS c
LEFT JOIN customer_feedback AS f
ON c.customer_id = f.customer_id
WHERE f.feedback_id IS NULL;

-- RIGHT JOIN: Find feedback records without matching customers
SELECT
    c.customer_id,
    c.customer_name,
    f.feedback_id,
    f.customer_id AS feedback_customer_id,
    f.rating
FROM customers AS c
RIGHT JOIN customer_feedback AS f
ON c.customer_id = f.customer_id
WHERE c.customer_id IS NULL;

session-10   UNION AND UNION ALL TOPICS

1.
<p>Create a database `fest_registrations_db` with tables `online_registrations` and `counter_registrations`, both with reg_id, student_name, college, event_name, fee_inr and reg_date, in `fest_union.sql`. Insert 12 rows in each for a fictional college fest, with fees from 100 to 500, and exactly 4 students who appear in both tables for the same event. Hint: Use made-up college names such as 'Sunrise Arts College'.</p>

CREATE TABLE online_registrations (
    reg_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    college VARCHAR(100),
    event_name VARCHAR(100),
    fee_inr INT,
    reg_date DATE
);

CREATE TABLE counter_registrations (
    reg_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    college VARCHAR(100),
    event_name VARCHAR(100),
    fee_inr INT,
    reg_date DATE
);

INSERT INTO online_registrations
(reg_id, student_name, college, event_name, fee_inr, reg_date)
VALUES
(1, 'Rahul', 'Sunrise Arts College', 'Dance', 300, '2026-11-01'),
(2, 'Amit', 'City Science College', 'Singing', 200, '2026-11-02'),
(3, 'Priya', 'Greenfield College', 'Drama', 400, '2026-11-03'),
(4, 'Neha', 'Sunrise Arts College', 'Coding', 500, '2026-11-04'),
(5, 'Karan', 'Modern College', 'Dance', 300, '2026-11-05'),
(6, 'Pooja', 'City Science College', 'Painting', 100, '2026-11-06'),
(7, 'Rohan', 'Greenfield College', 'Singing', 200, '2026-11-07'),
(8, 'Mehul', 'Modern College', 'Drama', 400, '2026-11-08'),
(9, 'Nisha', 'Sunrise Arts College', 'Quiz', 150, '2026-11-09'),
(10, 'Vishal', 'City Science College', 'Coding', 500, '2026-11-10'),
(11, 'Anjali', 'Greenfield College', 'Dance', 300, '2026-11-11'),
(12, 'Jay', 'Modern College', 'Singing', 200, '2026-11-12');

INSERT INTO counter_registrations
(reg_id, student_name, college, event_name, fee_inr, reg_date)
VALUES
(1, 'Rahul', 'Sunrise Arts College', 'Dance', 300, '2026-11-13'),
(2, 'Amit', 'City Science College', 'Singing', 200, '2026-11-14'),
(3, 'Priya', 'Greenfield College', 'Drama', 400, '2026-11-15'),
(4, 'Neha', 'Sunrise Arts College', 'Coding', 500, '2026-11-16'),
(5, 'Deepak', 'Modern College', 'Quiz', 150, '2026-11-17'),
(6, 'Riya', 'City Science College', 'Dance', 300, '2026-11-18'),
(7, 'Sahil', 'Greenfield College', 'Painting', 100, '2026-11-19'),
(8, 'Komal', 'Modern College', 'Coding', 500, '2026-11-20'),
(9, 'Harsh', 'Sunrise Arts College', 'Drama', 400, '2026-11-21'),
(10, 'Mansi', 'City Science College', 'Quiz', 150, '2026-11-22'),
(11, 'Dhruv', 'Greenfield College', 'Singing', 200, '2026-11-23'),
(12, 'Tina', 'Modern College', 'Dance', 300, '2026-11-24');



2.
<p>Write a UNION ALL query in `fest_union.sql` that combines both tables into one list with a `source` column holding 'Online' or 'Counter', sorted by reg_date. The result must have 24 rows. Hint: Add a literal like `'Online' AS source` in each SELECT, and put ORDER BY only after the last SELECT.</p>

SELECT
    reg_id,
    student_name,
    college,
    event_name,
    fee_inr,
    reg_date,
    'Online' AS source
FROM online_registrations

UNION ALL

SELECT
    reg_id,
    student_name,
    college,
    event_name,
    fee_inr,
    reg_date,
    'Counter' AS source
FROM counter_registrations

ORDER BY reg_date;



3.
<p>Write a UNION query returning only student_name, college and event_name from both tables, so that the 4 duplicate registrations appear once. Add it to `fest_union.sql`. The result must have 20 rows. Add a comment with the row count of the matching UNION ALL query, which is 24.</p>

SELECT student_name, college, event_name
FROM online_registrations

UNION

SELECT student_name, college, event_name
FROM counter_registrations;

4.
<p>Finish `fest_union.sql` by creating `workshop_registrations` with 6 rows and its columns in a different order, then combine all three tables with UNION ALL by listing columns in the same order every time, with a `source` column. The final result must have 30 rows. Run the whole file and submit it.</p>

CREATE TABLE workshop_registrations (
    workshop_id INT PRIMARY KEY,
    event_name VARCHAR(100),
    student_name VARCHAR(100),
    fee_inr INT,
    reg_date DATE,
    college VARCHAR(100)
);

INSERT INTO workshop_registrations
(workshop_id, event_name, student_name, fee_inr, reg_date, college)
VALUES
(1, 'Photography', 'Arjun', 250, '2026-11-25', 'Sunrise Arts College'),
(2, 'Web Design', 'Simran', 350, '2026-11-26', 'City Science College'),
(3, 'Robotics', 'Dev', 450, '2026-11-27', 'Greenfield College'),
(4, 'Photography', 'Kavya', 250, '2026-11-28', 'Modern College'),
(5, 'Web Design', 'Yash', 350, '2026-11-29', 'Sunrise Arts College'),
(6, 'Robotics', 'Isha', 450, '2026-11-30', 'City Science College');

SELECT
    reg_id,
    student_name,
    college,
    event_name,
    fee_inr,
    reg_date,
    'Online' AS source
FROM online_registrations

UNION ALL

SELECT
    reg_id,
    student_name,
    college,
    event_name,
    fee_inr,
    reg_date,
    'Counter' AS source
FROM counter_registrations

UNION ALL

SELECT
    workshop_id,
    student_name,
    college,
    event_name,
    fee_inr,
    reg_date,
    'Workshop' AS source
FROM workshop_registrations

ORDER BY reg_date;

session-11 subquieries


1.
<p>Create a database `two_wheeler_db` and a table `listings` (listing_id primary key, brand, model, year, kms_driven, price_inr, city) in `two_wheeler_subqueries.sql`. Insert 20 used two-wheeler listings with 4 fictional brand names you invent, years 2016 to 2024, prices from 20,000 to 150,000 and 5 cities. Make the cheapest listing share its brand and year with at least one other listing.</p>

CREATE TABLE listings (
    listing_id INT PRIMARY KEY,
    brand VARCHAR(50),
    model VARCHAR(50),
    year INT,
    kms_driven INT,
    price_inr INT,
    city VARCHAR(50)
);

INSERT INTO listings
(listing_id, brand, model, year, kms_driven, price_inr, city)
VALUES
(1, 'Voltix', 'V100', 2016, 45000, 25000, 'Ahmedabad'),
(2, 'Voltix', 'V200', 2018, 32000, 45000, 'Surat'),
(3, 'Voltix', 'V300', 2020, 25000, 65000, 'Vadodara'),
(4, 'Voltix', 'V400', 2022, 18000, 90000, 'Rajkot'),
(5, 'Voltix', 'V500', 2024, 8000, 125000, 'Ahmedabad'),

(6, 'Rydex', 'R100', 2017, 50000, 30000, 'Surat'),
(7, 'Rydex', 'R200', 2019, 35000, 55000, 'Vadodara'),
(8, 'Rydex', 'R300', 2021, 22000, 75000, 'Rajkot'),
(9, 'Rydex', 'R400', 2023, 12000, 110000, 'Gandhinagar'),
(10, 'Rydex', 'R500', 2024, 7000, 145000, 'Ahmedabad'),

(11, 'Zentro', 'Z100', 2016, 60000, 40000, 'Vadodara'),
(12, 'Zentro', 'Z200', 2018, 42000, 60000, 'Rajkot'),
(13, 'Zentro', 'Z300', 2020, 28000, 80000, 'Gandhinagar'),
(14, 'Zentro', 'Z400', 2022, 16000, 100000, 'Surat'),
(15, 'Zentro', 'Z500', 2023, 10000, 130000, 'Ahmedabad'),

(16, 'Motora', 'M100', 2017, 55000, 35000, 'Rajkot'),
(17, 'Motora', 'M200', 2019, 38000, 70000, 'Gandhinagar'),
(18, 'Motora', 'M300', 2021, 24000, 95000, 'Surat'),
(19, 'Motora', 'M400', 2023, 14000, 120000, 'Vadodara'),
(20, 'Motora', 'M500', 2024, 6000, 150000, 'Ahmedabad');


SELECT * FROM listings;


SELECT *
FROM listings
ORDER BY price_inr ASC
LIMIT 1;


2.
<p>Write a query in `two_wheeler_subqueries.sql` that returns listings priced above the overall average price, adding a column `gap_from_avg_inr` (price minus the average) with a scalar subquery in SELECT and the average used again in WHERE. Hint: Put the subquery in parentheses, for example `(SELECT AVG(price_inr) FROM listings)`.</p>

SELECT
    listing_id,
    brand,
    model,
    year,
    price_inr,
    price_inr - (SELECT AVG(price_inr) FROM listings) AS gap_from_avg_inr
FROM listings
WHERE price_inr > (SELECT AVG(price_inr) FROM listings);


3.
<p>Write a query that finds all listings with the same brand and year as the cheapest listing, using a row subquery such as `WHERE (brand, year) = (SELECT ...)`. Add it to `two_wheeler_subqueries.sql`. The result must have at least 2 rows. Hint: The inner query needs `ORDER BY price_inr LIMIT 1`.</p>


SELECT *
FROM listings
WHERE (brand, year) = (
    SELECT brand, year
    FROM listings
    ORDER BY price_inr ASC
    LIMIT 1
);

4.
<p>Finish `two_wheeler_subqueries.sql` with a query that uses a derived table in FROM to compute the average price per brand (rounded) and returns only brands whose average is above the overall average price. Give the derived table an alias. Run the whole file and confirm at least 1 brand is returned.</p>


SELECT
    brand_avg.brand,
    brand_avg.avg_price_inr
FROM (
    SELECT
        brand,
        ROUND(AVG(price_inr), 2) AS avg_price_inr
    FROM listings
    GROUP BY brand
) AS brand_avg
WHERE brand_avg.avg_price_inr > (
    SELECT AVG(price_inr)
    FROM listings
);


session-12 CTE 

1.
<p>In `two_wheeler_db`, create `yearly_resales` (sale_year, brand, units_sold) with 21 rows, 3 fictional brands for each year from 2019 to 2025, and units from 40 to 400. Save it in `two_wheeler_cte.sql`, together with a query that uses a WITH clause named `yearly_totals` to return total units_sold per year, sorted by year.</p>

CREATE TABLE yearly_resales (
    sale_year INT,
    brand VARCHAR(50),
    units_sold INT
);

INSERT INTO yearly_resales
(sale_year, brand, units_sold)
VALUES
(2019, 'Voltix', 120),
(2019, 'Rydex', 180),
(2019, 'Motora', 90),

(2020, 'Voltix', 150),
(2020, 'Rydex', 200),
(2020, 'Motora', 110),

(2021, 'Voltix', 170),
(2021, 'Rydex', 220),
(2021, 'Motora', 140),

(2022, 'Voltix', 190),
(2022, 'Rydex', 250),
(2022, 'Motora', 160),

(2023, 'Voltix', 230),
(2023, 'Rydex', 280),
(2023, 'Motora', 190),

(2024, 'Voltix', 260),
(2024, 'Rydex', 320),
(2024, 'Motora', 220),

(2025, 'Voltix', 300),
(2025, 'Rydex', 380),
(2025, 'Motora', 250);

WITH yearly_totals AS (
    SELECT
        sale_year,
        SUM(units_sold) AS total_units_sold
    FROM yearly_resales
    GROUP BY sale_year
)
SELECT
    sale_year,
    total_units_sold
FROM yearly_totals
ORDER BY sale_year;


2.
<p>Write a CTE-based query that uses the CTE `yearly_totals` twice, joining it to itself on `cur.sale_year = prev.sale_year + 1`, to return each year's units, the previous year's units and `yoy_growth_pct` rounded to 1 decimal. Add it to `two_wheeler_cte.sql`. The result must have 6 rows.</p>

WITH yearly_totals AS (
    SELECT sale_year, SUM(units_sold) AS total_units
    FROM yearly_resales
    GROUP BY sale_year
)
SELECT
    cur.sale_year,
    cur.total_units AS current_units,
    prev.total_units AS previous_units,
    ROUND(
        (cur.total_units - prev.total_units) * 100.0 / prev.total_units,
        1
    ) AS yoy_growth_pct
FROM yearly_totals cur
JOIN yearly_totals prev
ON cur.sale_year = prev.sale_year + 1;

3.
<p>Write a query with two CTEs, `brand_totals` (total units per brand) and `top_brand` (the brand with the most units, using ORDER BY and LIMIT 1), and join them to show the top brand and its share of all units as a percentage. Add it to `two_wheeler_cte.sql`.</p>

WITH brand_totals AS (
    SELECT brand, SUM(units_sold) AS total_units
    FROM yearly_resales
    GROUP BY brand
),
top_brand AS (
    SELECT brand, total_units
    FROM brand_totals
    ORDER BY total_units DESC
    LIMIT 1
)
SELECT
    top_brand.brand,
    top_brand.total_units,
    ROUND(
        top_brand.total_units * 100.0 /
        (SELECT SUM(units_sold) FROM yearly_resales),
        1
    ) AS share_percentage
FROM top_brand;

4.
<p>Finish `two_wheeler_cte.sql` with a recursive CTE that builds a depreciation table for a bike priced at 80,000 rupees losing 12% value every year for 6 years, returning age_years and value_inr. The result must have 7 rows, starting at 80000.00. Hint: Use `CAST(80000 AS DECIMAL(10,2))` in the anchor row so decimals stay exact.</p>

WITH RECURSIVE depreciation AS (
    SELECT
        0 AS age_years,
        CAST(80000 AS DECIMAL(10,2)) AS value_inr

    UNION ALL

    SELECT
        age_years + 1,
        ROUND(value_inr * 0.88, 2)
    FROM depreciation
    WHERE age_years < 6
)
SELECT age_years, value_inr
FROM depreciation;




SESSION-13 WINDOW FUNCTIONS


1.
<p>Create a database `upi_payments_db` and a table `payments` (payment_id primary key, sender_handle, merchant_category, amount_inr, paid_on DATE) in `upi_windows.sql`. Insert 24 fictional UPI-style payments from 6 invented handles such as 'asha@fictbank', in 4 categories, with amounts from 20 to 4,000, dates in October 2026, and two payments in one category having exactly the same amount.</p>

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    sender_handle VARCHAR(100),
    merchant_category VARCHAR(50),
    amount_inr INT,
    paid_on DATE
);

INSERT INTO payments
(payment_id, sender_handle, merchant_category, amount_inr, paid_on)
VALUES
(1, 'asha@fictbank', 'Food', 250, '2026-10-01'),
(2, 'rahul@fictbank', 'Shopping', 1200, '2026-10-02'),
(3, 'priya@fictbank', 'Travel', 800, '2026-10-03'),
(4, 'amit@fictbank', 'Bills', 1500, '2026-10-04'),

(5, 'neha@fictbank', 'Food', 350, '2026-10-05'),
(6, 'karan@fictbank', 'Shopping', 2200, '2026-10-06'),
(7, 'asha@fictbank', 'Travel', 600, '2026-10-07'),
(8, 'rahul@fictbank', 'Bills', 900, '2026-10-08'),

(9, 'priya@fictbank', 'Food', 250, '2026-10-09'),
(10, 'amit@fictbank', 'Shopping', 1800, '2026-10-10'),
(11, 'neha@fictbank', 'Travel', 1200, '2026-10-11'),
(12, 'karan@fictbank', 'Bills', 2000, '2026-10-12'),

(13, 'asha@fictbank', 'Food', 450, '2026-10-13'),
(14, 'rahul@fictbank', 'Shopping', 3000, '2026-10-14'),
(15, 'priya@fictbank', 'Travel', 950, '2026-10-15'),
(16, 'amit@fictbank', 'Bills', 750, '2026-10-16'),

(17, 'neha@fictbank', 'Food', 180, '2026-10-17'),
(18, 'karan@fictbank', 'Shopping', 4000, '2026-10-18'),
(19, 'asha@fictbank', 'Travel', 1500, '2026-10-19'),
(20, 'rahul@fictbank', 'Bills', 1200, '2026-10-20'),

(21, 'priya@fictbank', 'Food', 320, '2026-10-21'),
(22, 'amit@fictbank', 'Shopping', 950, '2026-10-22'),
(23, 'neha@fictbank', 'Travel', 700, '2026-10-23'),
(24, 'karan@fictbank', 'Bills', 3500, '2026-10-24');

-- Check all payments
SELECT * FROM payments;

2.
<p>Write a query in `upi_windows.sql` that returns every payment with `overall_avg` (AVG(amount_inr) OVER ()) and `diff_from_avg`, both rounded to 2 decimals.
 The result must keep all 24 rows. Hint: A window function does not collapse rows like GROUP BY does.</p>
 
 SELECT
    payment_id,
    sender_handle,
    merchant_category,
    amount_inr,
    ROUND(AVG(amount_inr) OVER (), 2) AS overall_avg,
    ROUND(
        amount_inr - AVG(amount_inr) OVER (), 2
    ) AS diff_from_avg
FROM payments;


3.
<p>Write a query that uses AVG and SUM with `PARTITION BY merchant_category` to show each payment, its category average, its category total and its percentage share of the category total. Add it to `upi_windows.sql`. The result must keep 24 rows. Constraint: Do not use GROUP BY or a subquery.</p>


SELECT
    payment_id,
    sender_handle,
    merchant_category,
    amount_inr,

    ROUND(AVG(amount_inr) OVER (
        PARTITION BY merchant_category
    ), 2) AS category_avg,

    SUM(amount_inr) OVER (
        PARTITION BY merchant_category
    ) AS category_total,

    ROUND(
        amount_inr * 100.0 /
        SUM(amount_inr) OVER (
            PARTITION BY merchant_category
        ), 2
    ) AS percentage_share

FROM payments;

4.
<p>Finish `upi_windows.sql` with a running total query per sender_handle, using `SUM(amount_inr) OVER (PARTITION BY sender_handle ORDER BY paid_on, payment_id)`, returning sender_handle, paid_on, amount_inr and `running_total_inr`. Check that each sender's last running total equals that sender's total spend.</p>

SELECT
    sender_handle,
    paid_on,
    amount_inr,
    SUM(amount_inr) OVER (
        PARTITION BY sender_handle
        ORDER BY paid_on, payment_id
    ) AS running_total_inr
FROM payments;



SESSION-14 WINDOW FUNCTIONS RANK(),DDENSE_RANK(),ROW_NUMBER();

1.
<p>  Open your `payments` table in `upi_payments_db` and write a query in `upi_ranking.sql` that numbers each sender_handle's payments from newest to oldest with ROW_NUMBER, as `payment_no`. Hint: If you missed the last session, create `payments` with at least 12 rows and a repeated amount in one category first.</p>


SELECT
    payment_id,
    sender_handle,
    merchant_category,
    amount_inr,
    paid_on,
    ROW_NUMBER() OVER (
        PARTITION BY sender_handle
        ORDER BY paid_on DESC, payment_id DESC
    ) AS payment_no
FROM payments;


2.
<p>Write a query that ranks payments by amount_inr within each merchant_category, showing both RANK and DENSE_RANK as separate columns. Add it to `upi_ranking.sql`. The result must contain at least one tie, where RANK skips a number and DENSE_RANK does not.</p>


SELECT
    payment_id,
    merchant_category,
    amount_inr,

    RANK() OVER (
        PARTITION BY merchant_category
        ORDER BY amount_inr DESC
    ) AS payment_rank,

    DENSE_RANK() OVER (
        PARTITION BY merchant_category
        ORDER BY amount_inr DESC
    ) AS dense_payment_rank

FROM payments;


3.
<p>Write a query using a CTE and ROW_NUMBER that returns only the latest payment of each sender_handle, with sender_handle, paid_on and amount_inr. Add it to `upi_ranking.sql`. The result must have exactly 6 rows. Hint: Filter on the row number in the outer query, because window functions cannot be used in WHERE.</p>


WITH latest_payments AS (
    SELECT
        sender_handle,
        paid_on,
        amount_inr,
        ROW_NUMBER() OVER (
            PARTITION BY sender_handle
            ORDER BY paid_on DESC, payment_id DESC
        ) AS rn
    FROM payments
)
SELECT
    sender_handle,
    paid_on,
    amount_inr
FROM latest_payments
WHERE rn = 1;


4.
<p>Finish `upi_ranking.sql` with a query that returns the top 2 largest amount_inr values in each merchant_category using DENSE_RANK in a CTE, keeping ties. Run the whole file and confirm that every category appears and the tied payments are both included.</p>


WITH category_ranking AS (
    SELECT
        payment_id,
        sender_handle,
        merchant_category,
        amount_inr,
        DENSE_RANK() OVER (
            PARTITION BY merchant_category
            ORDER BY amount_inr DESC
        ) AS payment_rank
    FROM payments
)
SELECT
    payment_id,
    sender_handle,
    merchant_category,
    amount_inr,
    payment_rank
FROM category_ranking
WHERE payment_rank <= 2
ORDER BY merchant_category, payment_rank;



SESSION-15 DATE AND TIME FUNCTIONS


1.
<p>Create a database `gym_membership_db` and a table `members` (member_id primary key, member_name, joined_on DATE, plan_months INT, last_visit DATE) in `gym_dates.sql`. Insert 15 fictional members who joined between 2025-06-01 and 2026-10-31, with plan_months of 1, 3, 6 or 12, last_visit dates between 2026-09-01 and 2026-11-15, and at least 3 memberships expiring in December 2026.</p>

CREATE TABLE members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(100),
    joined_on DATE,
    plan_months INT,
    last_visit DATE
);

INSERT INTO members
(member_id, member_name, joined_on, plan_months, last_visit)
VALUES
(1, 'Rahul', '2025-12-01', 12, '2026-11-15'),
(2, 'Amit', '2026-09-01', 3, '2026-11-10'),
(3, 'Priya', '2026-06-15', 6, '2026-11-12'),
(4, 'Neha', '2026-10-01', 3, '2026-11-05'),
(5, 'Karan', '2026-06-01', 6, '2026-10-25'),
(6, 'Pooja', '2026-12-01', 1, '2026-11-14'),
(7, 'Rohan', '2025-11-01', 12, '2026-10-20'),
(8, 'Mehul', '2026-08-01', 3, '2026-09-15'),
(9, 'Nisha', '2026-05-01', 6, '2026-10-10'),
(10, 'Vishal', '2026-11-01', 1, '2026-11-13'),
(11, 'Anjali', '2025-12-15', 12, '2026-10-30'),
(12, 'Jay', '2026-07-01', 3, '2026-09-20'),
(13, 'Deepak', '2026-06-20', 6, '2026-11-01'),
(14, 'Riya', '2025-12-10', 12, '2026-09-25'),
(15, 'Harsh', '2026-09-15', 3, '2026-11-08');

2.
<p>Write a query in `gym_dates.sql` returning member_name, `join_year`, `join_month` and `join_day` (using YEAR, MONTH and DAY), `checked_at` (using NOW()) and `today_only` (using DATE(NOW())). The result must have 15 rows. Hint: `NOW()` returns date and time, `DATE()` keeps only the date.</p>

SELECT
    member_name,
    YEAR(joined_on) AS join_year,
    MONTH(joined_on) AS join_month,
    DAY(joined_on) AS join_day,
    NOW() AS checked_at,
    DATE(NOW()) AS today_only
FROM members;


3.
<p>Write a query that returns member_name, `expiry_date` using `DATE_ADD(joined_on, INTERVAL plan_months MONTH)` and `reminder_date` using DATE_SUB to give 7 days before expiry. Add it to `gym_dates.sql`. Both columns must hold valid dates for all 15 rows, and you check two rows by hand on a calendar.</p>


SELECT
    member_name,
    DATE_ADD(joined_on, INTERVAL plan_months MONTH) AS expiry_date,
    DATE_SUB(
        DATE_ADD(joined_on, INTERVAL plan_months MONTH),
        INTERVAL 7 DAY
    ) AS reminder_date
FROM members;

4.
<p>Finish `gym_dates.sql` with a query that uses DATEDIFF and the fixed reference date '2026-11-30' to return members whose expiry_date falls within the 30 days after that date, with `days_left`. Run the whole file and make sure at least 2 members are returned. Hint: Repeat the expiry expression, since an alias cannot be used in WHERE.</p>

SELECT
    member_name,
    DATE_ADD(joined_on, INTERVAL plan_months MONTH) AS expiry_date,
    DATEDIFF(
        DATE_ADD(joined_on, INTERVAL plan_months MONTH),
        '2026-11-30'
    ) AS days_left
FROM members
WHERE DATE_ADD(joined_on, INTERVAL plan_months MONTH)
BETWEEN '2026-12-01' AND '2026-12-30';




SESSION-16 STRING FUNCTIONS

1.
<p>Create `member_contacts` in `gym_membership_db` with member_id, full_name and member_code, and insert 12 deliberately messy rows in `gym_strings.sql`, such as full_name ' rEKHA patel ' and member_code ' gym-ahd-0007', with mixed case, extra spaces and some codes using '_' instead of '-'. Use invented names only and no real phone numbers.</p>


CREATE TABLE member_contacts (
    member_id INT,
    full_name VARCHAR(100),
    member_code VARCHAR(50)
);

INSERT INTO member_contacts
(member_id, full_name, member_code)
VALUES
(1, ' rEKHA patel ', ' gym-ahd-0007'),
(2, ' AMIT shah ', 'GYM_AHD_0008'),
(3, 'priya DESAI', 'gym-ahd-0009'),
(4, '  neha joshi ', 'GYM_AHD_0010'),
(5, 'RAHUL mehta', ' gym-ahd-0011'),
(6, ' pooja modi ', 'gym_AHD_0012'),
(7, 'KARAN patel', 'GYM-AHD-0013'),
(8, '  riya shah', 'gym_ahd_0014'),
(9, 'vISHAL desai ', ' GYM-AHD-0015'),
(10, 'MEHUL joshi', 'gym_ahd_0016'),
(11, ' anjali mehta ', 'GYM-AHD-0017'),
(12, 'ROHAN modi ', ' gym_ahd_0018');



2.
<p>Write a query in `gym_strings.sql` that returns member_id and `clean_name` built with CONCAT, UPPER, LOWER, LEFT, SUBSTR and TRIM, so the first letter is capital and the rest lower case, with no spaces at either end. Check that ' rEKHA patel ' becomes 'Rekha patel'.</p>

SELECT
    member_id,
    CONCAT(
        UPPER(LEFT(TRIM(full_name), 1)),
        LOWER(SUBSTR(TRIM(full_name), 2))
    ) AS clean_name
FROM member_contacts;

3.
<p>Write a query that returns `clean_code` (TRIM, UPPER and REPLACE so every code reads like GYM-AHD-0007), then `branch_code` (the 3 middle letters using SUBSTR) and `serial_no` (the last 4 characters using RIGHT). Add it to `gym_strings.sql`. Every row must follow the same format.</p>


SELECT
    member_id,
    REPLACE(UPPER(TRIM(member_code)), '_', '-') AS clean_code,
    SUBSTR(REPLACE(UPPER(TRIM(member_code)), '_', '-'), 5, 3) AS branch_code,
    RIGHT(TRIM(member_code), 4) AS serial_no
FROM member_contacts;


4.
<p>Finish `gym_strings.sql` with one query returning member_id, clean_name, clean_code, and `label`, built with CONCAT as clean_name followed by ' (' and branch_code and ')'. Run the whole file and confirm all 12 rows show consistent codes and no leading or trailing spaces.</p>

SELECT
    member_id,
    TRIM(full_name) AS clean_name,
    REPLACE(UPPER(TRIM(member_code)), '_', '-') AS clean_code,
    CONCAT(
        TRIM(full_name),
        ' (',
        'AHD',
        ')'
    ) AS label
FROM member_contacts;

SESSION-17 CASE WHEN


1.
<p>Create `gym_activity` (member_id, visits_last_30_days INT, monthly_fee_inr INT) in `gym_membership_db` and insert one row for each of your 15 `members`, with visits from 0 to 28 and fees from 800 to 2,500, in `gym_case.sql`. Make sure at least 3 members have fewer than 4 visits and at least 3 have 16 or more.</p>


CREATE TABLE gym_activity (
    member_id INT,
    visits_last_30_days INT,
    monthly_fee_inr INT
);

INSERT INTO gym_activity
(member_id, visits_last_30_days, monthly_fee_inr)
VALUES
(1, 2, 1000),
(2, 3, 1200),
(3, 5, 1500),
(4, 1, 800),
(5, 18, 2000),
(6, 20, 2500),
(7, 16, 1800),
(8, 8, 1200),
(9, 12, 1500),
(10, 22, 2200),
(11, 3, 1000),
(12, 6, 1300),
(13, 25, 2500),
(14, 0, 800),
(15, 28, 2000);


2.
<p>Write a query in `gym_case.sql` that returns member_id and `engagement` using CASE WHEN: 'Regular' for 16 or more visits, 'Occasional' for 8 to 15, and 'Dormant' otherwise. The result must have 15 rows. Hint: Conditions are checked in order, so test the highest threshold first.</p>


SELECT
    member_id,
    CASE
        WHEN visits_last_30_days >= 16 THEN 'Regular'
        WHEN visits_last_30_days >= 8 THEN 'Occasional'
        ELSE 'Dormant'
    END AS engagement
FROM gym_activity;


3.
<p>Write a query that bins monthly_fee_inr into 'Basic' (under 1,200), 'Standard' (1,200 to 1,799) and 'Premium' (1,800 and above), and shows the number of members and total fees per bin using GROUP BY. Add it to `gym_case.sql`. The total of the counts must equal 15.</p>


SELECT
    CASE
        WHEN monthly_fee_inr < 1200 THEN 'Basic'
        WHEN monthly_fee_inr < 1800 THEN 'Standard'
        ELSE 'Premium'
    END AS category,
    COUNT(*) AS total_members,
    SUM(monthly_fee_inr) AS total_fees
FROM gym_activity
GROUP BY category;

4.
<p>Finish `gym_case.sql` with a query joining `members` and `gym_activity` that returns member_name and `risk_label` using CASE WHEN: 'Churn Risk' below 4 visits, 'Watch' below 8, 'Healthy' otherwise, sorted by visits ascending. Run the whole file and confirm each label appears at least once.</p>


SELECT
    members.member_name,
    CASE
        WHEN gym_activity.visits_last_30_days < 4 THEN 'Churn Risk'
        WHEN gym_activity.visits_last_30_days < 8 THEN 'Watch'
        ELSE 'Healthy'
    END AS risk_label
FROM members
JOIN gym_activity
ON members.member_id = gym_activity.member_id
ORDER BY gym_activity.visits_last_30_days ASC;



SESSION -18 VIEWS 


1.
<p>Create a database `society_energy_db` and a table `meter_readings` (reading_id primary key, flat_no, wing, reading_date DATE, units_kwh INT, rate_per_unit DECIMAL(4,2)) in `society_views.sql`. Insert 36 rows for 12 flats in wings A, B and C of a fictional housing society, with one reading each in July, August and September 2026, units from 90 to 450 and rates of 5.50 to 7.50.</p>

CREATE TABLE meter_readings (
    reading_id INT PRIMARY KEY,
    flat_no INT,
    wing VARCHAR(10),
    reading_date DATE,
    units_kwh INT,
    rate_per_unit DECIMAL(4,2)
);

INSERT INTO meter_readings
(reading_id, flat_no, wing, reading_date, units_kwh, rate_per_unit)
VALUES
-- Wing A
(1, 101, 'A', '2026-07-31', 120, 5.50),
(2, 101, 'A', '2026-08-31', 140, 6.00),
(3, 101, 'A', '2026-09-30', 160, 6.50),

(4, 102, 'A', '2026-07-31', 180, 5.75),
(5, 102, 'A', '2026-08-31', 200, 6.25),
(6, 102, 'A', '2026-09-30', 220, 6.75),

(7, 103, 'A', '2026-07-31', 90, 5.50),
(8, 103, 'A', '2026-08-31', 110, 6.00),
(9, 103, 'A', '2026-09-30', 130, 6.50),

(10, 104, 'A', '2026-07-31', 250, 6.00),
(11, 104, 'A', '2026-08-31', 270, 6.50),
(12, 104, 'A', '2026-09-30', 290, 7.00),

-- Wing B
(13, 201, 'B', '2026-07-31', 150, 5.75),
(14, 201, 'B', '2026-08-31', 170, 6.25),
(15, 201, 'B', '2026-09-30', 190, 6.75),

(16, 202, 'B', '2026-07-31', 300, 6.00),
(17, 202, 'B', '2026-08-31', 320, 6.50),
(18, 202, 'B', '2026-09-30', 340, 7.00),

(19, 203, 'B', '2026-07-31', 100, 5.50),
(20, 203, 'B', '2026-08-31', 120, 6.00),
(21, 203, 'B', '2026-09-30', 140, 6.50),

(22, 204, 'B', '2026-07-31', 350, 6.50),
(23, 204, 'B', '2026-08-31', 380, 7.00),
(24, 204, 'B', '2026-09-30', 400, 7.50),

-- Wing C
(25, 301, 'C', '2026-07-31', 200, 5.75),
(26, 301, 'C', '2026-08-31', 220, 6.25),
(27, 301, 'C', '2026-09-30', 240, 6.75),

(28, 302, 'C', '2026-07-31', 280, 6.00),
(29, 302, 'C', '2026-08-31', 300, 6.50),
(30, 302, 'C', '2026-09-30', 320, 7.00),

(31, 303, 'C', '2026-07-31', 400, 6.50),
(32, 303, 'C', '2026-08-31', 420, 7.00),
(33, 303, 'C', '2026-09-30', 450, 7.50),

(34, 304, 'C', '2026-07-31', 160, 5.50),
(35, 304, 'C', '2026-08-31', 180, 6.00),
(36, 304, 'C', '2026-09-30', 200, 6.50);


2.
<p>Create a view `v_monthly_flat_bill` in `society_views.sql` that returns flat_no, wing, `bill_month` (using MONTH), units_kwh and `bill_amount_inr` (units multiplied by rate, rounded to 2 decimals). Then run `SELECT * FROM v_monthly_flat_bill;` to confirm 36 rows. Hint: Use `CREATE OR REPLACE VIEW` so the file can be re-run.</p>


CREATE OR REPLACE VIEW v_monthly_flat_bill AS
SELECT
    flat_no,
    wing,
    MONTH(reading_date) AS bill_month,
    units_kwh,
    ROUND(units_kwh * rate_per_unit, 2) AS bill_amount_inr
FROM meter_readings;

SELECT * FROM v_monthly_flat_bill;


3.
<p>Create a simple view `v_wing_a_readings` showing the columns of `meter_readings` for wing A only, then run an UPDATE through the view to correct one flat's units_kwh, and check the change in the base table. Add it to `society_views.sql`. Hint: Views with GROUP BY or aggregates cannot be updated.</p>

CREATE OR REPLACE VIEW v_wing_a_readings AS
SELECT *
FROM meter_readings
WHERE wing = 'A';

UPDATE v_wing_a_readings
SET units_kwh = 150
WHERE reading_id = 1;

SELECT * FROM meter_readings
WHERE reading_id = 1;

4.
<p>Finish `society_views.sql` with a dashboard view `v_wing_summary` returning wing, total units and average bill per wing using GROUP BY, then add a commented-out UPDATE on it that fails, with the MySQL error code as a comment. Run the file from a clean database and confirm all three views exist with `SHOW FULL TABLES WHERE Table_type = 'VIEW';`.</p>

CREATE OR REPLACE VIEW v_wing_summary AS
SELECT
    wing,
    SUM(units_kwh) AS total_units,
    ROUND(AVG(units_kwh * rate_per_unit), 2) AS average_bill
FROM meter_readings
GROUP BY wing;

SELECT * FROM v_wing_summary;

-- UPDATE v_wing_summary SET total_units = 500 WHERE wing = 'A';
-- Error: 1288 - The target table v_wing_summary is not updatable.

SHOW FULL TABLES
WHERE Table_type = 'VIEW';


SESSION-19 INDEXING AND QUERY OPTIMIZATION


1.
<p>In `society_energy_db`, create `meter_readings_big` (reading_id primary key, flat_no, reading_date DATE, units_kwh INT) and fill it with 100,000 rows using a recursive CTE inside an INSERT, in `society_indexing.sql`. Use 200 flats (wings A to D, numbers 101 to 150) and dates spread over 2024 and 2025. Hint: Run `SET SESSION cte_max_recursion_depth = 100000;` first, use `INSERT INTO t WITH RECURSIVE ... SELECT ...`, and build flat_no from `MOD(n,200) DIV 50` and `101 + MOD(n,50)`.</p>

CREATE TABLE meter_readings_big (
    reading_id INT PRIMARY KEY,
    flat_no INT,
    reading_date DATE,
    units_kwh INT
);

SET SESSION cte_max_recursion_depth = 100000;

INSERT INTO meter_readings_big
WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 100000
)
SELECT
    n,
    (MOD(n, 200) DIV 50) * 100 + 101 + MOD(n, 50),
    DATE_ADD('2024-01-01', INTERVAL MOD(n, 730) DAY),
    90 + MOD(n, 361)
FROM numbers;

SELECT COUNT(*) AS total_rows
FROM meter_readings_big;


2.
<p>Write the lookup query `SELECT * FROM meter_readings_big WHERE flat_no = 'B-107';` in `society_indexing.sql`, run EXPLAIN on it before any index exists, and add a comment with the `type`, `key` and `rows` values you see. The comment must show a full table scan with about 100,000 rows.</p>

-- Lookup query
SELECT *
FROM meter_readings_big
WHERE flat_no = 'B-107';

-- Explain query
EXPLAIN
SELECT *
FROM meter_readings_big
WHERE flat_no = 'B-107';

SELECT *
FROM meter_readings_big
WHERE flat_no = 207;


3.
<p>Create an index `idx_flat_no` on flat_no in `society_indexing.sql`, run EXPLAIN on the same lookup query again, and add a comment with the new `type`, `key` and `rows`. The scanned rows must drop from about 100,000 to about 500. Hint: Use `CREATE INDEX idx_flat_no ON meter_readings_big (flat_no);`.</p>


CREATE INDEX idx_flat_no
ON meter_readings_big(flat_no);

EXPLAIN
SELECT *
FROM meter_readings_big
WHERE flat_no = 207;


4.
<p>Finish `society_indexing.sql` with two queries for October 2025 readings: one using `WHERE YEAR(reading_date) = 2025 AND MONTH(reading_date) = 10`, and one using `reading_date >= '2025-10-01' AND reading_date < '2025-11-01'` after you create `idx_reading_date`. Run EXPLAIN on both and add a comment with the `rows` and `key` of each. Check that only the second query uses the index.</p>


EXPLAIN
SELECT *
FROM meter_readings_big
WHERE YEAR(reading_date) = 2025
AND MONTH(reading_date) = 10;

-- Second query: With index
CREATE INDEX idx_reading_date
ON meter_readings_big(reading_date);

EXPLAIN
SELECT *
FROM meter_readings_big
WHERE reading_date >= '2025-10-01'
AND reading_date < '2025-11-01';
