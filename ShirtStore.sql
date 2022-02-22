CREATE TABLE MyShirtStore (
	ShirtID INT,
	ShirtColor VARCHAR (50),
	ShirtSize VARCHAR(50),
	PurchasePrice INT,
	SellPrice INT,
	Quantity INT,
	)

INSERT INTO MyShirtStore VALUES (1, 'red', 'small', 2.00, 5.00, 30)
INSERT INTO MyShirtStore VALUES (2, 'red', 'medium', 3.00, 6.00, 30)
INSERT INTO MyShirtStore VALUES (3, 'red', 'large', 4.00, 7.00, 30)
INSERT INTO MyShirtStore VALUES (4, 'blue', 'small', 2.00, 5.00, 30)
INSERT INTO MyShirtStore VALUES (5, 'blue', 'medium', 3.00, 6.00, 30)
INSERT INTO MyShirtStore VALUES (6, 'blue', 'large', 4.00, 7.00, 30)
INSERT INTO MyShirtStore VALUES (7, 'green', 'small', 2.00, 5.00, 20)
INSERT INTO MyShirtStore VALUES (8, 'green', 'medium', 3.00, 6.00, 20)
INSERT INTO MyShirtStore VALUES (9, 'green', 'large', 4.00, 7.00, 20)
INSERT INTO MyShirtStore VALUES (10, 'black', 'small', 2.00, 5.00, 50)
INSERT INTO MyShirtStore VALUES (11, 'black', 'medium', 3.00, 6.00, 50)
INSERT INTO MyShirtStore VALUES (12, 'black', 'large', 4.00, 7.00, 50)
INSERT INTO MyShirtStore VALUES (13, 'grey', 'small', 2.00, 5.00, 30)
INSERT INTO MyShirtStore VALUES (14, 'grey', 'medium', 3.00, 6.00, 30)
INSERT INTO MyShirtStore VALUES (15, 'grey', 'large', 4.00, 7.00, 30)


CREATE TABLE Sales (
	ShirtID INT ,
	QtySold INT,
	)

INSERT INTO Sales VALUES (1,23)
INSERT INTO Sales VALUES (2,6)
INSERT INTO Sales VALUES (3,11)
INSERT INTO Sales VALUES (4,28)
INSERT INTO Sales VALUES (5,19)
INSERT INTO Sales VALUES (6,3)
INSERT INTO Sales VALUES (7,5)
INSERT INTO Sales VALUES (8,12)
INSERT INTO Sales VALUES (9,0)
INSERT INTO Sales VALUES (10,34)
INSERT INTO Sales VALUES (11,6)
INSERT INTO Sales VALUES (12,22)
INSERT INTO Sales VALUES (13,3)
INSERT INTO Sales VALUES (14,26)
INSERT INTO Sales VALUES (15,10)


SELECT sum(qtysold) AS TotalSold FROM Sales 

SELECT sum(Quantity) AS TotalInventory FROM MyShirtStore


SELECT (sum(Quantity) - sum(qtysold)) AS InventoryLeft
	FROM MyShirtStore
	JOIN Sales
	ON MyShirtStore.ShirtID = Sales.ShirtID

SELECT MyShirtStore.ShirtColor, MyShirtStore.ShirtSize, MyShirtStore.PurchasePrice, MyShirtStore.SellPrice, MyShirtStore.Quantity, Sales.QtySold 
	from MyShirtStore
	join Sales
	ON MyShirtStore.ShirtID = Sales.ShirtID

	
SELECT MyShirtStore.ShirtColor, MyShirtStore.ShirtSize, Sales.QtySold 
	from MyShirtStore
	join Sales
	ON MyShirtStore.ShirtID = Sales.ShirtID
	order by Sales.QtySold desc

SELECT COUNT(ShirtColor) AS QtyPerColor, ShirtColor, SUM(Quantity) AS TotalInventory
	FROM MyShirtStore
	GROUP BY ShirtColor


SELECT MyShirtStore.ShirtColor, MyShirtStore.ShirtSize, ((MyShirtStore.SellPrice - MyShirtStore.PurchasePrice) * Sales.QtySold) AS Profit
	FROM MyShirtStore
	JOIN Sales
	ON MyShirtStore.ShirtID = Sales.ShirtID
	ORDER BY Profit desc

SELECT MyShirtStore.ShirtColor, MyShirtStore.ShirtSize, sales.QtySold,
	CASE
		WHEN QtySold > 20 THEN 'BestSeller'
		WHEN QtySold BETWEEN 5 AND 20 THEN 'GoodSeller'
		WHEN QtySold < 5 THEN 'BadSeller'
	END AS 'Ranking'
FROM Sales
JOIN MyShirtStore
ON Sales.ShirtID = MyShirtStore.ShirtID
ORDER BY Sales.QtySold DESC


SELECT DISTINCT ShirtColor --COUNT(ShirtColor)
	FROM MyShirtStore
	GROUP BY ShirtColor

SELECT ShirtColor, COUNT(ShirtColor)
	FROM MyShirtStore
	GROUP BY ShirtColor



SELECT MyShirtStore.ShirtColor, COUNT(MyShirtStore.ShirtColor) AS SizesPerColor, SUM(Quantity) AS TotalPerColor, SUM(Sales.QtySold) AS TotalQtySold
	FROM MyShirtStore
	JOIN Sales
	ON MyShirtStore.ShirtID = Sales.ShirtID
	GROUP BY ShirtColor
	ORDER BY TotalQtySold DESC

SELECT MyShirtStore.ShirtColor, SUM(Quantity) AS TotalPerColor, SUM(Sales.QtySold) AS TotalQtySold
	FROM MyShirtStore
	JOIN Sales
	ON MyShirtStore.ShirtID = Sales.ShirtID
	GROUP BY ShirtColor
	ORDER BY TotalQtySold DESC

SELECT MyShirtStore.ShirtSize, SUM(Quantity) AS TotalPerSize, SUM(Sales.QtySold) AS TotalQtySold
	FROM MyShirtStore
	JOIN Sales
	ON MyShirtStore.ShirtID = Sales.ShirtID
	GROUP BY ShirtSize
	ORDER BY TotalQtySold DESC
