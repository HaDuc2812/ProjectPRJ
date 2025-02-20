-- Drop the database if it exists
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'WineShop1')
BEGIN
    DROP DATABASE WineShop1;
END

-- Create the database
CREATE DATABASE WineShop2;
USE WineShop2;

-- Table for storing supplier details
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255) NOT NULL,
    contact_person VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(255),
    address TEXT
);

-- Table for storing wine details
CREATE TABLE Wines (
    wine_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255) NOT NULL,
    type VARCHAR(100) NOT NULL,  -- Red, White, Rose, Sparkling, etc.
    country VARCHAR(100),
    year INT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    image_url VARCHAR(255), -- URL for wine images
    description TEXT,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id) ON DELETE CASCADE
);

-- Table for storing customer details
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    created_at DATETIME DEFAULT GETDATE()
);

-- Table for storing order details
CREATE TABLE Orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT,
    order_date DATETIME DEFAULT GETDATE(),
    total_price DECIMAL(10,2),
    status VARCHAR(20) DEFAULT 'Pending',
    payment_status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- Table for storing order line items
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT,
    wine_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (wine_id) REFERENCES Wines(wine_id) ON DELETE CASCADE
);

-- Table for storing user sessions
CREATE TABLE Sessions (
    session_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT,
    session_token VARCHAR(255) UNIQUE NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    expires_at DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- Insert sample suppliers
INSERT INTO Suppliers (name, contact_person, phone, email, address) VALUES
('Vintage Wines Ltd.', 'John Smith', '123-456-7890', 'contact@vintagewines.com', '123 Vineyard Road, Napa Valley, CA'),
('Fine Grapes Distributors', 'Emma Brown', '987-654-3210', 'sales@finegrapes.com', '456 Winery Lane, Bordeaux, France'),
('Global Wine Merchants', 'Liam Garcia', '111-222-3333', 'info@globalwine.com', '789 Grape Ave, Tuscany, Italy');  -- Added supplier 3

-- Insert sample wines
INSERT INTO Wines (name, type, country, year, price, stock_quantity, image_url, description, supplier_id) VALUES
('Château Margaux', 'Red', 'France', 2018, 299.99, 50, 'url1.jpg', 'A classic Bordeaux with rich flavors.', 2),
('Silver Oak Cabernet', 'Red', 'USA', 2019, 129.99, 30, 'url2.jpg', 'A smooth and full-bodied California red.', 1),
('Moët & Chandon Brut', 'Sparkling', 'France', 2020, 89.99, 40, 'url3.jpg', 'A crisp and refreshing champagne.', 2),
('Penfolds Grange', 'Red', 'Australia', 2017, 599.99, 20, 'url4.jpg', 'An iconic Australian Shiraz with deep complexity.', 3),
('Cloudy Bay Sauvignon Blanc', 'White', 'New Zealand', 2021, 34.99, 60, 'url5.jpg', 'A zesty and aromatic white wine.', 2),
('Beringer Private Reserve Chardonnay', 'White', 'USA', 2020, 49.99, 25, 'url6.jpg', 'A creamy and oaky Napa Valley Chardonnay.', 1),
('Whispering Angel Rosé', 'Rosé', 'France', 2022, 27.99, 55, 'url7.jpg', 'A delicate and refreshing Provence rosé.', 2),
('Dom Pérignon Vintage', 'Sparkling', 'France', 2012, 199.99, 15, 'url8.jpg', 'A luxurious and well-aged champagne.', 2),
('Taylor Fladgate Vintage Port', 'Fortified', 'Portugal', 2016, 79.99, 35, 'url9.jpg', 'A rich and sweet vintage port.', 3),
('Tokaji Aszú 5 Puttonyos', 'Dessert', 'Hungary', 2018, 69.99, 25, 'url10.jpg', 'A luscious and honeyed dessert wine.', 3);

-- Insert sample customers
INSERT INTO Customers (name, email, password_hash, phone, address) VALUES
('Alice Johnson', 'alice@example.com', 'hashed_password_1', '555-111-2222', '789 Main St, New York, NY'),
('Bob Williams', 'bob@example.com', 'hashed_password_2', '555-333-4444', '456 Elm St, Los Angeles, CA');

-- Insert sample orders
INSERT INTO Orders (customer_id, order_date, total_price, status, payment_status) VALUES
(1, GETDATE(), 299.99, 'Shipped', 'Paid'),
(2, GETDATE(), 129.99, 'Pending', 'Unpaid');

-- Insert sample order details
INSERT INTO OrderDetails (order_id, wine_id, quantity, unit_price) VALUES
(1, 1, 1, 299.99),
(2, 2, 1, 129.99);

-- Insert sample sessions
INSERT INTO Sessions (customer_id, session_token, created_at, expires_at) VALUES
(1, 'session_token_123', GETDATE(), DATEADD(HOUR, 2, GETDATE())),
(2, 'session_token_456', GETDATE(), DATEADD(HOUR, 2, GETDATE()));

-- Verify data
SELECT * FROM Suppliers;
SELECT * FROM Wines;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Sessions;
