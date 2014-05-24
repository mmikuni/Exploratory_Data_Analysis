library(ggplot2)

#reading data into R
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

baltimore <- subset(nei, fips == 24510)

aggsumsbaltimore2 <- aggregate(baltimore$Emissions, by = list(baltimore$year, baltimore$type), FUN = sum)

png("plot3.png", width = 1200)
ggplot(aggsumsbaltimore2, aes(Group.1, x)) + geom_line() + facet_grid(. ~ Group.2) + labs(x = "Year", y = expression("PM" [2.5] ~ "Emitted (tons)"))
dev.off()