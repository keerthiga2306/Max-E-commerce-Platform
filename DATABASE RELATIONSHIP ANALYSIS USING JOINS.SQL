SQL> SELECT C.Customer_ID,
  2         C.Customer_Name,
  3         O.Order_ID,
  4         P.Product_Name,
  5         D.Quantity,
  6         D.Subtotal
  7  FROM Customer C
  8  JOIN Orders O
  9  ON C.Customer_ID = O.Customer_ID
 10  JOIN Order_Details D
 11  ON O.Order_ID = D.Order_ID
 12  JOIN Product P
 13  ON D.Product_ID = P.Product_ID
 14  ORDER BY C.Customer_ID;

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL
---------- ----------
          1
Keerthi
      1001

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL
---------- ----------
Women Kurti
         2       3000


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL
---------- ----------
          1
Keerthi
      1001

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL
---------- ----------
Men Shirt
         1       2000


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL
---------- ----------
          2
Priya
      1002

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL
---------- ----------
Kids T-Shirt
         2       2000


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL
---------- ----------
          2
Priya
      1002

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL
---------- ----------
Women Jeans
         1       2500


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL
---------- ----------
          3
Divya
      1003

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL
---------- ----------
Sports Shoes
         3       1500


SQL> SELECT C.Customer_ID,
  2         C.Customer_Name,
  3         C.Email,
  4         O.Order_ID
  5  FROM Customer C
  6  INNER JOIN Orders O
  7  ON C.Customer_ID = O.Customer_ID
  8  ORDER BY C.Customer_ID;

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
  ORDER_ID
----------
          1
Keerthi
keerthi@gmail.com
      1001


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
  ORDER_ID
----------
          2
Priya
priya@gmail.com
      1002


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
  ORDER_ID
----------
          3
Divya
divya@gmail.com
      1003


SQL> SELECT O.Order_ID,
  2         P.Payment_ID,
  3         P.Payment_Mode,
  4         P.Payment_Date,
  5         P.Payment_Amount,
  6         P.Payment_Status
  7  FROM Orders O
  8  INNER JOIN Payment P
  9  ON O.Order_ID = P.Order_ID
 10  ORDER BY O.Order_ID;

  ORDER_ID PAYMENT_ID PAYMENT_MODE         PAYMENT_D PAYMENT_AMOUNT
---------- ---------- -------------------- --------- --------------
PAYMENT_STATUS
--------------------
      1001        501 UPI                  01-OCT-26           2298
Successful

      1002        502 Card                 02-OCT-26            999
Successful

      1003        503 Cash                 03-OCT-26           2499
Successful


SQL> SELECT P.Product_ID,
  2         P.Product_Name,
  3         D.Order_ID,
  4         D.Quantity,
  5         D.Unit_Price,
  6         D.Subtotal
  7  FROM Product P
  8  INNER JOIN Order_Details D
  9  ON P.Product_ID = D.Product_ID
 10  ORDER BY P.Product_ID;

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  ORDER_ID   QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ---------- ----------
       101
Women Kurti
      1001          2       1500       3000

       102
Men Shirt
      1001          1       2000       2000

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  ORDER_ID   QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ---------- ----------

       103
Kids T-Shirt
      1002          2       1000       2000

       104
Women Jeans

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  ORDER_ID   QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ---------- ----------
      1002          1       2500       2500

       105
Sports Shoes
      1003          3        500       1500


SQL> SELECT C.Customer_ID,
  2         C.Customer_Name,
  3         C.Email,
  4         O.Order_ID
  5  FROM Customer C
  6  LEFT JOIN Orders O
  7  ON C.Customer_ID = O.Customer_ID
  8  ORDER BY C.Customer_ID;

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
  ORDER_ID
----------
          1
Keerthi
keerthi@gmail.com
      1001


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
  ORDER_ID
----------
          2
Priya
priya@gmail.com
      1002


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
  ORDER_ID
----------
          3
Divya
divya@gmail.com
      1003


SQL> SELECT O.Order_ID,
  2         O.Customer_ID,
  3         C.Customer_Name,
  4         C.Email,
  5         C.Phone
  6  FROM Customer C
  7  RIGHT JOIN Orders O
  8  ON C.Customer_ID = O.Customer_ID
  9  ORDER BY O.Order_ID;

  ORDER_ID CUSTOMER_ID
---------- -----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE
---------------
      1001           1
Keerthi
keerthi@gmail.com
9876543210


  ORDER_ID CUSTOMER_ID
---------- -----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE
---------------
      1002           2
Priya
priya@gmail.com
9876543211


  ORDER_ID CUSTOMER_ID
