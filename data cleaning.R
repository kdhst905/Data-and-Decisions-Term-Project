
library(readr)
library(ggplot2)
library(dplyr)

df <- read_csv('BlogOsVinhos.csv')
df <- subset(df, Year != 1000 & Year != 1780)
df$Year_binned <- cut(df$Year, breaks = c(1980,1985,1990,2000,2005,2010,2015,2020))
df$Region <- factor(df$Region)
df$Castes <- factor(df$Castes)
df$Producer <- factor(df$Producer)
df$Judge <- factor(df$Judge)

test <- group_by(df, Producer) %>% summarise(n=n())
test2 <- test[order(test$n, decreasing = TRUE),]
test3 <- top_n(test2, 20)

summ <- 0
for (i in test3$n) {
  summ <- summ + i
}

data <- data.frame

for (i in df$Producer) {
  if (i in test3$Producer) {
    print(i)
  }
}

# Castes narrow down
castes_test <- group_by(df, Castes) %>% summarise(n=n())
castes_test2 <- castes_test[order(test$n, decreasing = TRUE), ]
castes_topn <- top_n(castes_test2, 5)
sum(castes_topn$n)

# Producer narrow down
test <- group_by(df, Producer) %>% summarise(n=n())
test2 <- test[order(test$n, decreasing = TRUE),]
prod_topn <- top_n(test2, 5)
sum(prod_topn$n)

# Region narrow down
test <- group_by(df, Region) %>% summarise(n=n())
test2 <- test[order(test$n, decreasing = TRUE),]
region_topn <- top_n(test2, 5)
sum(region_topn$n)

# Judge narrow down
test <- group_by(df, Judge) %>% summarise(n=n())
test2 <- test[order(test$n, decreasing = TRUE),]
judge_topn <- top_n(test2, 5)
sum(judge_topn$n)

# Plots

p <- qplot(Year, JudgeRating, data = df, geom = 'bar')
