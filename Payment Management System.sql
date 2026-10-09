
SQL> CREATE TABLE Payment (
  2      Payment_ID NUMBER PRIMARY KEY,
  3      Order_ID NUMBER,
  4      Payment_Mode VARCHAR2(20) NOT NULL,
  5      Payment_Date DATE NOT NULL,
  6      Payment_Amount NUMBER(10,2) NOT NULL,
  7      Payment_Status VARCHAR2(20) NOT NULL
  8  );

Table created.

SQL> DESC Payment;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PAYMENT_ID                                NOT NULL NUMBER
 ORDER_ID                                           NUMBER
 PAYMENT_MODE                              NOT NULL VARCHAR2(20)
 PAYMENT_DATE                              NOT NULL DATE
 PAYMENT_AMOUNT                            NOT NULL NUMBER(10,2)
 PAYMENT_STATUS                            NOT NULL VARCHAR2(20)

SQL> INSERT INTO Payment VALUES
  2  (501, 1001, 'UPI', DATE '2026-10-01', 2298, 'Successful');

1 row created.

SQL>
SQL> INSERT INTO Payment VALUES
  2  (502, 1002, 'Card', DATE '2026-10-02', 999, 'Successful');

1 row created.

SQL>
SQL> INSERT INTO Payment VALUES
  2  (503, 1003, 'Cash', DATE '2026-10-03', 2499, 'Successful');

1 row created.

SQL>
SQL> INSERT INTO Payment VALUES
  2  (504, 1004, 'UPI', DATE '2026-10-04', 1599, 'Failed');

1 row created.

SQL>
SQL> INSERT INTO Payment VALUES
  2  (505, 1005, 'Card', DATE '2026-10-05', 1798, 'Successful');

1 row created.

SQL>
SQL> COMMIT;

Commit complete.

SQL> SELECT *
  2  FROM Payment
  3  WHERE Payment_Status = 'Successful';

PAYMENT_ID   ORDER_ID PAYMENT_MODE         PAYMENT_D PAYMENT_AMOUNT
---------- ---------- -------------------- --------- --------------
PAYMENT_STATUS
--------------------
       501       1001 UPI                  01-OCT-26           2298
Successful

       502       1002 Card                 02-OCT-26            999
Successful

       503       1003 Cash                 03-OCT-26           2499
Successful


PAYMENT_ID   ORDER_ID PAYMENT_MODE         PAYMENT_D PAYMENT_AMOUNT
---------- ---------- -------------------- --------- --------------
PAYMENT_STATUS
--------------------
       505       1005 Card                 05-OCT-26           1798
Successful


SQL> SELECT *
  2  FROM Payment
  3  WHERE Payment_Status = 'Failed';

PAYMENT_ID   ORDER_ID PAYMENT_MODE         PAYMENT_D PAYMENT_AMOUNT
---------- ---------- -------------------- --------- --------------
PAYMENT_STATUS
--------------------
       504       1004 UPI                  04-OCT-26           1599
Failed


SQL> UPDATE Payment
  2  SET Payment_Status = 'Successful'
  3  WHERE Payment_ID = 504;

1 row updated.

SQL>
SQL> COMMIT;

Commit complete.

SQL> SELECT
  2      Payment_Mode,
  3      SUM(Payment_Amount) AS Total_Collected
  4  FROM Payment
  5  GROUP BY Payment_Mode;

PAYMENT_MODE         TOTAL_COLLECTED
-------------------- ---------------
UPI                             3897
Card                            2797
Cash                            2499


SQL> SELECT
  2      c.Customer_Name,
  3      o.Order_ID,
  4      p.Payment_ID,
  5      p.Payment_Mode,
  6      p.Payment_Date,
  7      p.Payment_Amount,
  8      p.Payment_Status
  9  FROM Customer c
 10  JOIN Orders o
 11      ON c.Customer_ID = o.Customer_ID
 12  JOIN Payment p
 13      ON o.Order_ID = p.Order_ID
 14  ORDER BY p.Payment_Date;

no rows selected
