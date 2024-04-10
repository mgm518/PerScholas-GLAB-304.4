# 304.3 - Data Definition Language and Data Integrity & 304.4 - SQL Clauses

The objective is to learn SQL queries by using clauses to organize or filter the resulting table.  A prerequisite for for both [GLAB 304.4.1](Docs/GLAB%20304.4.1%20-%20ORDER%20BY%20Clause.pdf) and [PA 304.4.1](#pa-30441) is to have **[classicmodels](sql/classicmodels.sql)** setup before hand.

## [PA 304.4.1](Docs/PA%20304.4.1%20-%20Simple%20Queries.pdf)

The SQL script [Mark_McGuire_pa304.4.1_SimpleQueries.sql](sql/Mark_McGuire_pa304.4.1_SimpleQueries.sql) contains the queries for following problems, but I will also try to provide those queries and a sample of the resulting tables within this markdown as a means of practicing the documentation and formatting.

1. Display the **name**, **product line**, and **buy price** of all products. The output columns should display as: “Name,” “Product Line,” and “Buy Price.” The output should display the most expensive items first.

    ```sql
    SELECT productName Name, productLine "Product Line", buyPrice "Buy Price"
    FROM products
    ORDER BY 3 DESC;
    ```

    Name | Product Line | Buy Price
    --- | --- | ---
    1962 LanciaA Delta 16V | Classic Cars | 103.42
    1998 Chrysler Plymouth Prowler | Classic Cars | 101.51
    1952 Alpine Renault 1300 | Classic Cars | 98.58
    1956 Porsche 356A Coupe | Classic Cars | 98.30
    2001 Ferrari Enzo | Classic Cars | 95.59
    1968 Ford Mustang | Classic Cars | 95.34
    1995 Honda Civic | Classic Cars | 93.89
    ... | ... | ...

1. Display the **first name**, **last name**, and **city name** of all customers from Germany. The output columns should display as: “First Name,” “Last Name,” and “City.” The output should be sorted by “Last Name” (ascending).

    ```sql
    SELECT contactFirstName "First Name", contactLastName "Last Name", City
    FROM customers
    WHERE country LIKE "Germany"
    ORDER BY 2 ASC;
    ```

    First Name | Last Name | City
    --- | --- | ---
    Mel | Andersen | Berlin
    Philip | Cramer | Brandenburg
    Michael | Donnermeyer | Munich
    Alexander | Feuer | Leipzig
    Peter | Franken | München
    Karin | Josephs | Münster
    Roland | Keitel | Frankfurt
    Horst | Kloss | Cunewalde
    Renate | Messner | Frankfurt
    Hanna | Moos | Mannheim
    Rita | Müller | Stuttgart
    Sven | Ottlieb | Aachen
    Henriette | Pfalzheim | Köln

1. Display **each of the unique values of the status field** in the orders table. The output should be sorted alphabetically, ascending.
    1. Hint: The output should show exactly six rows

    ```sql
    SELECT Status FROM orders
    GROUP BY Status
    ORDER BY 1 ASC; 
    ```

    |Status|
    |---|
    |Cancelled|
    |Disputed|
    |In Process|
    |On Hold|
    |Resolved|
    |Shipped|

1. Display **all fields** from the payments table for payments made on or after January 1, 2005. The output should be sorted by the payment date from highest to lowest.

    ```sql
    SELECT * FROM payments
    WHERE paymentDate >= "2005-01-01"
    ORDER BY paymentDate DESC;
    ```

    customerNumber | checkNumber | paymentDate | amount
    --- | --- | --- | ---
    353 | HJ618252 | 2005-06-09 | 46656.94
    242 | HR224331 | 2005-06-03 | 12432.32
    496 | EU531600 | 2005-05-25 | 30253.75
    323 | AL493079 | 2005-05-23 | 75020.13
    233 | BOFA23232 | 2005-05-20 | 29070.38
    141 | DL460618 | 2005-05-19 | 46895.48
    175 | CITI3434344 | 2005-05-19 | 28500.78
    398 | JPMR4544 | 2005-05-18 | 615.45
    ... | ... | ... | ...

1. Display the **last Name**, **first Name**, **email address**, and **job title** of all employees working out of the San Francisco office. The output should be sorted by “Last Name.”

    ```sql
    /* NOTE: using `WHERE officeCode = 1` yields the same result */
    SELECT lastName "Last Name", firstName "First Name", email "Email Address", jobTitle "Job Title"
    FROM employees
    WHERE officeCode = (
      SELECT officeCode FROM offices WHERE city LIKE "San Francisco" 
    )
    ORDER BY 1;
    ```

    Last Name | First Name | Email Address | Job Title
    --- | --- | --- | ---
    Bow | Anthony | `abow@classicmodelcars.com` | Sales Manager (NA)
    Firrelli | Jeff | `jfirrelli@classicmodelcars.com` | VP Marketing
    Jennings | Leslie | `ljennings@classicmodelcars.com` | Sales Rep
    Murphy | Diane | `dmurphy@classicmodelcars.com` | President
    Patterson | Mary | `mpatterso@classicmodelcars.com` | VP Sales
    Thompson | Leslie | `lthompson@classicmodelcars.com` | Sales Rep

1. Display the **name**, **product line**, **scale**, and **vendor** of all of the car products – both classic and vintage. The output should display all vintage cars first (sorted alphabetically by name), and all classic cars last (also sorted alphabetically by name).

    ```sql
    SELECT
      productName "Name",
      productLine "Product Line",
      productScale "Scale",
      productVendor "Vendor"
    FROM products
    WHERE productLine LIKE "vintage%" OR productLine LIKE "classic%"
    ORDER BY 2 DESC, 1 ASC;  
    ```

    Name | Product Line | Scale | Vendor
    --- | --- | --- | ---
    18th Century Vintage Horse Carriage | Vintage Cars | 1:18 | Red Start Diecast
    1903 Ford Model A | Vintage Cars | 1:18 | Unimax Art Galleries
    1904 Buick Runabout | Vintage Cars | 1:18 | Exoto Designs
    1911 Ford Town Car | Vintage Cars | 1:18 | Motor City Art Classics
    1912 Ford Model T Delivery Wagon | Vintage Cars | 1:24 | Min Lin Diecast
    ... | ... | ... | ...
    1948 Porsche 356-A Roadster | Classic Cars | 1:18 | Gearbox Collectibles
    1948 Porsche Type 356 Roadster | Classic Cars | 1:18 | Gearbox Collectibles
    1949 Jaguar XK 120 | Classic Cars | 1:24 | Classic Metal Creations
    1952 Alpine Renault 1300 | Classic Cars | 1:10 | Classic Metal Creations
    1952 Citroen-15CV | Classic Cars | 1:24 | Exoto Designs
    ... | ... | ... | ...
