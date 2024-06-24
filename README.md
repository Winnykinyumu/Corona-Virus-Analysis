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
- Write a code to check NULL values
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
1. check total number of rows
   ```SQL
   select COUNT(*)as total_rows
   from [Corona virus Analysis].dbo.[Corona Virus Dataset]
   ```
- **Results**
  
  ![image](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/3267b297-588a-4bcd-8707-349b636c2bbb)

2. Check what is start_date and end_date
   ```SQL
   select MIN(Date)as start_date, MAX(Date) as end_date
   from [Corona virus Analysis].dbo.[Corona Virus Dataset]
   ```
- **Results**
  
  ![image](https://github.com/Winnykinyumu/Corona-Virus-Analysis/assets/124139386/d041db4b-48c7-48c6-9d15-4e5e8aff497b)

5. Number of month present in dataset
6. Find monthly average for confirmed, deaths, recovered
7. Find most frequent value for confirmed, deaths, recovered each month
8. Find minimum values for confirmed, deaths, recovered per year
9. Find maximum values of confirmed, deaths, recovered per year
10. The total number of case of confirmed, deaths, recovered each month
11. Check how corona virus spread out with respect to confirmed case
     (Eg.: total confirmed cases, their average, variance & STDEV )
12. Check how corona virus spread out with respect to death case per month
   (Eg.: total confirmed cases, their average, variance & STDEV )
13. Check how corona virus spread out with respect to recovered case
    (Eg.: total confirmed cases, their average, variance & STDEV )
14. Find Country having highest number of the Confirmed case
15. Find Country having lowest number of the death case
16. Find top 5 countries having highest recovered case
  

