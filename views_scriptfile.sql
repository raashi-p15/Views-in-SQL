CREATE DATABASE cust_db;

USE cust_db;

-- customer database creation

-- customer table creation
CREATE TABLE CUSTOMER (
ID int,
Name VARCHAR(100),
Phone_no INT,
constraint pk_cust
    PRIMARY KEY (ID)
) ;

-- orders table creation
CREATE TABLE ORDERS (
ID INT,
Cust_ID INT,
constraint pk_ord
	PRIMARY KEY (ID),
constraint fk_ord FOREIGN KEY (Cust_ID) references CUSTOMER (ID)
);

-- ordered items table creation
CREATE TABLE Order_Item(
ID INT,
Order_ID INT,
Product_ID INT,
Quantity INT,
constraint pk_ord_item
		PRIMARY KEY (ID),
constraint fk_ord_item
		FOREIGN KEY (Order_ID) references ORDERS(ID)
);

-- products table creation
CREATE TABLE PRODUCT (
ID INT,
Name VARCHAR(50),
Description TEXT,
constraint pk_prod
		PRIMARY KEY(ID)
);

ALTER TABLE Order_Item
ADD constraint fk_prod_item FOREIGN KEY (Product_ID) references PRODUCT(ID);

-- inserting values in the tables
INSERT INTO CUSTOMER VALUES
(1, 'Raashi Parashar', 234567),
(2, 'Ragini Pewekar', 123456),
(3, 'Shruti Shivankar', 345678),
(4, 'Ankita Bardhan', 456789),
(5, 'Meghana Dantuluri', 567890);

INSERT INTO ORDERS VALUES
(1, 4),
(2, 3),
(3, 2),
(4, 5),
(5, 1),
(6, 1),
(7, 2),
(8, 3),
(9, 5),
(10, 4),
(11, 3),
(12, 4),
(13, 2);

INSERT INTO PRODUCT VALUES
(1, 'Grey Solid Ribbed Top', 'Show off your style with our vibrant cropped tops.'),
(2, 'Solid V-neck Top', 'Elevate your every-day style with our Rosie top. It features a v-neckline, three-quarter sleeves, and has a straight fit.'),
(3, 'Floral Printed Mandarin Collar Top', ''),
(4, 'Striped Shirt',''),
(5, 'Oversized Casual Shirt',''),
(6, 'Textured Round Neck T-Shirt',''),
(7, 'Solid V-Neck Extended Sleeves Top',''),
(8, 'Floral Bell-Sleeves Top',''),
(9, 'Constrast Collar Fitted Top',''),
(10, 'Long Sleeve Ruched Top',''),
(11, 'Oversized T-Shirt',''),
(12, 'Lace Regular Top',''),
(13, 'Navy Cotton Blend Sleeveless Top',''),
(14, 'Striped Cotton Blend Regular Shirt',''),
(15, 'Lace Embroidered Crop Top',''),
(16, 'Solid Sleeveless Crochet Dress',''),
(17, 'Bodycon Dress',''),
(18, 'Soft Cotton Foliage Tiered Dress',''),
(19, 'Spaghetti Strap Neck Casual Dress',''),
(20, 'Layered Jumpsuit','');

UPDATE PRODUCT
SET Description = 'Floral printed top with a mandarin collar, offering a blend of elegance and charm.'
WHERE ID = 3;

UPDATE PRODUCT
SET Description = 'Classic striped shirt with a button-down front and tailored fit.'
WHERE ID = 4 ;

UPDATE PRODUCT
SET Description = 'Oversized casual shirt with a relaxed fit for effortless everyday style.'
WHERE ID = 5;

UPDATE PRODUCT
SET Description = 'Textured round neck T-shirt offering a stylish twist on a casual essential.'
WHERE ID = 6;

UPDATE PRODUCT
SET Description = 'Solid V-neck top with extended sleeves for a modern, relaxed silhouette.'
WHERE ID = 7;

UPDATE PRODUCT
SET Description = 'Floral top featuring elegant bell sleeves for a feminine and flowy look.'
WHERE ID = 8;

UPDATE PRODUCT
SET Description = 'Fitted top with a contrast collar, adding a chic and structured touch.'
WHERE ID = 9;

UPDATE PRODUCT
SET Description = 'Long sleeve ruched top designed for a flattering, figure-enhancing fit.'
WHERE ID = 10;

