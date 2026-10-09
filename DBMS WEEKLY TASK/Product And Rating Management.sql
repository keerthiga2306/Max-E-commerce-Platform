SQL> CREATE TABLE Review (
  2      Review_ID NUMBER PRIMARY KEY,
  3      Customer_ID NUMBER REFERENCES Customer(Customer_ID),
  4      Product_ID NUMBER REFERENCES Product(Product_ID),
  5      Review_Text VARCHAR2(500) NOT NULL,
  6      Review_Date DATE NOT NULL
  7  );

Table created.

SQL> INSERT INTO Review VALUES
  2  (1, 1, 101, 'Good quality kurti', DATE '2026-10-01');

1 row created.

SQL>
SQL> INSERT INTO Review VALUES
  2  (2, 2, 102, 'Nice shirt and good fitting', DATE '2026-10-02');

1 row created.

SQL>
SQL> INSERT INTO Review VALUES
  2  (3, 3, 103, 'Good material', DATE '2026-10-03');

1 row created.

SQL>
SQL> INSERT INTO Review VALUES
  2  (4, 4, 104, 'Comfortable jeans', DATE '2026-10-04');

1 row created.

SQL>
SQL> INSERT INTO Review VALUES
  2  (5, 5, 105, 'Good shoes', DATE '2026-10-05');

1 row created.

SQL>
SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Review;

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
         1           1        101
Good quality kurti
01-OCT-26

         2           2        102
Nice shirt and good fitting
02-OCT-26

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------

         3           3        103
Good material
03-OCT-26

         4           4        104
Comfortable jeans

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
04-OCT-26

         5           5        105
Good shoes
05-OCT-26


SQL> CREATE TABLE Rating (
  2      Rating_ID NUMBER PRIMARY KEY,
  3      Customer_ID NUMBER REFERENCES Customer(Customer_ID),
  4      Product_ID NUMBER REFERENCES Product(Product_ID),
  5      Rating NUMBER NOT NULL,
  6      Rating_Date DATE NOT NULL
  7  );

Table created.

SQL> INSERT INTO Rating VALUES
  2  (1, 1, 101, 5, DATE '2026-10-01');

1 row created.

SQL>
SQL> INSERT INTO Rating VALUES
  2  (2, 2, 102, 4, DATE '2026-10-02');

1 row created.

SQL>
SQL> INSERT INTO Rating VALUES
  2  (3, 3, 103, 4, DATE '2026-10-03');

1 row created.

SQL>
SQL> INSERT INTO Rating VALUES
  2  (4, 4, 104, 5, DATE '2026-10-04');

1 row created.

SQL>
SQL> INSERT INTO Rating VALUES
  2  (5, 5, 105, 5, DATE '2026-10-05');

1 row created.

SQL>
SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Rating;

 RATING_ID CUSTOMER_ID PRODUCT_ID     RATING RATING_DA
---------- ----------- ---------- ---------- ---------
         1           1        101          5 01-OCT-26
         2           2        102          4 02-OCT-26
         3           3        103          4 03-OCT-26
         4           4        104          5 04-OCT-26
         5           5        105          5 05-OCT-26

SQL> SELECT
  2      p.Product_Name,
  3      c.Customer_Name,
  4      r.Review_Text,
  5      r.Review_Date
  6  FROM Review r
  7  JOIN Customer c
  8  ON r.Customer_ID = c.Customer_ID
  9  JOIN Product p
 10  ON r.Product_ID = p.Product_ID;

PRODUCT_NAME
--------------------------------------------------------------------------------
CUSTOMER_NAME
--------------------------------------------------------------------------------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
Women Kurti
Keerthiga
Good quality kurti
01-OCT-26


PRODUCT_NAME
--------------------------------------------------------------------------------
CUSTOMER_NAME
--------------------------------------------------------------------------------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
Men Shirt
Keerthana
Nice shirt and good fitting
02-OCT-26


PRODUCT_NAME
--------------------------------------------------------------------------------
CUSTOMER_NAME
--------------------------------------------------------------------------------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
Kids T-Shirt
Mythili
Good material
03-OCT-26


PRODUCT_NAME
--------------------------------------------------------------------------------
CUSTOMER_NAME
--------------------------------------------------------------------------------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
Women Jeans
Harini
Comfortable jeans
04-OCT-26


PRODUCT_NAME
--------------------------------------------------------------------------------
CUSTOMER_NAME
--------------------------------------------------------------------------------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
Sports Shoes
Divya
Good shoes
05-OCT-26


SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      ROUND(AVG(r.Rating), 2) AS Average_Rating
  5  FROM Product p
  6  JOIN Rating r
  7  ON p.Product_ID = r.Product_ID
  8  GROUP BY p.Product_ID, p.Product_Name;

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
AVERAGE_RATING
--------------
       101
Women Kurti
             5

       102
Men Shirt
             4

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
AVERAGE_RATING
--------------

       103
Kids T-Shirt
             4

       104
Women Jeans

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
AVERAGE_RATING
--------------
             5

       105
Sports Shoes
             5


SQL> SELECT
  2      p.Product_Name,
  3      ROUND(AVG(r.Rating), 2) AS Average_Rating
  4  FROM Product p
  5  JOIN Rating r
  6  ON p.Product_ID = r.Product_ID
  7  GROUP BY p.Product_Name
  8  HAVING AVG(r.Rating) >= 4
  9  ORDER BY Average_Rating DESC;

PRODUCT_NAME
--------------------------------------------------------------------------------
AVERAGE_RATING
--------------
Women Jeans
             5

Women Kurti
             5

Sports Shoes
             5


PRODUCT_NAME
--------------------------------------------------------------------------------
AVERAGE_RATING
--------------
Men Shirt
             4

Kids T-Shirt
             4


SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      COUNT(r.Rating_ID) AS Total_Ratings,
  5      ROUND(AVG(r.Rating), 2) AS Average_Rating
  6  FROM Product p
  7  LEFT JOIN Rating r
  8  ON p.Product_ID = r.Product_ID
  9  GROUP BY p.Product_ID, p.Product_Name
 10  ORDER BY p.Product_ID;

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_RATINGS AVERAGE_RATING
------------- --------------
       101
Women Kurti
            1              5

       102
Men Shirt
            1              4

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_RATINGS AVERAGE_RATING
------------- --------------

       103
Kids T-Shirt
            1              4

       104
Women Jeans

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_RATINGS AVERAGE_RATING
------------- --------------
            1              5

       105
Sports Shoes
            1              5


SQL> COMMIT;

Commit complete.
