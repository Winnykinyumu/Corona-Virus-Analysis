
-- To avoid any errors, check missing value / null value 
-- Q1. Write a code to check NULL values
select COUNT(*) as number_of_nulls
from [Corona virus Analysis].dbo.[Corona Virus Dataset]
WHERE Province IS NULL AND Country_Region IS NULL AND Latitude IS NULL AND Longitude IS NULL AND Date IS NULL AND Confirmed IS NULL AND Deaths IS NULL AND Recovered IS NULL
--OR
select * 
from [Corona virus Analysis].dbo.[Corona Virus Dataset]
WHERE Province IS NULL AND Country_Region IS NULL AND Latitude IS NULL AND Longitude IS NULL AND Date IS NULL AND Confirmed IS NULL AND Deaths IS NULL AND Recovered IS NULL
--Q2. If NULL values are present, update them with zeros for all columns. 


-- Q3. check total number of rows
select COUNT(*)as total_rows
from [Corona virus Analysis].dbo.[Corona Virus Dataset]

-- Q4. Check what is start_date and end_date
select MIN(Date)as start_date, MAX(Date) as end_date
from [Corona virus Analysis].dbo.[Corona Virus Dataset]

-- Q5. Number of month present in dataset
Select COUNT(MONTH(Date)) as number_of_month
from [Corona virus Analysis].dbo.[Corona Virus Dataset]
GROUP BY Date, MONTH(Date)

-- Q6. Find monthly average for confirmed, deaths, recovered
Select DISTINCT(MONTH(Date)) as month, AVG(Confirmed)as avgconfirmed, AVG (Deaths) as avgdeaths, AVG(Recovered)as avgrecovered
from [Corona virus Analysis].dbo.[Corona Virus Dataset]
GROUP BY MONTH(Date)
Order by Month(Date)

-- Q7. Find most frequent value for confirmed, deaths, recovered each month
Select DISTINCT(MONTH(Date)) as month, COUNT(Confirmed)as frequent_confirmed, COUNT(Deaths) as frequent_deaths, COUNT(Recovered)as frequent_recovered
from [Corona virus Analysis].dbo.[Corona Virus Dataset]
GROUP BY MONTH(Date)
Order by Month(Date)

-- Q8. Find minimum values for confirmed, deaths, recovered per year
Select DISTINCT(Year(Date)) as year, MIN(Confirmed)as minimum_confirmed, MIN(Deaths) as minimum_deaths, MIN(Recovered)as minimum_recovered
from [Corona virus Analysis].dbo.[Corona Virus Dataset]
GROUP BY Year(Date)
Order by Year(Date)

-- Q9. Find maximum values of confirmed, deaths, recovered per year
Select DISTINCT(Year(Date)) as year, MAX(Confirmed)as maximum_confirmed, MAX(Deaths) as maximum_deaths, MAX(Recovered)as maximum_recovered
from [Corona virus Analysis].dbo.[Corona Virus Dataset]
GROUP BY Year(Date)
Order by Year(Date)

-- Q10. The total number of case of confirmed, deaths, recovered each month
Select DISTINCT(MONTH(Date)) as month, SUM(Confirmed)as total_confirmed, SUM(Deaths) as total_deaths, SUM(Recovered)as total_recovered
from [Corona virus Analysis].dbo.[Corona Virus Dataset]
GROUP BY MONTH(Date)
Order by Month(Date)

-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
Select SUM(Confirmed)as total_confirmed, AVG(Confirmed) as avg_confirmed, ROUND(VAR(Confirmed),2) as variance_confirmed, ROUND(STDEV(Confirmed),2) as stdev_confirmed
from [Corona virus Analysis].dbo.[Corona Virus Dataset]


--A higher variance compared to the total cases confirmed would highlight that there are significant fluctuations in the daily or weekly number of confirmed cases
--pointing out periods of low and high counts, possibilities of outliers or inconsistent data colection practices.

--If the variance is lower compared to the total number of cases confirmed, it would suggest that daily or weekly case counts are relatively consistent.
--This would suggest that the situation is more controlled indicating effective management and consistent reporting.
--For the pandemic, it would suggest that there is a drop in the number of confirmed cases, also control measures such as social distancing are effective in reducing the number of new cases.
--The Same applies for stdev
--When Variance is lower than stdev, it would suggest consistency and predictability in the outbreak of the disease.
--If variance is highre than stdev, it would suggest a greater dispersion in the distribution of case counts.This suggests a higher variability and less predicatble pattern of the outbreak.

-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )
Select DISTINCT(MONTH(Date)) as month, SUM(Deaths)as total_deaths, AVG(Deaths) as avg_deaths, ROUND(VAR(Deaths),2) as death_variance, ROUND(STDEV(Deaths),2) as stdev_death
from [Corona virus Analysis].dbo.[Corona Virus Dataset]
GROUP BY MONTH(Date)
Order by MONTH(Date)
--There is a higher death variance compared to the total deaths across the months.
--This suggests a significant variability in the affected areas/population.
--In the context of a pandemic, this variability would reflect on differences in healthcare access, population demographics, effectiveness of treatment or other factors affecting mortality.

-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
Select SUM(Recovered)as total_recovered, AVG(Recovered) as avg_recovered, ROUND(VAR(Recovered),2) as Recovered_variance, ROUND(STDEV(Recovered),2) as stdev_recovered
from [Corona virus Analysis].dbo.[Corona Virus Dataset]



--The results present a higher variance of recovered cases compared to the total cases recovered.
--This provides an insight on the effectiveness of treatnment and healthcare delivery practices, which may be causing the delayed recovery.
--This calls for healthcare strategies and interventations that support recovery efforts.

-- Q14. Find Country having highest number of the Confirmed case
Select TOP 1 Country_Region, MAX(Confirmed) as highest_number_of_confirmed_cases
from [Corona virus Analysis].dbo.[Corona Virus Dataset]
GROUP BY Country_Region
Order by highest_number_of_confirmed_cases DESC


-- Q15. Find Country having lowest number of the death case
Select TOP 10  Country_Region, MIN(Deaths) as lowest_number_of_death_cases
from [Corona virus Analysis].dbo.[Corona Virus Dataset]
GROUP BY Country_Region
Order by lowest_number_of_death_cases DESC

-- Q16. Find top 5 countries having highest recovered case
Select TOP 5  Country_Region, Max(Recovered) as highest_recovered_cases
from [Corona virus Analysis].dbo.[Corona Virus Dataset]
GROUP BY Country_Region
Order by highest_recovered_cases DESC