UPDATE PRODUCT
SET Description ='Oversized T-shirt with a relaxed silhouette for laid-back comfort and style.'
WHERE ID = 11;

UPDATE PRODUCT
SET Description ='Delicate lace regular-fit top for timeless elegance and comfort.'
WHERE ID = 12;

UPDATE PRODUCT
SET Description ='Navy cotton blend sleeveless top offering breathable comfort and sleek style.'
WHERE ID = 13;

UPDATE PRODUCT
SET Description ='Striped cotton blend regular-fit shirt combining classic style with everyday comfort.'
WHERE ID = 14;

UPDATE PRODUCT
SET Description ='Lace embroidered crop top with intricate detailing for a stylish, feminine look.'
WHERE ID = 15;

UPDATE PRODUCT
SET Description ='Solid sleeveless crochet dress blending elegant texture with effortless charm.'
WHERE ID = 16;

UPDATE PRODUCT
SET Description ='Bodycon dress with a sleek, figure-hugging silhouette for a bold, confident look.'
WHERE ID = 17;

UPDATE PRODUCT
SET Description ='Soft cotton foliage tiered dress with a breezy, layered design for effortless elegance.'
WHERE ID = 18;

UPDATE PRODUCT
SET Description ='Spaghetti strap casual dress with a relaxed fit and easygoing style.'
WHERE ID = 19;

UPDATE PRODUCT
SET Description ='Layered jumpsuit featuring a stylish, multi-tiered design for a modern, chic look.'
WHERE ID = 20;

SELECT * FROM PRODUCT;

SELECT * FROM CUSTOMER C JOIN ORDERS O ON C.ID = O.Cust_ID;

INSERT INTO Order_Item VALUES
(1, 1, 5, 2),
(2, 2, 6, 1),
(3, 3, 7, 2),
(4, 4, 8, 1),
(5, 5, 3, 2),
(6, 6, 18, 2),
(7, 7, 13, 3),
(8, 8, 20, 3),
(9, 9, 16, 5),
(10, 10, 3, 4),
(11, 11, 17, 8),
(12, 12, 14, 7),
(13, 13, 2, 6);

-- views queries

-- VIEW OF ORDER IDS OF ALL THE CUSTOMERS
CREATE VIEW CustomerOrderSummary AS
SELECT
		C.ID AS CustomerID,
        C.Name AS CustomerName,
        O.ID AS OrderID
FROM CUSTOMER C
JOIN ORDERS O
ON C.ID = O.Cust_ID;

SELECT * FROM CustomerOrderSummary;

-- VIEW OF THE PRODUCTS INCLUDED IN THE ORDERS
CREATE VIEW OrderProductDetails AS
SELECT
		O.ID AS OrderID,
        I.ID AS OrderItemID,
        P.Name AS ProductName,
        I.Quantity AS ItemQuantity
FROM order_Item I
JOIN ORDERS O ON I.Order_ID= O.ID 
JOIN PRODUCT P ON I.PRODUCT_ID = P.ID;
        
SELECT * FROM OrderProductDetails;

-- VIEW OF QUANTITY OF ITEMS ORDERED WITHIN A RANGE
CREATE VIEW Items AS
SELECT 
        I.Order_ID AS Order_ID,
        P.Name AS ProductsOrdered,
        I.Quantity AS ProductQuantityOrdered
FROM order_item I
JOIN PRODUCT P ON I.Product_ID = P.ID
WHERE I.Quantity BETWEEN 2 AND 10;

SELECT * FROM Items;

-- view of customer, order, and product details
CREATE VIEW OrderDetails AS
SELECT
    O.ID AS OrderID,
    C.Name AS CustomerName,
    P.Name AS ProductName,
    P.Description AS ProductDescription,
    I.Quantity
FROM ORDERS AS O
JOIN CUSTOMER AS C ON O.Cust_ID = C.ID
JOIN Order_Item AS I ON O.ID = I.Order_ID
JOIN PRODUCT AS P ON I.Product_ID = P.ID;

SELECT * FROM OrderDetails;

-- view of total orders of a customer
CREATE VIEW OrderCount AS
SELECT 
		C.ID AS customerID,
        C.Name AS customerName,
        COUNT(O.ID) AS TotalOrders
FROM CUSTOMER C
JOIN ORDERS O ON C.ID = O.Cust_ID
GROUP BY customerID, customerName;

SELECT * FROM OrderCount;
        
