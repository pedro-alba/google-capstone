library("dplyr")
library("tidyverse")
library("skimr")
library("janitor")

# project directory
setwd('C:/.../data/google_capstone')
getwd()
here::i_am("prepare/script.R")

# import and bind all .csv files
df <- 
  list.files(here::here("data"),pattern = "*.csv", full.names=TRUE) %>%
  lapply(read_csv) %>% 
  bind_rows

# glimpse. 5.667.717 rows, 13 columns
glimpse(df)
#station counts differ. member_casual and rideable_type to factors.
#lat/lng not complete and p0=0 p100=0
#format date
skim_without_charts(df)
#lat/lng 0 values
summary(df)
# clean names and blank spaces ####
df2 <- clean_names(df)
df2[df2 == 0] <- NA
# remove duplicates
df2 <- distinct(df2)
df2 <- distinct(df2,started_at,ended_at,start_lat,end_lat, .keep_all= TRUE)
# remove rows with incomplete values 
df2 <- df2[complete.cases(df2),]
# factors
df2$member_casual <- as.factor(df2$member_casual)  
df2$rideable_type <- as.factor(df2$rideable_type)
# time and date
df2$started_at <- as.POSIXct(df2$started_at, format = "%Y %b %d %H:%M:%S")
df2$ended_at <- as.POSIXct(df2$ended_at, format = "%Y %b %d %H:%M:%S")
# add ride_duration column
df2 <- mutate(df2,ride_duration = ended_at - started_at)
# add month and hour columns
df2 <- mutate(df2,ride_hour = hour(started_at),ride_month = month(started_at),)
# add weekday column
df2 <- mutate(df2,day = wday(started_at))
# remove station details if irrelevant
df2 <- select(df2, -start_station_name, -start_station_id)
df2 <- select(df2, -end_station_name, -end_station_id)
# getting rid of outliers and negatives in ride_duration
df2 <- subset(df2, as.numeric(ride_duration) > 60)
df2 <- subset(df2, as.numeric(ride_duration) < 57960)
# 4.290.863 rows, 13 columns 
# 1.376.854 rows removed
# export csv
write.csv(df2,file='C:/.../data/google_capstone/exports/cyclistic_data.csv', row.names=FALSE)

