# Packages
library(tidyverse)
library(ggplot2)


######
bank <- read_csv("WAEMU_Banking.csv")
bank$Countries <- chartr("éô", "eo", bank$Countries)
bank <- bank %>% mutate(financial_health = if_else(Zscore <= 1.65, "bad", "good")) %>%
  select(-1)
bank$financial_health <- as.factor(bank$financial_health)

## categorical variable financial_health based on zscore column - 5% or less liklihood of going bankrupt in next two years.

# user select year
table(filter(bank, Year ==2017)$Countries, filter(bank, Year == 2017)$financial_health)

bank %>% 
  filter(Countries == "Benin") %>% 
  group_by(id, Banks) %>% 
  summarize(debt = mean(INL))
