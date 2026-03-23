-- ================================
-- Dimension Tables
-- ================================

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT,
    month INT,
    month_name VARCHAR(20),
    year INT
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- ================================
-- Fact Table
-- ================================

CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    total_revenue DECIMAL(12,2),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- ================================
-- Load Dimension Data (Cleaned)
-- ================================

-- Dates (standardized to YYYY-MM-DD)
INSERT INTO dim_date VALUES
(1, '2024-01-15', 15, 1, 'January', 2024),
(2, '2024-02-10', 10, 2, 'February', 2024),
(3, '2024-03-05', 5, 3, 'March', 2024);

-- Stores
INSERT INTO dim_store VALUES
(1, 'Bangalore Central', 'Bangalore', 'Karnataka'),
(2, 'Mumbai Mall', 'Mumbai', 'Maharashtra'),
(3, 'Delhi Hub', 'Delhi', 'Delhi');

-- Products (category casing standardized)
INSERT INTO dim_product VALUES
(1, 'Smart TV', 'Electronics'),
(2, 'T-Shirt', 'Clothing'),
(3, 'Almond Milk', 'Groceries'),
(4, 'Laptop', 'Electronics');

-- ================================
-- Load Fact Data (10 cleaned rows)
-- ================================

INSERT INTO fact_sales VALUES
(1, 1, 1, 1, 2, 50000, 100000),
(2, 1, 2, 2, 5, 1000, 5000),
(3, 1, 3, 3, 10, 300, 3000),
(4, 2, 1, 4, 1, 70000, 70000),
(5, 2, 2, 1, 1, 52000, 52000),
(6, 2, 3, 2, 4, 950, 3800),
(7, 3, 1, 3, 8, 280, 2240),
(8, 3, 2, 4, 2, 68000, 136000),
(9, 3, 3, 1, 1, 51000, 51000),
(10, 3, 1, 2, 6, 1000, 6000);
``
