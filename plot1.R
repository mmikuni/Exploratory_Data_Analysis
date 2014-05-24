#reading data into R
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#aggregate data by year and adds the emission totals for each year
aggsums <- aggregate(nei$Emissions, by = list(nei$year), FUN = sum)

#http://stackoverflow.com/questions/13955200/subscripts-in-r-when-adding-other-text
png("plot1.png")
plot(aggsums, type = "l", main = "Total Emissions in the US", xlab = "Year", ylab = expression("PM" [2.5]~~ "emitted(tons)"))
dev.off()