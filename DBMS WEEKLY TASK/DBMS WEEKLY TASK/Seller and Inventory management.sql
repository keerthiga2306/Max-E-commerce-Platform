
SQL> CREATE TABLE Seller (
  2      Seller_ID INT PRIMARY KEY,
  3      Seller_Name VARCHAR2(100) NOT NULL,
  4      Email VARCHAR2(100) UNIQUE,
  5      Phone VARCHAR2(15),
  6      City VARCHAR2(50)
  7  );

Table created.

SQL> INSERT INTO Seller VALUES
  2  (101, 'MAX Chennai', 'chennai@max.com', '9876543210', 'T. Nagar, Chennai');

1 row created.

SQL>
SQL> INSERT INTO Seller VALUES
  2  (102, 'MAX Velachery', 'velachery@max.com', '9876543211', 'Phoenix Mall, Chennai');

1 row created.

SQL>
SQL> INSERT INTO Seller VALUES
  2  (103, 'MAX Anna Nagar', 'annanagar@max.com', '9876543212', 'Anna Nagar, Chennai');

1 row created.

SQL>
SQL> INSERT INTO Seller VALUES
  2  (104, 'MAX Tambaram', 'tambaram@max.com', '9876543213', 'Tambaram, Chennai');

1 row created.

SQL>
SQL> INSERT INTO Seller VALUES
  2  (105, 'MAX Express Avenue', 'ea@max.com', '9876543214', 'Royapettah, Chennai');

1 row created.


SQL> CREATE TABLE Inventory (
  2      Inventory_ID INT PRIMARY KEY,
  3      Product_ID INT,
  4      Seller_ID INT,
  5      Stock_Quantity INT NOT NULL,
  6      Stock_Status VARCHAR2(20) NOT NULL,
  7      Last_Updated DATE NOT NULL,
  8      CONSTRAINT fk_product
  9          FOREIGN KEY (Product_ID)
 10          REFERENCES Product(Product_ID),
 11      CONSTRAINT fk_seller
 12          FOREIGN KEY (Seller_ID)
 13          REFERENCES Seller(Seller_ID)
 14  );

Table created.

SQL> INSERT INTO Inventory VALUES (501,101,101,25,'Available',SYSDATE);

1 row created.

SQL> INSERT INTO Inventory VALUES (502,102,102,40,'Available',SYSDATE);

1 row created.

SQL> INSERT INTO Inventory VALUES (503,103,103,18,'Available',SYSDATE);

1 row created.

SQL> INSERT INTO Inventory VALUES (504,104,104,12,'Available',SYSDATE);

1 row created.

SQL> INSERT INTO Inventory VALUES (505,105,105,0,'Unavailable',SYSDATE);

1 row created.

SQL> SELECT * FROM Inventory;

INVENTORY_ID PRODUCT_ID  SELLER_ID STOCK_QUANTITY STOCK_STATUS         LAST_UPDA
------------ ---------- ---------- -------------- -------------------- ---------
         501        101        101             25 Available            09-OCT-26
         502        102        102             40 Available            09-OCT-26
         503        103        103             18 Available            09-OCT-26
         504        104        104             12 Available            09-OCT-26
         505        105        105              0 Unavailable          09-OCT-26

SQL> COMMIT;


SQL> SELECT
  2      s.Seller_Name,
  3      p.Product_Name,
  4      p.Category,
  5      p.Price,
  6      i.Stock_Quantity,
  7      i.Stock_Status
  8  FROM Seller s
  9  JOIN Inventory i
 10  ON s.Seller_ID = i.Seller_ID
 11  JOIN Product p
 12  ON p.Product_ID = i.Product_ID;

SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_NAME
--------------------------------------------------------------------------------
CATEGORY                                                PRICE STOCK_QUANTITY
-------------------------------------------------- ---------- --------------
STOCK_STATUS
--------------------
MAX Chennai
Women Kurti
Women                                                     999            25
Available


SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_NAME
--------------------------------------------------------------------------------
CATEGORY                                                PRICE STOCK_QUANTITY
-------------------------------------------------- ---------- --------------
STOCK_STATUS
--------------------
MAX Velachery
Men Shirt
Men                                                      1299            40
Available


SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_NAME
--------------------------------------------------------------------------------
CATEGORY                                                PRICE STOCK_QUANTITY
-------------------------------------------------- ---------- --------------
STOCK_STATUS
--------------------
MAX Anna Nagar
Kids T-Shirt
Kids                                                      499            18
Available


SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_NAME
--------------------------------------------------------------------------------
CATEGORY                                                PRICE STOCK_QUANTITY
-------------------------------------------------- ---------- --------------
STOCK_STATUS
--------------------
MAX Tambaram
Women Jeans
Women                                                    1599            12
Available


SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_NAME
--------------------------------------------------------------------------------
CATEGORY                                                PRICE STOCK_QUANTITY
-------------------------------------------------- ---------- --------------
STOCK_STATUS
--------------------
MAX Express Avenue
Sports Shoes
Footwear                                                 2499             0
Unavailable


SQL> SELECT p.Product_Name, i.Stock_Quantity
  2  FROM Product p
  3  JOIN Inventory i
  4  ON p.Product_ID = i.Product_ID
  5  WHERE i.Stock_Status='Available';

PRODUCT_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY
--------------
Women Kurti
            25

Men Shirt
            40

Kids T-Shirt
            18


PRODUCT_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY
--------------
Women Jeans
            12


SQL> SELECT p.Product_Name
  2  FROM Product p
  3  JOIN Inventory i
  4  ON p.Product_ID=i.Product_ID
  5  WHERE i.Stock_Status='Unavailable';

PRODUCT_NAME
--------------------------------------------------------------------------------
Sports Shoes

SQL> UPDATE Inventory
  2  SET Stock_Quantity = 35,
  3      Stock_Status = 'Available',
  4      Last_Updated = SYSDATE
  5  WHERE Inventory_ID = 505;

1 row updated.

SQL>
SQL> SELECT * FROM Inventory
  2  WHERE Inventory_ID = 505;

INVENTORY_ID PRODUCT_ID  SELLER_ID STOCK_QUANTITY STOCK_STATUS         LAST_UPDA
------------ ---------- ---------- -------------- -------------------- ---------
         505        105        105             35 Available            09-OCT-26

SQL> SELECT * FROM Inventory
  2  WHERE Inventory_ID = 505;

INVENTORY_ID PRODUCT_ID  SELLER_ID STOCK_QUANTITY STOCK_STATUS         LAST_UPDA
------------ ---------- ---------- -------------- -------------------- ---------
         505        105        105             35 Available            09-OCT-26

SQL>
SQL> SELECT * FROM Inventory;

INVENTORY_ID PRODUCT_ID  SELLER_ID STOCK_QUANTITY STOCK_STATUS         LAST_UPDA
------------ ---------- ---------- -------------- -------------------- ---------
         501        101        101             25 Available            09-OCT-26
         502        102        102             40 Available            09-OCT-26
         503        103        103             18 Available            09-OCT-26
         504        104        104             12 Available            09-OCT-26
         505        105        105             35 Available            09-OCT-26

SQL> SELECT
  2      Stock_Status,
  3      COUNT(*) AS Total_Products
  4  FROM Inventory
  5  GROUP BY Stock_Status;

STOCK_STATUS         TOTAL_PRODUCTS
-------------------- --------------
Available                         5

SQL> SELECT
  2      Seller_ID,
  3      SUM(Stock_Quantity) AS Total_Stock
  4  FROM Inventory
  5  GROUP BY Seller_ID
  6  ORDER BY Seller_ID;

 SELLER_ID TOTAL_STOCK
---------- -----------
       101          25
       102          40
       103          18
       104          12
       105          35

SQL> SELECT
  2      Product_ID,
  3      Stock_Quantity,
  4      Stock_Status
  5  FROM Inventory
  6  WHERE Stock_Quantity = 0;

no rows selected

SQL> COMMIT;

Commit complete.
