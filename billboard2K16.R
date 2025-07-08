# LOADING PACKAGES
library(tidyverse)

# LOADING BILLBOARD DATA
charts <- read_csv("charts.csv")

# RENAMING COLUMNS & ORDERING DATES
charts <- charts |> 
  rename("last_week_rank"=`last-week`,"peak_rank"=`peak-rank`,
               "weeks_on_board"=`weeks-on-board`) |> 
  arrange(date)

# ADDING PERIODICAL VARIABLES
charts <- charts |> 
  mutate("year"=year(date),
         "month"=month(date),
         "week"=week(date))


# EXPORTING DATA
# write_csv(charts, "hot100charts.csv")

# SELECTING 2016 DATA
chart16 <- read_csv("hot100charts.csv") |> 
  filter(year==2016)

#
chart16$artist <- chart16$artist |>
  str_replace("[&]","Ft.") |>
  str_replace("Featuring","Ft.") |> 
  str_replace("[/]","Ft.")


# WRITING 2016 SUBSET TO AN RDS FILE 
write_rds(chart16 ,"bb16.rds")
# write_csv(chart16 ,"chart2016.csv")



