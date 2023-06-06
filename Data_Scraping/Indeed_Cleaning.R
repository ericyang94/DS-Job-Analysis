library(dplyr)
library(stringr)

listings <- read.csv('listings_unitedstates.csv')

# Remove job listings with empty descriptions and remove leftover html tags from descriptions
listings <- listings %>%
  filter(Description != "") %>%
  mutate(Description = str_replace_all(Description, "<.*?>", ""))
  

write.csv(listings,'listings_unitedstates_cleaned.csv')
