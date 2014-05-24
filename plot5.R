library(ggplot2)

#reading data into R
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#subsets data based on the zip code for the city of Baltimore
baltimore <- subset(nei, fips == "24510")

#subsets based on motor vehicles, type = ON-ROAD
baltimore_vehicles <- baltimore[baltimore$type == "ON-ROAD", ]

aggsumsbv <- aggregate(baltimore_vehicles$Emissions, by = list(baltimore_vehicles$year), FUN = sum)

png("plot5.png")
ggplot(aggsumsbv, aes(Group.1, x)) + geom_line() + labs(title = "Emissions from Baltimore Motor Vehicles", x = "Year", y = expression("PM" [2.5] ~ "Emitted (tons)"))
dev.off()