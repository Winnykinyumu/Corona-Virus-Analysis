# Corona-Virus-Analysis
![Corona virus picture](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/654fc539-a94e-405a-b056-d0b3a97b9293)
### Project Overview
---
The objective of this project is to analyze the impact and spread of Coronavirus (Covid-19) between January 2020 and June 2021 across most countries worldwide. The analysis aims to provide insights into the patterns and trends associated with the pandemic, including case numbers, mortality rates and recoveries.
### Data Source
---
The primary dataset used for this analysis is the "corona_Virus_Dataset.CSV" file, containing detailed information for each country's record.
### Tools Used
---
- Excel- Data cleaning [Download here](https://microsoft.com)
- SQL Server -Data Analysis [Download here](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
### Data cleaning/preparation
---
Cleaning the dataset entailed:
1. Data loading and inspection.
2. Identifying and imputing missing values.
- **Write a code to check NULL values**
  ```SQL
  select COUNT(*) as number_of_nulls
  from [Corona virus Analysis].dbo.[Corona Virus Dataset]
  WHERE Province IS NULL AND Country_Region IS NULL AND Latitude IS NULL AND Longitude IS NULL AND Date IS NULL AND Confirmed IS NULL AND Deaths IS NULL AND Recovered IS NULL
  ```
  - **Results**
    
    ![image](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/a472807f-850f-4d64-ac17-3daac05e3047)
    😆

  
### Exploratory Data Analysis (EDA)
---
The EDA entailed answering key questions such as;
**1. check total number of rows**
   ```SQL
   select COUNT(*)as total_rows
   from [Corona virus Analysis].dbo.[Corona Virus Dataset]
   ```
- **Results**
  
  ![image](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/3267b297-588a-4bcd-8707-349b636c2bbb)

**2. Check what is start_date and end_date**
   ```SQL
   select MIN(Date)as start_date, MAX(Date) as end_date
   from [Corona virus Analysis].dbo.[Corona Virus Dataset]
   ```
- **Results**
  
  ![image](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/d041db4b-48c7-48c6-9d15-4e5e8aff497b)

**3. Number of month present in dataset**
   ```SQL
   Select COUNT(MONTH(Date)) as number_of_month
   from [Corona virus Analysis].dbo.[Corona Virus Dataset]
   GROUP BY Date, MONTH(Date)
   ```
  - **Results**
    
    ![image](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/ab890d12-dfd0-4249-b8b5-551c0e4fb605)

**4. Find monthly average for confirmed, deaths, recovered**
  ```SQL
  Select DISTINCT(MONTH(Date)) as month, AVG(Confirmed)as avgconfirmed, AVG (Deaths) as avgdeaths, AVG(Recovered)as avgrecovered
  from [Corona virus Analysis].dbo.[Corona Virus Dataset]
  GROUP BY MONTH(Date)
  Order by Month(Date)
  ```
- **Results**
  
  ![image](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/d5573b2b-a305-47bb-97a5-26ff0146a522)

**5. Find most frequent value for confirmed, deaths, recovered each month**
   ```SQL
   Select DISTINCT(MONTH(Date)) as month, COUNT(Confirmed)as frequent_confirmed, COUNT(Deaths) as frequent_deaths, COUNT(Recovered)as frequent_recovered
   from [Corona virus Analysis].dbo.[Corona Virus Dataset]
   GROUP BY MONTH(Date)
   Order by Month(Date)
   ```
- **Results**

![image](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/726a6f94-f0f5-461f-9db2-3143976f16ac)

**6. Find minimum values for confirmed, deaths, recovered per year**
   ```SQL
   Select DISTINCT(Year(Date)) as year, MIN(Confirmed)as minimum_confirmed, MIN(Deaths) as minimum_deaths, MIN(Recovered)as minimum_recovered
   from [Corona virus Analysis].dbo.[Corona Virus Dataset]
   GROUP BY Year(Date)
   Order by Year(Date)
   ```
- **Results**
  
  ![image](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/502adfe0-33ad-4a66-b9c4-75bc812cd4fd)

7.  **Find maximum values of confirmed, deaths, recovered per year**

    ```SQL
    Select DISTINCT(Year(Date)) as year, MAX(Confirmed)as maximum_confirmed, MAX(Deaths) as maximum_deaths, MAX(Recovered)as maximum_recovered
    from [Corona virus Analysis].dbo.[Corona Virus Dataset]
    GROUP BY Year(Date)
    Order by Year(Date)
    ```
  - **Results**
    
    ![image](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/64e25650-8c6a-4979-87ea-73c1fad04479)

**8. The total number of case of confirmed, deaths, recovered each month**
   ```SQL
   Select DISTINCT(MONTH(Date)) as month, SUM(Confirmed)as total_confirmed, SUM(Deaths) as total_deaths, SUM(Recovered)as total_recovered
   from [Corona virus Analysis].dbo.[Corona Virus Dataset]
   GROUP BY MONTH(Date)
   Order by Month(Date)
   ```
- **Results**
  
  ![image](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/c2794863-0c77-45d5-b8e9-8575b892bd66)

**9. Check how corona virus spread out with respect to confirmed case**
     (Eg.: total confirmed cases, their average, variance & STDEV )
   ```SQL
   Select SUM(Confirmed)as total_confirmed, AVG(Confirmed) as avg_confirmed, ROUND(VAR(Confirmed),2) as variance_confirmed, ROUND(STDEV(Confirmed),2) as stdev_confirmed
   from [Corona virus Analysis].dbo.[Corona Virus Dataset]
   ```
- **Results**
  
  ![image](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/0f2192ab-ea63-41d9-9ae6-769ecf4246c4)

**10. Check how corona virus spread out with respect to death case per month**
   (Eg.: total confirmed cases, their average, variance & STDEV )
   ```SQL
   Select DISTINCT(MONTH(Date)) as month, SUM(Deaths)as total_deaths, AVG(Deaths) as avg_deaths, ROUND(VAR(Deaths),2) as death_variance, ROUND(STDEV(Deaths),2) as stdev_death
   from [Corona virus Analysis].dbo.[Corona Virus Dataset]
   GROUP BY MONTH(Date)
   Order by MONTH(Date)
   ```
- **Results**
  
  ![image](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/96fd2653-be08-45b1-ab7a-d789575f0cfd)

11. **Check how corona virus spread out with respect to recovered case**
    (Eg.: total confirmed cases, their average, variance & STDEV )
    ```SQL
    Select SUM(Recovered)as total_recovered, AVG(Recovered) as avg_recovered, ROUND(VAR(Recovered),2) as Recovered_variance, ROUND(STDEV(Recovered),2) as stdev_recovered
    from [Corona virus Analysis].dbo.[Corona Virus Dataset]
    ```
 - **Results**
   
   ![image](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/03da09af-1711-419e-a86c-205281111333)

12. **Find Country having highest number of the Confirmed case**
    ```SQL
    Select TOP 1 Country_Region, MAX(Confirmed) as highest_number_of_confirmed_cases
    from [Corona virus Analysis].dbo.[Corona Virus Dataset]
    GROUP BY Country_Region
    Order by highest_number_of_confirmed_cases DESC
    ```
- **Results**
  
  ![image](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/855e0d21-65a7-4fd4-bf73-e1cc3a92c0d1)

13. **Find Country having lowest number of the death case**
    ```SQL
    Select TOP 1  Country_Region, MIN(Deaths) as lowest_number_of_death_cases
    from [Corona virus Analysis].dbo.[Corona Virus Dataset]
    GROUP BY Country_Region
    Order by lowest_number_of_death_cases DESC
    ```
- **Results**
  
  ![image](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/607ec9e0-9790-4f05-822a-ffb236c4dfac)

14. **Find top 5 countries having highest recovered case**
    ```SQL
    Select TOP 5  Country_Region, Max(Recovered) as highest_recovered_cases
    from [Corona virus Analysis].dbo.[Corona Virus Dataset]
    GROUP BY Country_Region
    Order by highest_recovered_cases DESC
    ```
  - **Results**
    
    ![image](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/f705c58b-3572-4eb4-8fa6-c6046670f0bd)

### Key Insights
---
- The pandemic occurred between 2020-01-22 and 2021-06-13.
- December 2020 presented to have the highest average confirmed cases,average deaths and average recovered cases.
- Turkey presented to have the highest number of confirmed cases.
- Gambia presented to have the lowest number of death cases.
- The top 5 countries with the highest number of recovered cases were Turkey, India, Brazil, US and Columbia, which would suggest effective treatment measures and healthcare
  delivery practices.
- There was a higher variance in the spread of corona virus in relation to the total cases confirmed, total deaths and total recovered. This suggested that the situation was less 
  controlled and control measures such as social distancing were not effective.
- The variance gap shed light on the differences in healthcare access and treatment measures across regions which led to delayed recovery.

### Conclusion/Recommendation
---
- Noting the high variance in the confirmed and death cases, there will be a need for implementing uniform reporting standards in future, to  ensure consistency in the
    data collection and help in minimizing errors.
- In future, there will be a need to bolster healthcare resources for them to be well-equipped to handle surges in cases, which would hasten recovery . This would apply in
    a case of an health pandemic.

  

