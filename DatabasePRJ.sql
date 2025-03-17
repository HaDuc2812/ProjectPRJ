-- Drop the database if it exists
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'WineShop1')
BEGIN
    DROP DATABASE WineShop2;
END

-- Create the database
CREATE DATABASE WineShop2;
USE WineShop2;
CREATE VIEW dbo.Product AS
SELECT
    wine_id AS product_id,
    name,
    price,
    stock_quantity,        -- This column shows the current inventory from Wines.
    description,
    country,
    year,
    image_url,
    0 AS quantity          -- This is a separate column for product quantity (e.g., for orders).
FROM dbo.Wines;


-- Table for storing supplier details
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255) NOT NULL,
    contact_person VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(255),
    address TEXT
);

-- Table for storing wine categories
CREATE TABLE Categories (
    category_id INT PRIMARY KEY IDENTITY(1,1),
    category_name VARCHAR(100) NOT NULL,
    category_description TEXT
);

-- Table for storing wine details
CREATE TABLE Wines (
    wine_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    country VARCHAR(100),
    year INT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    image_url VARCHAR(255), -- URL for wine images
    description nvarchar(255),
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE CASCADE
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

-- Table for storing account details
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY IDENTITY(1,1),
	email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
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
('Global Wine Merchants', 'Liam Garcia', '111-222-3333', 'info@globalwine.com', '789 Grape Ave, Tuscany, Italy');

-- Insert sample categories (wine types)
INSERT INTO Categories (category_name, category_description) VALUES
('Red', 'Red wines are made from dark-colored grape varieties.'),
('White', 'White wines are made from green or yellow grapes.'),
('Sparkling', 'Sparkling wines contain significant levels of carbon dioxide.'),
('Rosé', 'Rosé wines incorporate some of the color from the grape skins.'),
('Fortified', 'Fortified wines have had a distilled spirit added.'),
('Dessert', 'Dessert wines are sweet wines often served with dessert.');

-- Insert sample wines with category_id values (mapping the original type to a category):
-- Category mapping:
-- Red = 1, White = 2, Sparkling = 3, Rosé = 4, Fortified = 5, Dessert = 6
INSERT INTO Wines (name, category_id, country, year, price, stock_quantity, image_url, description, supplier_id) VALUES
('Château Margaux', 1, 'France', 2018, 299.99, 50, 'url1.jpg', 'A classic Bordeaux with rich flavors.', 2),
('Silver Oak Cabernet', 1, 'USA', 2019, 129.99, 30, 'url2.jpg', 'A smooth and full-bodied California red.', 1),
('Moët & Chandon Brut', 3, 'France', 2020, 89.99, 40, 'url3.jpg', 'A crisp and refreshing champagne.', 2),
('Penfolds Grange', 1, 'Australia', 2017, 599.99, 20, 'url4.jpg', 'An iconic Australian Shiraz with deep complexity.', 3),
('Cloudy Bay Sauvignon Blanc', 2, 'New Zealand', 2021, 34.99, 60, 'url5.jpg', 'A zesty and aromatic white wine.', 2),
('Beringer Private Reserve Chardonnay', 2, 'USA', 2020, 49.99, 25, 'url6.jpg', 'A creamy and oaky Napa Valley Chardonnay.', 1),
('Whispering Angel Rosé', 4, 'France', 2022, 27.99, 55, 'url7.jpg', 'A delicate and refreshing Provence rosé.', 2),
('Dom Pérignon Vintage', 3, 'France', 2012, 199.99, 15, 'url8.jpg', 'A luxurious and well-aged champagne.', 2),
('Taylor Fladgate Vintage Port', 5, 'Portugal', 2016, 79.99, 35, 'url9.jpg', 'A rich and sweet vintage port.', 3),
('Tokaji Aszú 5 Puttonyos', 6, 'Hungary', 2018, 69.99, 25, 'url10.jpg', 'A luscious and honeyed dessert wine.', 3);

-- Insert sample customers
INSERT INTO Customers (name, email, password_hash, phone, address) VALUES
('Alice Johnson', 'alice@example.com', 'hashed_password_1', '555-111-2222', '789 Main St, New York, NY'),
('Bob Williams', 'bob@example.com', 'hashed_password_2', '555-333-4444', '456 Elm St, Los Angeles, CA');

--Insert sample accounts
INSERT INTO Accounts (email, password_hash, phone) VALUES
('alice@example.com', 'hashed_password_1', '555-111-2222'),
('bob@example.com', 'hashed_password_2', '555-333-4444');

drop table accounts;


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
SELECT * FROM Categories;
SELECT * FROM Wines;
SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Sessions;
SELECT w.wine_id, w.name, w.country, w.year, w.price, w.stock_quantity,  
                       w.image_url, w.description, w.supplier_id, w.category_id, 
                       FROM Wines w
                       INNER JOIN Categories c ON w.category_id = c.category_id 
                       WHERE c.category_id = ?
SELECT * FROM Categories WHERE category_name = 'Red';
SELECT * FROM Wines WHERE [name] = '%si%';
SELECT * FROM Wines WHERE category_id = ?;
select * from Wines where wine_id=1
select * from Wines wi where wi.name like '%Sil%'
SELECT * FROM dbo.Product;
UPDATE Wines
SET image_url = 'https://www.topwine.com.vn/uploads/product/2024_03/chateau-margaux.jpg'
WHERE [name] = 'Château Margaux';

UPDATE Wines
SET image_url = 'https://www.topwine.com.vn/uploads/product/2021_04/Silver-Oak-2013.png'
WHERE [name] = 'Silver Oak Cabernet';
UPDATE Wines
SET image_url = 'https://winepro.vn/upload/sanpham/ruou-moet-&-chandon-imperial-brut-3427.png'
WHERE [name] = 'Moët & Chandon Brut';
UPDATE Wines
SET image_url = 'https://sanhruou.com/media/12148/catalog/Cloudy-Bay-Sauvignon-Blanc.jpg'
WHERE [name] = 'Cloudy Bay Sauvignon Blanc';
UPDATE Wines
SET image_url = 'https://maltco.asia/wp-content/uploads/2022/05/PENFOLDS-BIN-95-GRANGE.jpg'
WHERE [name] = 'Penfolds Grange';
UPDATE Wines
SET image_url = 'https://www.thebottleshop.asia/wp-content/uploads/2021/12/TBS-V-Beringer_Private_Reserve_Chardonnay.jpg'
WHERE [name] = 'Beringer Private Reserve Chardonnay';
UPDATE Wines
SET image_url = 'https://cdn11.bigcommerce.com/s-f5vya34ro0/images/stencil/1280x1280/products/6011/1495/188f3a2a-f2d9-4499-adf1-a7f1c45861a5__67254.1674943318.jpg?c=1'
WHERE [name] = 'Whispering Angel Rosé';
UPDATE Wines
SET image_url = 'https://winecellar.vn/wp-content/uploads/2023/05/dom-perignon.jpg'
WHERE [name] = 'Dom Pérignon Vintage';
UPDATE Wines
SET image_url = 'https://www.wine-searcher.com/images/labels/14/85/11631485.jpg'
WHERE [name] = 'Taylor Fladgate Vintage Port';
UPDATE Wines
SET image_url = 'https://product.hstatic.net/200000692767/product/0901407.16_d151c9a5649540f0b16f90369be2a042.png'
WHERE [name] = 'Tokaji Aszú 5 Puttonyos';

