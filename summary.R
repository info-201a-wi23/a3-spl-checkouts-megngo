library('stringr')
library(dplyr)

checkout_data <- read.csv("C:\\Users\\megng\\OneDrive - UW\\School\\Winter 2023\\INFO201\\projects\\2022-2023-All-Checkouts-SPL-Data.csv")


# How many checkouts did the most checked out audiobook have?
most_audiobook_checkout_number <- checkout_data %>% 
  filter(MaterialType == "AUDIOBOOK") %>%
  group_by(Title) %>%
  summarize(sum_checkout = sum(Checkouts, na.rm=TRUE)) %>% 
  filter(sum_checkout == max(sum_checkout)) %>% 
  pull(sum_checkout)
  # September

# What audiobook has the most checkouts?
most_audiobook_checkouts <- checkout_data %>%
  filter(MaterialType == "AUDIOBOOK") %>%
  group_by(Title) %>%
  summarize(sum_checkout = sum(Checkouts, na.rm=TRUE)) %>% 
  filter(sum_checkout == max(sum_checkout)) %>% 
  pull(Title)
# September

# What is the most amount of checkouts for books within a month?
most_checkouts_num <- checkout_data %>% 
  filter(MaterialType == "BOOK") %>%
  filter(Checkouts == max(Checkouts)) %>% 
  pull(Checkouts)

# What is the book checked out most within a month
most_checkouts <- checkout_data %>% 
  filter(MaterialType == "BOOK") %>%
  filter(Checkouts == max(Checkouts)) %>% 
  pull(Title)

# What was the most amount of checkouts for books?
most_book_checkout_number <- checkout_data %>% 
  filter(MaterialType == "BOOK") %>%
  group_by(Title) %>%
  summarize(sum_checkout = sum(Checkouts, na.rm=TRUE)) %>% 
  filter(sum_checkout == max(sum_checkout)) %>% 
  pull(sum_checkout)

# What book was most checked out this year?
most_book_checkouts <- checkout_data %>% 
  filter(MaterialType == "BOOK") %>%
  group_by(Title) %>%
  summarize(sum_checkout = sum(Checkouts, na.rm=TRUE)) %>% 
  filter(sum_checkout == max(sum_checkout)) %>% 
  pull(Title)