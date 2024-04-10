USE `classicmodels`;

SELECT productName Name, productLine "Product Line", buyPrice "Buy Price"
FROM products
ORDER BY 3 DESC;

SELECT contactFirstName "First Name", contactLastName "Last Name", City
FROM customers
WHERE country LIKE "Germany"
ORDER BY 2 ASC;

SELECT Status FROM orders
GROUP BY Status
ORDER BY 1 ASC; 

SELECT * FROM payments
WHERE paymentDate >= "2005-01-01"
ORDER BY paymentDate DESC;

/* NOTE: using `WHERE officeCode = 1` yields the same result */
SELECT lastName "Last Name", firstName "First Name", email "Email Address", jobTitle "Job Title"
FROM employees
WHERE officeCode = (
	SELECT officeCode FROM offices WHERE city LIKE "San Francisco" 
)
ORDER BY 1;

SELECT productName "Name", productLine "Product Line", productScale "Scale", productVendor "Vendor"
FROM products
WHERE productLine LIKE "vintage%" OR productLine LIKE "classic%"
ORDER BY 2 DESC, 1 ASC;  
