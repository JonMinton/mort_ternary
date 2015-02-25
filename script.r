rm(list=ls())

require(plyr)
require(tidyr)
require(dplyr)
require(ggplot2)
require(ggtern)


counts <- read.csv("data/counts.csv")

counts <- counts %>%
  tbl_df %>%
  mutate(death_rate=death_count/population_count)

eng <- counts %>%
  filter(country=="GBRTENW") %>%
  filter(sex=="total") %>%
  filter(age < 80)

ggtern(aes(x=age, y=year, z=log(death_rate)), data=eng) + geom_point()


# Rejecting this approach - doesn't seem useful