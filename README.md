# DS-Job-Analysis

The objective of this project is to analyze the U.S. data scientist/analyst job market. For the first part of the project, we will scrape job listing data from Indeed and perform data cleaning to build a database encompassing scientist/analyst jobs across the country. Then, we will conduct some exploratory data analysis to identify some general information such as locations with the most opportunities and differences in job titles as well as salaries. Next, we will write an algorithm to parse job summaries to identify the tools, skills, majors, and degrees that employers are currently looking for. Last but not least, we will perform feature engineering and build some models to predict data scientist/analyst job market trends in the future, as well as to provide practical recommendations to both employers and employees (current and prospective). 

## Goals

Other projects for reference:
http://rstudio-pubs-static.s3.amazonaws.com/495949_1ab68b7e55cf4a3ab1fc00285e28fbcc.html

Salary data source:
https://h1bdata.info/

Beautiful Soup documentation:
https://www.crummy.com/software/BeautifulSoup/bs4/doc/

Clean data
* Remove some messy characters from Summary and Description columns
* Identify missing titles, companies, and locations
* Standardize salaries
* Remove duplicates

Skills
* Identify most frequent languages, tools, techinical topics, degrees, and soft skills
* Visualize with ggplot

Locations
* Where are most job listings located
* Visualize with ggplot
* Visualize job locations on US map with ggmap

Salary
* Visualize salaries by location 
* Visualize salaries by job title

Time
* Visualize job listings over time

Prediction
* Build model to predict data science salary and skills