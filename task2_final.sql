
-- 🔹 Step 1: Insert into Customers
INSERT INTO Customers (Name, Email, Phone, Address) VALUES
('Niranjan Yash', 'niranjan@gmail.com', '9876543210', 'Mysuru'),
('Priya Sharma', 'priya@example.com', NULL, 'Bengaluru'),       -- NULL Phone
('Ravi Verma', 'ravi@example.com', '9988776655', NULL),         -- NULL Address
('Sneha Reddy', 'sneha@example.com', NULL, NULL);               -- NULL Phone and Address

-- 🔹 Step 2: Insert into Categories
INSERT INTO Categories (CategoryName) VALUES
('Electronics'),
('Clothing'),
('Books');

-- 🔹 Step 3: Insert into Products
INSERT INTO Products (ProductName, Price, Stock, CategoryID) VALUES
('Smartphone', 20000.00, 10, 1),
('T-Shirt', 599.00, DEFAULT, 2),       -- DEFAULT stock = 0
('Python Book', 899.00, 15, 3),
('Laptop', 55000.00, NULL, 1);         -- NULL Stock

-- 🔹 Step 4: Insert into Orders
INSERT INTO Orders (OrderDate, CustomersID, TotalAmount) VALUES
('2025-06-01', 1, 1200.00),
('2025-06-02', 2, NULL),               -- NULL TotalAmount
('2025-06-03', 3, 899.00),
('2025-06-04', 4, 20000.00);

-- 🔹 Step 5: Insert into OrderItems
INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price) VALUES
(1, 2, 2, 599.00),                    -- 2 T-Shirts
(3, 3, 1, 899.00),                   -- 1 Python Book
(4, 1, 1, 20000.00),                 -- 1 Smartphone
(4, 4, 1, 55000.00);                 -- 1 Laptop (Stock is NULL)

-- 🔹 Step 6: Insert into Payments
INSERT INTO Payments (OrderID, PaymentDate, Amount, PaymentMethod) VALUES
(1, '2025-06-01', 1200.00, 'UPI'),
(2, '2025-06-02', 1000.00, 'Cash'),      -- NULL Amount
(3, '2025-06-03', 899.00, NULL),      -- NULL PaymentMethod
(4, '2025-06-04', 20000.00, 'Credit Card');

-- ✅ UPDATES: Fix or complete NULL values

-- 1. Update NULL Phone
UPDATE Customers
SET Phone = '9900112233'
WHERE CustomersID = 2;

-- 2. Update NULL Address
UPDATE Customers
SET Address = 'Hyderabad'
WHERE CustomersID = 3;

-- 3. Update NULL stock for Laptop
UPDATE Products
SET Stock = 5
WHERE ProductID = 4;

-- 4. Update NULL TotalAmount in Orders
UPDATE Orders
SET TotalAmount = 1500.00
WHERE OrderID = 2;

-- 5. Update NULL Payment Amount
UPDATE Payments
SET Amount = 1500.00
WHERE OrderID = 2;

-- 6. Update NULL Payment Method
UPDATE Payments
SET PaymentMethod = 'Net Banking'
WHERE OrderID = 3;

-- ✅ DELETE: Clean unwanted or bad records

-- 1. Delete customers who have no address
SET SQL_SAFE_UPDATES = 0;

DELETE FROM Customers
WHERE CustomersID IN (3, 4);

SET SQL_SAFE_UPDATES = 1;

-- 2. Delete payments where Amount is still NULL (extra safety)
DELETE FROM Payments
WHERE Amount IS NULL;

-- ✅ SELECT: NULL Handling Example

-- Show customer names with "No Phone" where phone is missing
SELECT Name, COALESCE(Phone, 'No Phone') AS PhoneNumber
FROM Customers;

-- Show all payments with missing PaymentMethod
SELECT * FROM Payments
WHERE PaymentMethod IS NULL;
