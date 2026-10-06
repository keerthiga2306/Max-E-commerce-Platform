
SQL> CREATE TABLE Orders (
  2      Order_ID NUMBER PRIMARY KEY,
  3      Customer_ID NUMBER,
  4      Order_Date DATE NOT NULL,
  5      Total_Amount NUMBER(10,2) NOT NULL,
  6      FOREIGN KEY (Customer_ID)
  7          REFERENCES Customer(Customer_ID)
  8  );

Table created.


SQL> INSERT INTO Orders VALUES
  2  (1001, 1, DATE '2026-10-01', 2298);

1 row created.

SQL>
SQL> INSERT INTO Orders VALUES
  2  (1002, 2, DATE '2026-10-02', 999);

1 row created.

SQL>
SQL> INSERT INTO Orders VALUES
  2  (1003, 3, DATE '2026-10-03', 2499);

1 row created.

SQL>
SQL> INSERT INTO Orders VALUES
  2  (1004, 4, DATE '2026-10-04', 1599);

1 row created.

SQL>
SQL> INSERT INTO Orders VALUES
  2  (1005, 5, DATE '2026-10-05', 1798);

1 row created.


