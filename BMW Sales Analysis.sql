SELECT * FROM bmw_global_sales_dataset

--How many total cars were sold in the dataset?
SELECT SUM(units_sold) AS TotalUnitsSold FROM bmw_global_sales_dataset 

--What are all the distinct models in the dataset?
SELECT DISTINCT model FROM bmw_global_sales_dataset

--What is the average base price across all cars?
SELECT AVG(price_usd) AS AveragePrice FROM bmw_global_sales_dataset

--How many cars were sold per year, ordered from most to least?
SELECT year, SUM(units_sold) AS TotalUnitsSold FROM bmw_global_sales_dataset
GROUP BY year

--How many cars were sold per region?
SELECT country, SUM(units_sold) AS TotalUnitsSold FROM bmw_global_sales_dataset
GROUP BY country

--What is the best selling model overall by total units sold?
SELECT TOP 10 model, SUM(units_sold) AS TotalUnitsSold FROM bmw_global_sales_dataset
GROUP BY model
ORDER BY TotalUnitsSold DESC

--How many cars were sold by fuel type per year — showing how the mix shifts over time?
SELECT year, engine_type, SUM(units_sold) AS TotalUnitsSold FROM bmw_global_sales_dataset
GROUP BY year, engine_type
ORDER BY year, engine_type, TotalUnitsSold ASC

--What is the average base price per model, ordered most expensive to least?
SELECT model, AVG(price_usd) AS AveragePrice FROM bmw_global_sales_dataset
GROUP BY Model
ORDER BY AveragePrice DESC

--Which region spent the most money in total across all purchases (base price multiplied by units)?
SELECT country, SUM(cast(price_usd AS BIGINT) * units_sold) AS TotalAmountSpent FROM bmw_global_sales_dataset
GROUP BY country
ORDER BY TotalAmountSpent DESC

--For each year, what percentage of total sales were Electric or Hybrid combined?
SELECT year, SUM(CASE WHEN engine_type IN ('Electric', 'Hybrid') THEN units_sold ELSE 0 END) * 100 /  SUM(units_sold) AS PercentageOfElectricAndHybridSold FROM bmw_global_sales_dataset
GROUP BY year
ORDER BY year ASC

--Which model had the highest average price growth from 2015 to 2024?
SELECT model, AVG(CASE WHEN year = 2024 THEN price_usd END) - AVG(CASE WHEN year = 2015 THEN price_usd END) AS PriceGrowth FROM bmw_global_sales_dataset
GROUP BY model
ORDER BY PriceGrowth DESC

