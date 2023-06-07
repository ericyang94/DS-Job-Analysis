library(tidyverse)

listings <- read.csv('Indeed_Analysis/listings_unitedstates_Categorized.csv')

# search for key languages
listings <- listings %>%
    mutate(python = grepl("[ ,][pP]ython[ ,]", Description),
         r = grepl("[ ,][rR][ ,]", Description),
         sql = grepl("[ ,][sS][qQ][lL][ ,]", Description),
         java = grepl("[ ,][jJ]ava[ ,]", Description),
         scala = grepl("[ ,][sS]cala[ ,]", Description),
         c = grepl("[ ,]C[ ,]|[ ,]C\\+\\+[ ,]|[ ,]C/C\\+\\+[ ,]", Description),
         julia = grepl("[ ,][jJ]ulia[ ,]", Description),
         javascript = grepl("[ ,][jJ]ava[sS]cript[ ,]", Description))

languages_all <- listings %>%
  summarize(Python = mean(python),
            R = mean(r),
            SQL = mean(sql),
            Java = mean(java),
            Scala = mean(scala),
            `C/C++` = mean(c),
            Julia = mean(julia),
            JavaScript = mean(javascript))%>%
  gather(language, proportion, Python, R, SQL, Java, Scala, `C/C++`, Julia, JavaScript)

languages_all %>% ggplot(aes(x = reorder(language,-proportion), y = proportion)) +
  geom_bar(stat = "identity", aes(fill = language)) +
  labs(x = "Programming Languages", y = "Proportion Mentioned", title = "Top Data Science Programming Languages") +
  theme_light() +
  theme(legend.position = "none")
  
languages <- listings %>%
  group_by(Position) %>%
  summarize(Python = mean(python),
            R = mean(r),
            SQL = mean(sql),
            Java = mean(java),
            Scala = mean(scala),
            `C/C++` = mean(c),
            Julia = mean(julia),
            JavaScript = mean(javascript)) %>%
  gather(language, proportion, Python, R, SQL, Java, Scala, `C/C++`, Julia, JavaScript, -c(Position))

languages %>% ggplot(aes(x = reorder(language,-proportion), y = proportion)) +
  geom_bar(stat = "identity", position = "dodge", aes(fill = Position)) +
  labs(x = "Programming Languages", y = "Proportion Mentioned", title = "Top Data Science Programming Languages by Position") +
  theme_light()



