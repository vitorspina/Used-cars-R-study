if (!require("dplyr")) install.packages("dplyr")
library(dplyr)
library(ggplot2)

setwd("E:/R/Used-cars-R-study")

df = read.csv("E:/R/Used-cars-R-study/Used_Cars_Data/autos.csv")


df  = df %>% 
  mutate(notRepairedDamage = gsub('ja',"Y",notRepairedDamage))

df  = df %>% 
  mutate(notRepairedDamage = gsub('nein',"N",notRepairedDamage))

df_control = df %>% 
  filter(df$abtest == "control")

df_test = df %>% 
  filter(df$abtest == "test")

top_10_brands = df %>%
  group_by(brand) %>%
  summarise(price = sum(price)) #%>% head(sort(top_10_brands$price,decreasing=TRUE), n = 10)

top_10_count = df %>%
  count(brand) #%>% head(sort(top_10_count$n,decreasing=TRUE), n = 10)
