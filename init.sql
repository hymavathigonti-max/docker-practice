-- ============================================
-- FILE: sample_data.sql
-- Description: Customers and Orders sample data
-- ============================================

-- Drop tables if they exist (order matters due to FK)
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

-- ============================================
-- TABLE: customers
-- ============================================
CREATE TABLE customers (
    customer_id   INT PRIMARY KEY AUTO_INCREMENT,
    first_name    VARCHAR(50)  NOT NULL,
    last_name     VARCHAR(50)  NOT NULL,
    email         VARCHAR(150) UNIQUE NOT NULL,
    phone         VARCHAR(20),
    city          VARCHAR(50),
    country       VARCHAR(50),
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- TABLE: orders
-- ============================================
CREATE TABLE orders (
    order_id      INT PRIMARY KEY AUTO_INCREMENT,
    customer_id   INT NOT NULL,
    order_date    DATE NOT NULL,
    product_name  VARCHAR(100) NOT NULL,
    quantity      INT NOT NULL DEFAULT 1,
    unit_price    DECIMAL(10,2) NOT NULL,
    total_amount  DECIMAL(10,2) NOT NULL,
    status        VARCHAR(20) DEFAULT 'pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- ============================================
-- DATA: customers (10 rows)
-- ============================================
INSERT INTO customers (first_name, last_name, email, phone, city, country) VALUES
('John',    'Doe',      'john.doe@example.com',      '555-0101', 'New York',   'USA'),
('Jane',    'Smith',    'jane.smith@example.com',    '555-0102', 'London',     'UK'),
('Michael', 'Brown',    'michael.brown@example.com', '555-0103', 'Toronto',    'Canada'),
('Emily',   'Davis',    'emily.davis@example.com',   '555-0104', 'Sydney',     'Australia'),
('David',   'Wilson',   'david.wilson@example.com',  '555-0105', 'Mumbai',     'India'),
('Sarah',   'Johnson',  'sarah.johnson@example.com', '555-0106', 'Berlin',     'Germany'),
('Robert',  'Miller',   'robert.miller@example.com', '555-0107', 'Paris',      'France'),
('Laura',   'Garcia',   'laura.garcia@example.com',  '555-0108', 'Madrid',     'Spain'),
('James',   'Anderson', 'james.anderson@example.com','555-0109', 'Tokyo',      'Japan'),
('Priya',   'Sharma',   'priya.sharma@example.com',  '555-0110', 'Bangalore',  'India');

-- ============================================
-- DATA: orders (15 rows)
-- ============================================
INSERT INTO orders (customer_id, order_date, product_name, quantity, unit_price, total_amount, status) VALUES
(1, '2024-01-05', 'Laptop',           1, 999.99,  999.99, 'completed'),
(1, '2024-01-12', 'Wireless Mouse',   2,  25.50,   51.00, 'completed'),
(2, '2024-01-08', 'Smartphone',       1, 599.99,  599.99, 'shipped'),
(3, '2024-01-10', 'Headphones',       3,  89.99,  269.97, 'pending'),
(4, '2024-01-15', 'Keyboard',         1,  49.99,   49.99, 'completed'),
(5, '2024-01-18', 'Monitor',          2, 249.99,  499.98, 'pending'),
(6, '2024-01-20', 'Tablet',           1, 399.00,  399.00, 'shipped'),
(7, '2024-01-22', 'Smartwatch',       1, 199.50,  199.50, 'completed'),
(8, '2024-01-25', 'USB-C Cable',      5,  12.99,   64.95, 'completed'),
(9, '2024-01-28', 'External SSD',     1, 129.99,  129.99, 'pending'),
(10,'2024-02-01', 'Webcam',           2,  79.99,  159.98, 'shipped'),
(2, '2024-02-03', 'Phone Case',       1,  19.99,   19.99, 'completed'),
(3, '2024-02-05', 'Power Bank',       1,  45.00,   45.00, 'pending'),
(5, '2024-02-07', 'Desk Lamp',        1,  35.75,   35.75, 'completed'),
(1, '2024-02-10', 'Bluetooth Speaker',1,  59.99,   59.99, 'cancelled');
