#Import and check that the table works properly
SELECT * FROM AVOCADOCLEAN;

#The lowest average price ever ever for an avocado

SELECT concat(`average price`, " ",Year, " ", Region) AS 'Lowest Price ever All Regions'
FROM avocadoclean
where `Average Price` = (SELECT min(`Average Price`) from avocadoclean)
order by `Average Price` asc; 

#The lowest average price ever has been in 2017, in Cincinnati Dayton, with an average price of 0.44 dollars



#Highest average price ever for an avocado
SELECT concat(`average price`, " ",Year, " ", Region) AS 'Highest Price ever All Regions'
FROM avocadoclean
where `Average Price` = (SELECT max(`Average Price`) from avocadoclean)
order by `Average Price` desc; 
#The highest average price ever  has been in 2017, in San Francisco, with an average price of 3.25 dollars



#From all the regions, where can we find the one with the highest average and the lowest prices in 2015'
SELECT concat(`average price`, " ",Year, " ", Region) AS 'Region with Highest Average Price 2015'
FROM avocadoclean
where `year` = 2015
order by `Average Price` desc;

SELECT concat(`average price`, " ",Year, " ", Region) AS 'Region with Highest Average Price 2015'
FROM avocadoclean
where `year` = 2015
order by `Average Price` asc;
#The highest average price was in San Francisco and the lowest in Phoenix Tuscon



#From all the regions, where can we find the one with the highest average and the lowest prices in 2016'
SELECT concat(`average price`, " ",Year, " ", Region) AS 'Region with Highest Average Price 2016'
FROM avocadoclean
where `year` = 2016
order by `Average Price` desc;

SELECT concat(`average price`, " ",Year, " ", Region) AS 'Region with Highest Average Price 2016'
FROM avocadoclean
where `year` = 2016
order by `Average Price` asc; 
#The highest average price was in San Francisco and the lowest in Phoenix Tuscon



#From all the regions, where can we find the one with the highest average and the lowest prices in 2017'
SELECT concat(`average price`, " ",Year, " ", Region) AS 'Region with Highest Average Price 2017'
FROM avocadoclean
where `year` = 2017
order by `Average Price` desc;

SELECT concat(`average price`, " ",Year, " ", Region) AS 'Region with Highest Average Price 2017'
FROM avocadoclean
where `year` = 2017
order by `Average Price` asc;
#The highest average price was in Tampa and the lowest in Cincinnati Dayton



#From all the regions, where can we find the one with the highest average and the lowest prices in 2018'
SELECT concat(`average price`, " ",Year, " ", Region) AS 'Region with Highest Average Price 2018'
FROM avocadoclean
where `year` = 2018
order by `Average Price` desc;

SELECT concat(`average price`, " ",Year, " ", Region) AS 'Region with Highest Average Price 2018'
FROM avocadoclean
where `year` = 2018
order by `Average Price` asc;
#The highest average price was in San Francisco and the lowest in Houston



#Which is the general preferred size of avocado ever amongst the 3 types 
SELECT sum(`Small Avocados`), sum(`Large Avocados`), sum(`XL Avocados`)AS 'Preferred size of avocados'
FROM avocadoclean;
#The preferred size of avocados are the Large ones


#Which is the preferred size of avocado ever amongst the 3 types in each region
SELECT round(sum(`Small Avocados`),2) as Small_total, round(sum(`Large Avocados`),2) as Large_total, round(sum(`XL Avocados`),2) as XL_total, Region AS 'Preferred size of avocados per region',
CASE 
  WHEN ( sum(`Small Avocados`) > sum(`Large Avocados`) ) AND ( sum(`Small Avocados`) > sum(`XL Avocados`) ) THEN "Small"
  WHEN ( sum(`Large Avocados`) > sum(`Small Avocados`) ) AND ( sum(`Large Avocados`) > sum(`XL Avocados`) ) THEN "Large"
  ELSE "XL"
END as "Best Seller"
FROM avocadoclean
GROUP BY Region;



#Which is the most sold kind of bag
SELECT sum(`Small Bags`), sum(`Large Bags`), sum(`XLarge Bags`) AS 'Preferred type of bags'
FROM avocadoclean;
#The most sold kind of bag are the Small Bags



#Which is the most sold kind of bag per region
SELECT round(sum(`Small Bags`),2) as Small_total, round(sum(`Large Bags`),2) as Large_total, round(sum(`XLarge Bags`),2) as XL_total, Region AS 'Preferred type of bags per region',
CASE 
  WHEN ( sum(`Small Bags`) > sum(`Large Bags`) ) AND ( sum(`Small Bags`) > sum(`XLarge Bags`) ) THEN "Small Bags"
  WHEN ( sum(`Large Bags`) > sum(`Small Bags`) ) AND ( sum(`Large Bags`) > sum(`XLarge Bags`) ) THEN "Large Bags"
  ELSE "XLarge Bags"
END as "Best Seller Kind of Bag"
FROM avocadoclean
GROUP BY Region;



#Total number of types (Conventional and Organic) of Avocados sold. Which one is more popular?
SELECT count(`Type`) AS 'Total number of Conventional Avocados'
From avocadoclean
WHERE type like'Conventional';

SELECT count(`Type`) 'Total number of Organic Avocados'
From avocadoclean
WHERE type like 'Organic';
#Even though now they are almost at the same level, the most popular type of avocado is the Conventional



#CONVENTIONAL VS ORGANIC.Preferred type of avocado by region

SELECT (`Average Price`), (Type), Region AS 'MOST PREFERRED TYPE OF AVOCADO BY REGION'
From avocadoclean
WHERE avg(sum(Type)) like 'Organic'
GROUP BY Region;

