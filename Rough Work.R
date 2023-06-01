library(dplyr)

data<-read.csv("Raw Data/AFG2245 Plate 5 NP.csv")
data<-data %>% select(Well, CNV)

data<-subset(data, data$CNV !="NA")
str(data)

data<-data %>%
    mutate(column = case_when(
        endsWith(Well,"01")~"1",
        endsWith(Well,"02")~"2",
        endsWith(Well,"03")~"3",
        endsWith(Well,"04")~"4",
        endsWith(Well,"05")~"5",
        endsWith(Well,"06")~"6",
        endsWith(Well,"07")~"7",
        endsWith(Well,"08")~"8",
        endsWith(Well,"09")~"9",
        endsWith(Well,"10")~"10",
        endsWith(Well,"11")~"11",
        endsWith(Well,"12")~"12"
    ))
data$column<-as.numeric(data$column)
data<-data[order(data$column), ]
