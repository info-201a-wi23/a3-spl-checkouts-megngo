library(ggplot2)
checkout_data <- read.csv("C:\\Users\\megng\\OneDrive - UW\\School\\Winter 2023\\INFO201\\projects\\2022-2023-All-Checkouts-SPL-Data.csv")


diff_type_data <- checkout_data %>% 
  group_by(MaterialType) %>% 
  summarize(total_checkouts = sum(Checkouts, na.rm=TRUE)) %>% 
  filter(total_checkouts >= 5000)

ggplot(diff_type_data, aes(x = MaterialType, y = total_checkouts, fill = total_checkouts)) +
  labs(title = "Total Checkouts 2022-2023",
       x = "Material Type",
       y = "# of Checkouts",
       fill = "Total Checkouts") +
  geom_bar(stat = "identity") +
  coord_flip()