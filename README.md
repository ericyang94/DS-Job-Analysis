# Data Science Job Market Analysis

## Summary

The objective of this project is to analyze the U.S. data scientist job market. I will scrape job listing data from Indeed and perform data cleaning to build a database encompassing scientist jobs across the country. Then, I will conduct some exploratory data analysis to identify some general information such as locations with the most opportunities and differences in job titles as well as salaries. Next, I will parse job summaries to identify the tools, skills, majors, and degrees that employers are currently looking for. Last but not least, I will perform feature engineering and build some models to predict data scientist job market trends in the future to provide practical recommendations to data science job seekers.

## Goals

Clean data
* Remove some messy characters from Summary and Description columns
* Identify missing titles, companies, and locations
* Remove duplicates
* Standardize salaries
* Categorize junior and senior positions

Skills
* Identify preferred qualifications: languages, tools, techinical topics, degrees, and soft skills
* Visualize with ggplot

Locations
* Identify hottest locations for job listings
* Visualize with ggplot
* Visualize job locations on US map with ggmap

Salary
* Visualize salaries by location 
* Visualize salaries by job title

Time
* Visualize job listings over time

Prediction
* Build model to predict data science salary and skills

## Resources

Other projects for reference:
http://rstudio-pubs-static.s3.amazonaws.com/495949_1ab68b7e55cf4a3ab1fc00285e28fbcc.html

Job listing data source:
https://www.indeed.com/

Salary data source:
https://h1bdata.info/

Beautiful Soup documentation:
https://www.crummy.com/software/BeautifulSoup/bs4/doc/