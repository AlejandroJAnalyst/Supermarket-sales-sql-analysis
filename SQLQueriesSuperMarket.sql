use VideoGames
select * from SuperMarket
---1. Retrieve the total sales amount for each store.
SELECT Branch, SUM(CAST([Sales] AS DECIMAL(10,2))) AS TotalSales
FROM SuperMarket
GROUP BY Branch;

---2. Find the top 5 products with the highest total sales across all stores.
SELECT TOP 5 [Product line], SUM(CAST([Sales] AS DECIMAL(10,2))) AS TotalSales
FROM SuperMarket
GROUP BY [Product line]
ORDER BY TotalSales DESC;

---3. Calculate the average weekly sales for each department in the stores.

SELECT [Product line], AVG(CAST([Sales] AS DECIMAL(10,2))) AS AverageSales
FROM SuperMarket
GROUP BY [Product line];


---4. Total Sales by Payment Method
SELECT Payment, SUM(CAST([Sales] AS DECIMAL(18,2))) AS TotalSales
FROM SuperMarket
GROUP BY Payment
ORDER BY TotalSales DESC;


---5. List customers by customer type and gender, showing total sales and average rating
SELECT [Customer type], Gender, 
       SUM(CAST([Sales] AS DECIMAL(18,2))) AS TotalSales,
       AVG(CAST(Rating AS FLOAT)) AS AverageRating
FROM SuperMarket
GROUP BY [Customer type], Gender
ORDER BY TotalSales DESC;


---6. Find the product lines that have average unit price greater than 50, showing their average unit price and total quantity sold
SELECT [Product line], 
       AVG(CAST([Unit price] AS DECIMAL(18,2))) AS AvgUnitPrice,
       SUM(CAST(Quantity AS INT)) AS TotalQuantity
FROM SuperMarket
GROUP BY [Product line]
HAVING AVG(CAST([Unit price] AS DECIMAL(18,2))) > 50
ORDER BY AvgUnitPrice DESC;


