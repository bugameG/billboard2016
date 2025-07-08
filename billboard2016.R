# Loading libraries
library(tidyverse)
library(readxl)

bb <- read_csv("charts.csv")

# Modifying BILLBOARD HOT 100 DATA
bb <- bb |>
  distinct() |> 
  rename("last_week"=`last-week`,
         "peak_rank"=`peak-rank`,
         "weeks_on_chart"=`weeks-on-board`) |> 
  mutate("year"=year(date),
         "month"=month(date),
         "week"=week(date))

# PICKING 2016 DATA
bb16 <- bb |> 
  filter(year == 2016) |> 
  arrange(date)

## MOST WEEKS AT NUMBER 1
top_songs <- bb16 |> 
  filter(rank == 1) |> 
  select(artist, song) |> 
  group_by(song, artist) |> 
  summarise(Weeks_at_number_one = n()) |> 
  arrange(desc(Weeks_at_number_one))

# NOTES:
# 1. 11 unique songs topped the Billboard Hot 100 chart in 2016
# 2. The Chainsmoker Ft. Halsey's Closer spent the most number of weeks at Number 1 - 12 weeks
# 3. Justin Bieber and Drake each had 2 songs at number 1 
# 4. 5 out of 11 songs had featuring artists ,6 were singles.

### CHAINSMOKERS FT. HALSEY - CLOSER
bb16 |> 
  filter(song == "Closer") |> 
  select(date, week, month, artist, song, rank)

# NOTES:
# 1. Closer debuted at Number 9 on the Billboard Hot 100 on the week of 20TH August 2016 
# 2. Since its debut, it took 2 weeks to ascend to Number 1 on the week of 3RD September 2016
# 3. It solidified it spot at Number 1 for the next 12 weeks ,the highest recorded for 2016, and was finally replaced on the week of
#    26TH NOVEMBER 2016
# 4. The song finished 3RD on the Year-end chart after spending 20 weeks on the chart


### DRAKE FT. WIZKID AND KYLA - CLOSER
bb16 |> 
  filter(song == "One Dance") |> 
  select(date, week, month, artist, song, rank) 

# NOTES:
# 1. One Dance debuted at Number 21 on the Billboard Hot 100 on the week of 23RD April 2016 
# 2. Since its debut, it took 4 weeks to ascend to Number 1 , doing so on the week of 21ST May 2016
# 3. It peaked in week 21 ,dropped to Number 2 in week 22, and then topped the charts from week 23 upto   
#  week 31
# 4. The song made its final appearance on the 2016 chart in week 52 at Number 47,
# after spending 36 weeks on the charts


### RIHANNA FT. DRAKE - WORK
bb16 |> 
  filter(song == "Work") |> 
  select(date, week, month, artist, song, rank)


# NOTES:
# 1. Work debuted at Number 9 on the Billboard Hot 100 on the week of 13TH February 2016 
# 2. Since its debut, it took 3 weeks to ascend to Number 1 , doing so on the week of 05TH MARCH 2016
# 3. It topped the charts for 9 weeks. It dropped to Number 4 on the week of 07TH MAY 2016 
# 4. The song made its final appearance on the 2016 chart in week 42 at Number 45 after spending 36 weeks on the 2016 charts


### RAE SREMMURD FT. GUCCI MANE - BLACK BEATLES
bb16 |> 
  filter(song == "Black Beatles") |> 
  select(date, week, month, artist, song, rank)


# NOTES:
# 1. Black Beatles debuted at Number 96 on the Billboard Hot 100 on the week of 01ST OCTOBER 2016 
# 2. Since its debut, it took 8 weeks to ascend to Number 1 , doing so on the week of 26TH NOVEMBER 2016
# 3. It topped the charts for the last 6 weeks of 2016   
# 4. The song ranked Number 1 on the Year-end chart after spending 14 weeks on the charts in 2016


### SIA FT. SEAN PAUL - CHEAP THRILLS
bb16 |> 
  filter(song == "Cheap Thrills") |> 
  select(date, week, month, artist, song, rank)


# NOTES:
# 1. Cheap Thrills debuted at Number 81 on the Billboard Hot 100 on the week of 05TH MARCH 2016 
# 2. Since its debut, it took 22 weeks to ascend to Number 1 , doing so on the week of 06TH AUGUST 2016
# 3. It topped the charts for 4 weeks, it then dropped to position 2 in week 36   
# 4. The song ranked Number 41 on the Year-end chart, after spending 44 weeks on the chart in 2016


### ADELLE - HELLO
bb16 |> 
  filter(song == "Hello") |> 
  select(date, week, month, artist, song, rank)


# NOTES:
# 1. Hello kicked off the year at the top of the Hot 100 chart on the week of 02ND JANUARY 2016 
# 2. It spent the first 3 weeks of 2016 at the top and then dropped to number 2 on the week of 23RD JANUARY 2016  
# 3. The song made its final appearance on the 2016 chart on the week of 07TH MAY 2016 at position 36


# bb16 |>  group_by(song, artist) |> 
#   summarise(Rank = ceiling(median(rank))) |> arrange(Rank) |> distinct()
