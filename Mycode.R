
#Load library
library(readr)
library(dplyr)

#Load data file
df <- read_csv('BlogOsVinhos.csv')
#Remove specific year
df <- subset(df, Year != 1000 & Year != 1780)
df$Region <- factor(df$Region)

test2 <- test[order(test$n, decreasing = TRUE),]

# Region narrow down
test <- group_by(df, Region) %>% summarise(n=n())
test2 <- test[order(test$n, decreasing = TRUE),]
region_topn <- top_n(test2, 10)
sum(region_topn$n)

mat <- (levels(df$Region) !="Regional Alentejo"&
          levels(df$Region) !="DOC Douro"&
          levels(df$Region) !="DOC Alentejo"&
          levels(df$Region) !="Regional Península de Setúbal"&
          levels(df$Region) !="Espanha"&
          levels(df$Region) !="DOC Dão"&
          levels(df$Region) !="DOC Vinhos Verdes"&
        levels(df$Region) !="Argentina"&
        levels(df$Region) !="França")
levels(df$Region)[mat] <- "Other"

#Create binary variable for producer

df$`Region:Esporão S.A.` <- as.integer(df$Region=="Regional Alentejo")
df$`Region:DOC Douro.` <- as.integer(df$Region=="DOC Douro")
df$`Region:DOC Alentejo.` <- as.integer(df$Region=="DOC Alentejo")
df$`Region:Regional Península de Setúbal.` <- as.integer(df$Region=="Regional Península de Setúbal")
df$`Region:Espanha` <- as.integer(df$Region=="Espanha")
df$`Region:DOC Dão` <- as.integer(df$Region=="DOC Dão")
df$`Region:DOC Vinhos Verdes` <- as.integer(df$Region=="DOC Vinhos Verdes")
df$`Region:Argentina` <- as.integer(df$Region=="Argentina")
df$`Region:França` <- as.integer(df$Region=="França")
df$`Region:Other` <- as.integer(df$Region=="Other")

df$X17 <- NULL
df$X18 <- NULL
df$X19 <- NULL
df$X20 <- NULL
df$Region<- NULL
df$Color<- NULL
df$Castes<- NULL
df$Producer<- NULL
df$Judge<- NULL
df$MinimunPrice<- NULL
df$MaximumPrice<- NULL
df$`Average Price`<- NULL

#Create csv file

write_csv(df, "cleanedwinedata.csv")

#############################################################################################################


#Load library
library(readr)
library(dplyr)

#Load data file
df <- read_csv('BlogOsVinhos.csv')
#Remove specific year
df <- subset(df, Year != 1000 & Year != 1780)
df$Region <- factor(df$Region)

test2 <- test[order(test$n, decreasing = TRUE),]

# Region narrow down
test <- group_by(df, Region) %>% summarise(n=n())
test2 <- test[order(test$n, decreasing = TRUE),]
region_topn <- top_n(test2, 10)
sum(region_topn$n)

mat <- (levels(df$Region) !="Regional Alentejo"&
          levels(df$Region) !="DOC Douro"&
          levels(df$Region) !="DOC Alentejo"&
          levels(df$Region) !="Regional Península de Setúbal"&
          levels(df$Region) !="Espanha"
)
levels(df$Region)[mat] <- "Other"

#Create binary variable for producer

df$`Region:Esporão S.A.` <- as.integer(df$Region=="Regional Alentejo")
df$`Region:DOC Douro.` <- as.integer(df$Region=="DOC Douro")
df$`Region:DOC Alentejo.` <- as.integer(df$Region=="DOC Alentejo")
df$`Region:Regional Península de Setúbal.` <- as.integer(df$Region=="Regional Península de Setúbal")
df$`Region:Espanha` <- as.integer(df$Region=="Espanha")
df$`Region:Other` <- as.integer(df$Region=="Other")

df$X17 <- NULL
df$X18 <- NULL
df$X19 <- NULL
df$X20 <- NULL
df$Region<- NULL
df$Color<- NULL
df$Castes<- NULL
df$Producer<- NULL
df$Judge<- NULL
df$MinimunPrice<- NULL
df$MaximumPrice<- NULL
df$`Average Price`<- NULL

#Create csv file

write_csv(df, "cleanedwinedata.csv")


