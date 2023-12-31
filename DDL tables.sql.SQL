CREATE TABLE "Dim_Location "
(
    location_SK number NOT NULL,
    Market      nvarchar2(50),
    Country     varchar2(50),
    State       varchar2(50),
    City        varchar2(50),
    Region      varchar2(50)
);

ALTER TABLE "Dim_Location " ADD PRIMARY KEY (location_SK);

CREATE TABLE Fact_Sales
(
    Order_SK       number NOT NULL,
    Location_SK    number NOT NULL,
    Order_Date_KEY number NOT NULL,
    Ship_Date_KEY  number NOT NULL,
    Product_SK     number NOT NULL,
    Customer_SK    number NOT NULL,
    Sales          number(15,4),
    Quantity       number,
    Discount       number(2,2),
    Profit         number(15,5),
    Shipping_Cost  number(15,10)
);

ALTER TABLE Fact_Sales ADD PRIMARY KEY (Order_SK, Location_SK, Order_Date_KEY, Ship_Date_KEY, Product_SK, Customer_SK);

CREATE TABLE "Dim_customer "
(
    Customer_SK   number NOT NULL,
    Customer_ID   nvarchar2(50) NOT NULL,
    Customer_Name nvarchar2(50),
    Segment       nvarchar2(50),
    Postal_Code   number
);

ALTER TABLE "Dim_customer " ADD PRIMARY KEY (Customer_SK);

CREATE TABLE "Dim_Product "
(
    product_SK   number NOT NULL,
    Product_ID   nvarchar2(15) NOT NULL,
    Product_Name nvarchar2(100),
    Category     nvarchar2(50),
    Sub_Category nvarchar2(50)
);

ALTER TABLE "Dim_Product " ADD PRIMARY KEY (product_SK);

CREATE TABLE Dim_Order
(
    Order_SK       number NOT NULL,
    Order_ID       number NOT NULL,
    Ship_Mode      nvarchar2(50),
    Order_Priority nvarchar2(50)
);

ALTER TABLE Dim_Order ADD PRIMARY KEY (Order_SK);

CREATE TABLE date_dimension (
    date_key           NUMBER,
    full_date          DATE,
    day_of_week        VARCHAR2(20),
    day_of_month       NUMBER,
    day_name           VARCHAR2(20),
    month              NUMBER,
    month_name         VARCHAR2(20),
    quarter            NUMBER,
    quarter_name       VARCHAR2(20),
    year               NUMBER,
    is_weekend         VARCHAR2(10),
    is_holiday         VARCHAR2(10)
);

ALTER TABLE Date_Dimension ADD PRIMARY KEY (Date_KEY);


ALTER TABLE Fact_Sales ADD 
    FOREIGN KEY (Order_SK) REFERENCES Dim_Order (Order_SK);

ALTER TABLE Fact_Sales ADD 
    FOREIGN KEY (Location_SK) REFERENCES "Dim_Location " (location_SK);

ALTER TABLE Fact_Sales ADD 
    FOREIGN KEY (Order_Date_KEY) REFERENCES Date_Dimension (Date_KEY);

ALTER TABLE Fact_Sales ADD 
    FOREIGN KEY (Ship_Date_KEY) REFERENCES Date_Dimension (Date_KEY);
    
ALTER TABLE Fact_Sales ADD 
    FOREIGN KEY (Product_SK) REFERENCES "Dim_Product " (product_SK);

ALTER TABLE Fact_Sales ADD 
    FOREIGN KEY (Customer_SK) REFERENCES "Dim_customer " (Customer_SK);
