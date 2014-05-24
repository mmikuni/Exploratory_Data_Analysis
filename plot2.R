#reading data into R
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

baltimore <- subset(nei, fips == 24510)
aggsumsbaltimore <- aggregate(baltimore$Emissions, by = list(baltimore$year), FUN = sum)


png("plot2.png")
plot(aggsumsbaltimore, type = "l", main = "Total Emissions in Baltimore", xlab = "Year", ylab = expression("PM" [2.5]~~ "emitted(tons)"))
dev.off()