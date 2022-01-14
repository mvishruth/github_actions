#load packages
library(ralger)
library(dplyr)
library(magrittr)
library(readr)

#scrape table from page
data <- ralger::table_scrap("https://goldprice.org/cryptocurrency-price") %>% 
  select(-8) %>% 
  mutate(DateTime = Sys.time()) #addtime of scraping

#write data to file,  new data in append mode

readr::write_excel_csv(data, "data/data.csv",
            sep = ",", col.names = !file.exists("data/data.csv"),
            append = T, row.names = F
            )


