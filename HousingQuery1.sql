SELECT Top 10 * from dbo.Housing;

SELECT TOP 10 *       /*EXPENSIVE HOUSE*/
FROM Housing
ORDER BY price DESC;


SELECT TOP 10 *       /*CHEAP HOUSE*/
FROM Housing
ORDER BY price ASC;


SELECT              /* PROVIDE MIDDLE PRICE OVER ALL HOUSE PRICE*/
    PERCENTILE_CONT(0.5) 
    WITHIN GROUP (ORDER BY CAST(price AS DECIMAL(18,2))) 
    OVER () AS median_price
FROM Housing;       


SELECT              /* show the difference from average price*/
    ROUND(AVG(CAST(price AS DECIMAL(18,2))), 2) AS avg_price
FROM Housing;
SELECT 
    price,
    price - 
    (SELECT AVG(CAST(price AS DECIMAL(18,2))) FROM Housing) 
    AS diff_from_avg
FROM Housing;


SELECT *          /* House price above avg. price*/
FROM Housing
WHERE price > (SELECT  AVG(CAST(price AS DECIMAL(18,2))) FROM Housing);


SELECT            /* Provide variation in the price*/
    STDEV(CAST(price AS DECIMAL(18,2))) AS price_variation
FROM Housing;


SELECT *
FROM Housing
WHERE
    price IS NULL
 OR area IS NULL
 OR bedrooms IS NULL
 OR bathrooms IS NULL
 OR stories IS NULL
 OR mainroad IS NULL
 OR guestroom IS NULL
 OR basement IS NULL

 
 SELECT
    SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS price_nulls,
    SUM(CASE WHEN area IS NULL THEN 1 ELSE 0 END) AS area_nulls,
    SUM(CASE WHEN bedrooms IS NULL THEN 1 ELSE 0 END) AS bedrooms_nulls,
    SUM(CASE WHEN bathrooms IS NULL THEN 1 ELSE 0 END) AS bathrooms_nulls,
    SUM(CASE WHEN stories IS NULL THEN 1 ELSE 0 END) AS stories_nulls,
    SUM(CASE WHEN mainroad IS NULL THEN 1 ELSE 0 END) AS mainroad_nulls,
    SUM(CASE WHEN guestroom IS NULL THEN 1 ELSE 0 END) AS guestroom_nulls,
    SUM(CASE WHEN basement IS NULL THEN 1 ELSE 0 END) AS basement_nulls
FROM Housing;


SELECT DISTINCT mainroad FROM Housing;
SELECT DISTINCT guestroom FROM Housing;
SELECT DISTINCT basement FROM Housing;
SELECT DISTINCT airconditioning FROM Housing;
SELECT DISTINCT prefarea FROM Housing;

UPDATE Housing
SET furnishingstatus = UPPER(furnishingstatus);

SELECT Top 30 * from Housing;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Housing';  /* PROVIDE DATA TYPES OF EACH COLUMN*/


SELECT 
    ROUND(AVG(CAST(price AS DECIMAL(18,2))), 2) AS avg_price
FROM Housing;

SELECT COUNT(*) AS houses_with_ac
FROM Housing
WHERE airconditioning = 1;

SELECT ROUND(AVG (CAST(price AS DECIMAL(16,2))),2) AS avg_price_mainroad
FROM Housing
WHERE mainroad = 1;

SELECT furnishingstatus, AVG(price) AS avg_price
FROM Housing
GROUP BY furnishingstatus
ORDER BY avg_price DESC;





