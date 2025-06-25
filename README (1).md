
# Task 2 – Data Insertion and Null Handling (SQL Developer Internship)

## 🎯 Objective
Practice inserting, updating, and deleting data while handling NULLs and DEFAULT values in a structured database.

This task covers DML operations using SQL including:
- `INSERT INTO`
- `UPDATE`
- `DELETE`
- `COALESCE()` for NULL handling in `SELECT`

---

## 📦 Tables Used

1. **Customers**
2. **Categories**
3. **Products**
4. **Orders**
5. **OrderItems**
6. **Payments**

---

## 🧪 Data Actions Performed

### 🔹 Step 1: Insert Data

- Inserted records into all 6 tables
- Used `NULL` and `DEFAULT` where appropriate
- Included realistic data such as products, customers, and orders

### 🔹 Step 2: Update NULL Values

- Updated missing phone, address, stock, total amount, and payment details using `UPDATE`

### 🔹 Step 3: Delete Unwanted Data

- Deleted customers with NULL addresses
- Deleted payment entries with NULL amount (if any)
- Used `SET SQL_SAFE_UPDATES = 0` to allow deletion with WHERE clauses

### 🔹 Step 4: NULL Handling in SELECT

- Used `COALESCE()` to display user-friendly values for NULL fields in reports

---

## 📌 Example Queries

### ✅ Replace NULL with readable text
```sql
SELECT Name, COALESCE(Phone, 'No Phone') AS PhoneNumber
FROM Customers;
```

### ✅ Safe DELETE
```sql
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Customers WHERE CustomersID IN (3, 4);
SET SQL_SAFE_UPDATES = 1;
```

---

## 🛠 Tools Used

- MySQL Workbench