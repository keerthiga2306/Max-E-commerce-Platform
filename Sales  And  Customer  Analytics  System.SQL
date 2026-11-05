SQL> SELECT COUNT(*) AS Total_Orders
  2  FROM Orders;

TOTAL_ORDERS
------------
           3

SQL> SELECT SUM(Subtotal) AS Total_Sales
  2  FROM Order_Details;

TOTAL_SALES
-----------
   11000.00

SQL> SELECT AVG(Order_Amount) AS Average_Order_Amount
  2  FROM (
  3      SELECT Order_ID,
  4             SUM(Subtotal) AS Order_Amount
  5      FROM Order_Details
  6      GROUP BY Order_ID
  7  );

AVERAGE_ORDER_AMOUNT
--------------------
             3666.67

SQL> SELECT MIN(Order_Amount) AS Lowest_Order_Amount
  2  FROM (
  3      SELECT Order_ID,
  4             SUM(Subtotal) AS Order_Amount
  5      FROM Order_Details
  6      GROUP BY Order_ID
  7  );

LOWEST_ORDER_AMOUNT
-------------------
            1500.00

SQL> SELECT MAX(Order_Amount) AS Highest_Order_Amount
  2  FROM (
  3      SELECT Order_ID,
  4             SUM(Subtotal) AS Order_Amount
  5      FROM Order_Details
  6      GROUP BY Order_ID
  7  );

HIGHEST_ORDER_AMOUNT
--------------------
             5000.00

SQL> SELECT SUM(Subtotal) AS Total_Sales
  2  FROM Order_Details;

TOTAL_SALES
-----------
   11000.00

SQL> SELECT C.Customer_ID,
  2         C.Customer_Name,
  3         SUM(D.Subtotal) AS Total_Purchase
  4  FROM Customer C
  5  JOIN Orders O
  6  ON C.Customer_ID = O.Customer_ID
  7  JOIN Order_Details D
  8  ON O.Order_ID = D.Order_ID
  9  GROUP BY C.Customer_ID, C.Customer_Name
 10  ORDER BY Total_Purchase DESC;

CUSTOMER_ID CUSTOMER_NAME        TOTAL_PURCHASE
----------- -------------------- --------------
          1 Keerthi                     5000.00
          2 Priya                       4500.00
          3 Divya                       1500.00

SQL> SELECT C.Customer_ID,
  2         C.Customer_Name,
  3         SUM(D.Subtotal) AS Total_Purchase
  4  FROM Customer C
  5  JOIN Orders O
  6  ON C.Customer_ID = O.Customer_ID
  7  JOIN Order_Details D
  8  ON O.Order_ID = D.Order_ID
  9  GROUP BY C.Customer_ID, C.Customer_Name
 10  ORDER BY Total_Purchase DESC;

CUSTOMER_ID CUSTOMER_NAME        TOTAL_PURCHASE
----------- -------------------- --------------
          1 Keerthi                     5000.00
          2 Priya                       4500.00
          3 Divya                       1500.00

SQL> SELECT P.Product_ID,
  2         P.Product_Name,
  3         SUM(D.Quantity) AS Total_Quantity_Sold
  4  FROM Product P
  5  JOIN Order_Details D
  6  ON P.Product_ID = D.Product_ID
  7  GROUP BY P.Product_ID, P.Product_Name
  8  ORDER BY Total_Quantity_Sold DESC;

PRODUCT_ID PRODUCT_NAME                   TOTAL_QUANTITY_SOLD
---------- ------------------------------ -------------------
       105 Sports Shoes                                     3
       101 Women Kurti                                      2
       103 Kids T-Shirt                                     2
       104 Women Jeans                                      1
       102 Men Shirt                                        1

SQL> SELECT P.Product_ID,
  2         P.Product_Name,
  3         SUM(D.Quantity) AS Total_Quantity_Sold,
  4         SUM(D.Subtotal) AS Total_Sales_Amount
  5  FROM Product P
  6  JOIN Order_Details D
  7  ON P.Product_ID = D.Product_ID
  8  GROUP BY P.Product_ID, P.Product_Name
  9  ORDER BY Total_Sales_Amount DESC;

PRODUCT_ID PRODUCT_NAME                   TOTAL_QUANTITY_SOLD TOTAL_SALES_AMOUNT
---------- ------------------------------ ------------------- ------------------
       101 Women Kurti                                      2           3000.00
       104 Women Jeans                                      1           2500.00
       102 Men Shirt                                        1           2000.00
       103 Kids T-Shirt                                     2           2000.00
       105 Sports Shoes                                     3           1500.00

SQL> SELECT P.Category,
  2         SUM(D.Quantity) AS Total_Quantity_Sold,
  3         SUM(D.Subtotal) AS Total_Sales
  4  FROM Product P
  5  JOIN Order_Details D
  6  ON P.Product_ID = D.Product_ID
  7  GROUP BY P.Category
  8  ORDER BY Total_Sales DESC;

CATEGORY             TOTAL_QUANTITY_SOLD TOTAL_SALES
-------------------- ------------------- -----------
Women                                  3     5500.00
Men                                    1     2000.00
Kids                                   2     2000.00
Footwear                               3     1500.00

SQL> SELECT C.Customer_ID,
  2         C.Customer_Name,
  3         O.Order_ID,
  4         P.Product_ID,
  5         P.Product_Name,
  6         P.Category,
  7         D.Quantity,
  8         D.Unit_Price,
  9         D.Subtotal
 10  FROM Customer C
 11  JOIN Orders O
 12  ON C.Customer_ID = O.Customer_ID
 13  JOIN Order_Details D
 14  ON O.Order_ID = D.Order_ID
 15  JOIN Product P
 16  ON D.Product_ID = P.Product_ID
 17  ORDER BY C.Customer_ID;

CUSTOMER_ID CUSTOMER_NAME          ORDER_ID PRODUCT_ID PRODUCT_NAME          CATEGORY              QUANTITY UNIT_PRICE   SUBTOTAL
----------- -------------------- ---------- ---------- ------------------------------ -------------------- -------- ---------- ----------
          1 Keerthi                    1001        101 Women Kurti           Women                        2       1500    3000.00
          1 Keerthi                    1001        102 Men Shirt             Men                          1       2000    2000.00
          2 Priya                      1002        103 Kids T-Shirt          Kids                         2       1000    2000.00
          2 Priya                      1002        104 Women Jeans           Women                        1       2500    2500.00
          3 Divya                      1003        105 Sports Shoes          Footwear                     3        500    1500.00
