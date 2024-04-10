USE classicmodels;

-- Example 1: Sort a result set by an expression
SELECT 
	orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach subtotal
FROM orderdetails
ORDER BY quantityOrdered * priceEach DESC;

-- Example 2: MySQL ORDER BY and NULL Values
-- 		NULL values are always less than non-NULL values
SELECT firstName, lastName, reportsTo
FROM employees
ORDER BY reportsTo;