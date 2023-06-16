library(ggmap)
library(tidyverse)
library(leaflet)
library(maptools)
library(rgdal)
library(lubridate)
library(viridis)
library(sf)

# connect to Google api
myKey <- 'key_here'
register_google(key = myKey, account_type = "standard", day_limit = 2500)

listings <- read.csv('Indeed_Analysis/listings_unitedstates_cleaned.csv')

# get longitude and latitude for each location
listings <- listings %>%
  mutate(coordinates = geocode(Location), lon = coordinates[[1]], lat = coordinates[[2]])

x <- revgeocode(c(-114,39.7))
 
str_remove(str_remove(str_extract(x,", .*, [A-Z]{2} [0-9]{5}"),", [A-Z]{2} [0-9]{5}"),", ")

# get city and state for each coordinate
for(i in 1:length(listings$lon)){
  listings$address[i] = revgeocode(c(listings$lon[i],listings$lat[i]))
  listings$state[i] = substr(str_extract(listings$address[i],"[A-Z]{2} [0-9]{5}"),1,2)
  listings$city[i] = str_remove(str_remove(str_extract(listings$address[i],", .*, [A-Z]{2} [0-9]{5}"),", [A-Z]{2} [0-9]{5}"),", ")
}

# remove NA values
listings <- listings %>%
  filter(!is.na(state) & !is.na(city))

# save new data
write.csv(listings,'Indeed_Analysis/listings_unitedstates_map.csv')

# plot lon/lat coordinates on US map using ggmap
us_map <- get_map(location='united states', zoom=4, source='google',color='bw')

ggmap(us_map) +
  geom_point(data = listings, aes(x = lon, y = lat, color = state), size = 2, alpha = 0.3) +
  labs(title = "Data Science Job Listing Locations") +
  theme(legend.position = "none")


