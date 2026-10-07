SQL> CREATE TABLE Category (
  2      Category_ID INT PRIMARY KEY,
  3      Category_Name VARCHAR(50) UNIQUE NOT NULL,
  4      Description VARCHAR(200)
  5  );

Table created.

SQL> INSERT INTO Category VALUES
  2  (101, 'Men Watches', 'Stylish watches for men');

1 row created.

SQL> INSERT INTO Category VALUES
  2  (102, 'Women Watches', 'Elegant watches for women');

1 row created.

SQL> INSERT INTO Category VALUES
  2  (103, 'Smart Watches', 'Digital and smart wearable watches');

1 row created.

SQL> INSERT INTO Category VALUES
  2  (104, 'Luxury Watches', 'Premium luxury watch collection');

1 row created.

SQL> CREATE TABLE Product (
  2      Product_ID INT PRIMARY KEY,
  3      Product_Name VARCHAR2(100) NOT NULL,
  4      Category_ID INT,
  5      Brand VARCHAR2(50),
  6      Price NUMBER(10,2),
  7      Stock INT NOT NULL,
  8      CONSTRAINT fk_category
  9          FOREIGN KEY (Category_ID)
 10          REFERENCES Category(Category_ID)
 11  );

Table created.

SQL> INSERT INTO Product
  2  VALUES (201, 'Titan Neo', 101, 'Titan', 4999, 25);

1 row created.

SQL> INSERT INTO Product
  2  VALUES (202, 'Fastrack Reflex', 103, 'Fastrack', 2999, 40);

1 row created.

SQL> INSERT INTO Product
  2  VALUES (203, 'Casio Vintage', 102, 'Casio', 3499, 18);

1 row created.

SQL> INSERT INTO Product
  2  VALUES (204, 'Fossil Grant', 104, 'Fossil', 8999, 12);

1 row created.

SQL> INSERT INTO Product
  2  VALUES (205, 'Sonata Classic', 101, 'Sonata', 1999, 30);

1 row created.

SQL> SELECT * FROM Category;

CATEGORY_ID CATEGORY_NAME
----------- --------------------------------------------------
DESCRIPTION
--------------------------------------------------------------------------------
        101 Men Watches
Stylish watches for men

        102 Women Watches
Elegant watches for women

        103 Smart Watches
Digital and smart wearable watches


CATEGORY_ID CATEGORY_NAME
----------- --------------------------------------------------
DESCRIPTION
--------------------------------------------------------------------------------
        104 Luxury Watches
Premium luxury watch collection



SQL> SELECT * FROM Product;

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
CATEGORY_ID BRAND                                                   PRICE
----------- -------------------------------------------------- ----------
     STOCK
----------
       201
Titan Neo
        101 Titan                                                    4999
        25


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
CATEGORY_ID BRAND                                                   PRICE
----------- -------------------------------------------------- ----------
     STOCK
----------
       202
Fastrack Reflex
        103 Fastrack                                                 2999
        40


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
CATEGORY_ID BRAND                                                   PRICE
----------- -------------------------------------------------- ----------
     STOCK
----------
       203
Casio Vintage
        102 Casio                                                    3499
        18


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
CATEGORY_ID BRAND                                                   PRICE
----------- -------------------------------------------------- ----------
     STOCK
----------
       204
Fossil Grant
        104 Fossil                                                   8999
        12


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
CATEGORY_ID BRAND                                                   PRICE
----------- -------------------------------------------------- ----------
     STOCK
----------
       205
Sonata Classic
        101 Sonata                                                   1999
        30


SQL> UPDATE Product
  2  SET Price = 5499
  3  WHERE Product_ID = 201;

1 row updated.

  
SQL> DELETE FROM Product
  2  WHERE Product_ID = 205;

1 row deleted.


  SQL> SELECT
  2      Category_ID,
  3      COUNT(*) AS Total_Products,
  4      SUM(Price) AS Total_Price,
  5      AVG(Price) AS Average_Price
  6  FROM Product
  7  GROUP BY Category_ID
  8  ORDER BY Category_ID;

CATEGORY_ID TOTAL_PRODUCTS TOTAL_PRICE AVERAGE_PRICE
----------- -------------- ----------- -------------
        101              1        5499          5499
        102              1        3499          3499
        103              1        2999          2999
        104              1        8999          8999



SQL> SELECT
  2      Category_ID,
  3      COUNT(Product_ID) AS Total_Products
  4  FROM Product
  5  GROUP BY Category_ID
  6  ORDER BY Category_ID;

CATEGORY_ID TOTAL_PRODUCTS
----------- --------------
        101              1
        102              1
        103              1
        104              1

