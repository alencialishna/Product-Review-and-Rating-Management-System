
CREATE DATABASE Review;
USE Review;

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price INT
);

CREATE TABLE Review (
    Review_ID VARCHAR(10) PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Rating INT NOT NULL CHECK(Rating BETWEEN 1 AND 5),
    Review_Text VARCHAR(100),
    Review_Date DATE NOT NULL,
    FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID)
);

INSERT INTO Customer VALUES
(1,'Lishna','lulu@gmail.com'),
(2,'Rexon','rex@gmail.com'),
(3,'Varshan','varsh@gmail.com');

INSERT INTO Product VALUES
(101,'Laptop',50000),
(102,'Mobile',20000),
(103,'Headphones',2500);

INSERT INTO Review VALUES
('R101',1,101,5,'Excellent laptop','2026-11-01'),
('R102',2,102,4,'Good battery','2026-11-02'),
('R103',3,101,5,'Very good','2026-11-03'),
('R104',1,103,3,'Average quality','2026-11-04'),
('R105',2,102,5,'Nice product','2026-11-05');

UPDATE Review
SET Review_Text='Very nice product'
WHERE Review_ID='R102';

DELETE FROM Review
WHERE Review_ID='R104';

SELECT Product_Name, Rating, Review_Text
FROM Product, Review
WHERE Product.Product_ID=Review.Product_ID;

SELECT Customer_Name, Review_Text, Rating
FROM Customer, Review
WHERE Customer.Customer_ID=Review.Customer_ID;

SELECT * FROM Review
ORDER BY Review_Date DESC;

SELECT * FROM Review
WHERE Rating>4;

SELECT Product_ID, AVG(Rating)
FROM Review
GROUP BY Product_ID;

SELECT Product_ID, COUNT(*)
FROM Review
GROUP BY Product_ID;

SELECT Product_ID, AVG(Rating)
FROM Review
GROUP BY Product_ID
ORDER BY AVG(Rating) DESC;

SELECT Product_ID, AVG(Rating)
FROM Review
GROUP BY Product_ID
HAVING AVG(Rating)>4;

SELECT Product_Name, COUNT(Review_ID), AVG(Rating)
FROM Product, Review
WHERE Product.Product_ID=Review.Product_ID
GROUP BY Product_ID, Product_Name;

SELECT Product_ID, COUNT(*)
FROM Review
GROUP BY Product_ID
ORDER BY COUNT(*) DESC;

SELECT Product_ID, AVG(Rating)
FROM Review
GROUP BY Product_ID
HAVING AVG(Rating)<3;

SELECT Rating, COUNT(*)
FROM Review
GROUP BY Rating;

SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM Review;

