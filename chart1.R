library(ggplot2)
checkout_data <- read.csv("C:\\Users\\megng\\OneDrive - UW\\School\\Winter 2023\\INFO201\\projects\\2022-2023-All-Checkouts-SPL-Data.csv")

checkout_data <- mutate(checkout_data, date = paste(CheckoutYear, CheckoutMonth, "01", sep="-"))
checkout_data$date <- as.Date(checkout_data$date, "%Y-%m-%d")

book_data <- checkout_data %>% 
  filter(MaterialType == "BOOK" | MaterialType == "AUDIOBOOK") %>% 
  group_by(MaterialType, date) %>% 
  summarize(total_checkouts = sum(Checkouts, na.rm=TRUE))

total_book_checkouts <- book_data %>% 
  filter(MaterialType == "BOOK") %>% 
  pull(total_checkouts)
  
total_audiobook_checkouts <- book_data %>% 
  filter(MaterialType == "AUDIOBOOK") %>% 
  pull(total_checkouts)

ggplot(book_data, aes(x=date, y = total_checkouts, color = MaterialType)) +
  geom_line() +
  labs(title = "Total Monthly Book vs. Audiobook Checkouts", x = "Month", y = "# of Checkouts")

  
