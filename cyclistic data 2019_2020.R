X2019member_casual <- read_excel("2019member_casual.xlsx")
X2020member_casual <- read_excel("2020member_casual.xlsx")

X2019member_casual = X2019member_casual %>% mutate(year="2019")
X2020member_casual = X2020member_casual %>% mutate(year="2020")

a = bind_rows(X2019member_casual,X2020member_casual)

b = a %>% 
  group_by(year,member_casual) %>% 
  summarise(count = n (), .groups = "drop")
print(b)

ggplot(data=b)+ geom_bar(mapping=aes(x=member_casual,y=count,fill = year),
                         stat = "identity",position="dodge")+
  scale_y_continuous(labels = comma)+
  labs(title = "member_casual comparison of 2019 and 2020 Q1 cyclistic data",
       x="member_casual",y="Ride Count")