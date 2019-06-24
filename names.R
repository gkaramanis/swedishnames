library(tidyverse)
library(readxl)
library(here)


gcol <- read_excel(here("girls2.xlsx"), sheet = "Flickor", range = cell_rows(5:5)) %>% 
  names()

gnames <- read_excel(here("girls2.xlsx"), range = cell_rows(6:1025), 
                    col_names = gcol)

ggnames <- gnames %>% 
  gather(year, n, "1998":"2018")


bcol <- read_excel(here("boys2.xlsx"), sheet = "Pojkar", range = cell_rows(5:5)) %>% 
  names()

bnames <- read_excel(here("boys2.xlsx"), range = cell_rows(6:1025), 
                    col_names = bcol)

gbnames <- bnames %>% 
  gather(year, n, "1998":"2018")


common <- ggnames %>% inner_join(., gbnames, by = "Namn")                           

common %>%
  ggplot() +
  geom_jitter(aes(year.x, Namn), color = "blue", alpha = "0.5") +
  geom_jitter(aes(year.y, Namn), color = "pink", alpha = "0.5") +
  ggsave(here("names.png"))

  