---------- -----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
EMAIL
--------------------------------------------------------------------------------
PHONE
---------------
      1003           3
Divya
divya@gmail.com
9876543212


SQL> SELECT C.Customer_ID,
  2         C.Customer_Name,
  3         O.Order_ID,
  4         P.Product_ID,
  5         P.Product_Name,
  6         D.Quantity,
  7         D.Unit_Price,
  8         D.Subtotal
  9  FROM Customer C
 10  JOIN Orders O
 11  ON C.Customer_ID = O.Customer_ID
 12  JOIN Order_Details D
 13  ON O.Order_ID = D.Order_ID
 14  JOIN Product P
 15  ON D.Product_ID = P.Product_ID
 16  ORDER BY O.Order_ID;

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID PRODUCT_ID
---------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
          1
Keerthi
      1001        101

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID PRODUCT_ID
---------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
Women Kurti
         2       1500       3000


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID PRODUCT_ID
---------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
          1
Keerthi
      1001        102

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID PRODUCT_ID
---------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
Men Shirt
         1       2000       2000


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID PRODUCT_ID
---------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
          2
Priya
      1002        103

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID PRODUCT_ID
---------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
Kids T-Shirt
         2       1000       2000


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID PRODUCT_ID
---------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
          2
Priya
      1002        104

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID PRODUCT_ID
---------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
Women Jeans
         1       2500       2500


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID PRODUCT_ID
---------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
          3
Divya
      1003        105

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID PRODUCT_ID
---------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
Sports Shoes
         3        500       1500


SQL> SELECT C.Customer_ID,
  2         C.Customer_Name,
  3         O.Order_ID,
  4         P.Product_Name,
  5         D.Quantity,
  6         D.Unit_Price,
  7         D.Subtotal
  8  FROM Customer C
  9  JOIN Orders O
 10  ON C.Customer_ID = O.Customer_ID
 11  JOIN Order_Details D
 12  ON O.Order_ID = D.Order_ID
 13  JOIN Product P
 14  ON D.Product_ID = P.Product_ID
 15  ORDER BY C.Customer_ID, O.Order_ID;

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
          1
Keerthi
      1001

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
Women Kurti
         2       1500       3000


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
          1
Keerthi
      1001

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
Men Shirt
         1       2000       2000


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
          2
Priya
      1002

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
Kids T-Shirt
         2       1000       2000


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
          2
Priya
      1002

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
Women Jeans
         1       2500       2500


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
          3
Divya
      1003

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE   SUBTOTAL
---------- ---------- ----------
Sports Shoes
         3        500       1500


SQL> SELECT C.Customer_ID,
  2         C.Customer_Name,
  3         O.Order_ID,
  4         P.Product_Name,
  5         D.Subtotal,
  6         PY.Payment_Mode,
  7         PY.Payment_Amount,
  8         PY.Payment_Status
  9  FROM Customer C
 10  JOIN Orders O
 11  ON C.Customer_ID = O.Customer_ID
 12  JOIN Order_Details D
 13  ON O.Order_ID = D.Order_ID
 14  JOIN Product P
 15  ON D.Product_ID = P.Product_ID
 16  JOIN Payment PY
 17  ON O.Order_ID = PY.Order_ID
 18  ORDER BY C.Customer_ID;

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  SUBTOTAL PAYMENT_MODE         PAYMENT_AMOUNT PAYMENT_STATUS
---------- -------------------- -------------- --------------------
          1
Keerthi
      1001

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  SUBTOTAL PAYMENT_MODE         PAYMENT_AMOUNT PAYMENT_STATUS
---------- -------------------- -------------- --------------------
Women Kurti
      3000 UPI                            2298 Successful


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  SUBTOTAL PAYMENT_MODE         PAYMENT_AMOUNT PAYMENT_STATUS
---------- -------------------- -------------- --------------------
          1
Keerthi
      1001

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  SUBTOTAL PAYMENT_MODE         PAYMENT_AMOUNT PAYMENT_STATUS
---------- -------------------- -------------- --------------------
Men Shirt
      2000 UPI                            2298 Successful


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  SUBTOTAL PAYMENT_MODE         PAYMENT_AMOUNT PAYMENT_STATUS
---------- -------------------- -------------- --------------------
          2
Priya
      1002

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  SUBTOTAL PAYMENT_MODE         PAYMENT_AMOUNT PAYMENT_STATUS
---------- -------------------- -------------- --------------------
Kids T-Shirt
      2000 Card                            999 Successful


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  SUBTOTAL PAYMENT_MODE         PAYMENT_AMOUNT PAYMENT_STATUS
---------- -------------------- -------------- --------------------
          2
