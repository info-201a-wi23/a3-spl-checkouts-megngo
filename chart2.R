library(ggplot2)
checkout_data <- read.csv("C:\\Users\\megng\\OneDrive - UW\\School\\Winter 2023\\INFO201\\projects\\2022-2023-All-Checkouts-SPL-Data.csv")

checkout_data <- mutate(checkout_data, date = paste(CheckoutYear, CheckoutMonth, "01", sep="-"))
checkout_data$date <- as.Date(checkout_data$date, "%Y-%m-%d")

type_data <- checkout_data %>% 
  group_by(UsageClass, date) %>% 
  summarize(total_checkouts = sum(Checkouts, na.rm=TRUE))

ggplot(type_data, aes(x=date, y = total_checkouts, color = UsageClass)) +
  geom_line() +
  labs(title = "Total Monthly Physical vs. Digital Checkouts", x = "Month", y = "# of Checkouts")