Priya
      1002

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  SUBTOTAL PAYMENT_MODE         PAYMENT_AMOUNT PAYMENT_STATUS
---------- -------------------- -------------- --------------------
Women Jeans
      2500 Card                            999 Successful


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  SUBTOTAL PAYMENT_MODE         PAYMENT_AMOUNT PAYMENT_STATUS
---------- -------------------- -------------- --------------------
          3
Divya
      1003

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  SUBTOTAL PAYMENT_MODE         PAYMENT_AMOUNT PAYMENT_STATUS
---------- -------------------- -------------- --------------------
Sports Shoes
      1500 Cash                           2499 Successful


SQL> SELECT C.Customer_ID,
  2         C.Customer_Name,
  3         O.Order_ID,
  4         P.Product_Name,
  5         D.Quantity,
  6         D.Subtotal,
  7         PY.Payment_Mode,
  8         PY.Payment_Status
  9  FROM Customer C
 10  JOIN Orders O
 11  ON C.Customer_ID = O.Customer_ID
 12  JOIN Order_Details D
 13  ON O.Order_ID = D.Order_ID
 14  JOIN Product P
 15  ON D.Product_ID = P.Product_ID
 16  JOIN Payment PY
 17  ON O.Order_ID = PY.Order_ID
 18  ORDER BY C.Customer_ID, O.Order_ID;

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL PAYMENT_MODE         PAYMENT_STATUS
---------- ---------- -------------------- --------------------
          1
Keerthi
      1001

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL PAYMENT_MODE         PAYMENT_STATUS
---------- ---------- -------------------- --------------------
Women Kurti
         2       3000 UPI                  Successful


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL PAYMENT_MODE         PAYMENT_STATUS
---------- ---------- -------------------- --------------------
          1
Keerthi
      1001

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL PAYMENT_MODE         PAYMENT_STATUS
---------- ---------- -------------------- --------------------
Men Shirt
         1       2000 UPI                  Successful


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL PAYMENT_MODE         PAYMENT_STATUS
---------- ---------- -------------------- --------------------
          2
Priya
      1002

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL PAYMENT_MODE         PAYMENT_STATUS
---------- ---------- -------------------- --------------------
Kids T-Shirt
         2       2000 Card                 Successful


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL PAYMENT_MODE         PAYMENT_STATUS
---------- ---------- -------------------- --------------------
          2
Priya
      1002

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL PAYMENT_MODE         PAYMENT_STATUS
---------- ---------- -------------------- --------------------
Women Jeans
         1       2500 Card                 Successful


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL PAYMENT_MODE         PAYMENT_STATUS
---------- ---------- -------------------- --------------------
          3
Divya
      1003

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
  ORDER_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY   SUBTOTAL PAYMENT_MODE         PAYMENT_STATUS
---------- ---------- -------------------- --------------------
Sports Shoes
         3       1500 Cash                 Successful


SQL> SELECT PY.Payment_ID,
  2         O.Order_ID,
  3         C.Customer_ID,
  4         C.Customer_Name,
  5         PY.Payment_Mode,
  6         PY.Payment_Date,
  7         PY.Payment_Amount,
  8         PY.Payment_Status
  9  FROM Payment PY
 10  JOIN Orders O
 11  ON PY.Order_ID = O.Order_ID
 12  JOIN Customer C
 13  ON O.Customer_ID = C.Customer_ID
 14  ORDER BY PY.Payment_ID;

PAYMENT_ID   ORDER_ID CUSTOMER_ID
---------- ---------- -----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
PAYMENT_MODE         PAYMENT_D PAYMENT_AMOUNT PAYMENT_STATUS
-------------------- --------- -------------- --------------------
       501       1001           1
Keerthi
UPI                  01-OCT-26           2298 Successful

       502       1002           2
Priya
Card                 02-OCT-26            999 Successful

PAYMENT_ID   ORDER_ID CUSTOMER_ID
---------- ---------- -----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
PAYMENT_MODE         PAYMENT_D PAYMENT_AMOUNT PAYMENT_STATUS
-------------------- --------- -------------- --------------------

       503       1003           3
Divya
Cash                 03-OCT-26           2499 Successful


SQL> DESC Payment;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PAYMENT_ID                                NOT NULL NUMBER
 ORDER_ID                                           NUMBER
 PAYMENT_MODE                              NOT NULL VARCHAR2(20)
 PAYMENT_DATE                              NOT NULL DATE
 PAYMENT_AMOUNT                            NOT NULL NUMBER(10,2)
 PAYMENT_STATUS                            NOT NULL VARCHAR2(20)
