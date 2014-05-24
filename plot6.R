library(ggplot2)

#reading data into R
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#subsets data based on the code for the city of Baltimore and Los Angeles
baltimore_losangeles <- nei[nei$fips == "24510" | nei$fips ==  "06037", ]

#subsets based on motor vehicles, type = ON-ROAD
bla_vehicles <- baltimore_losangeles[baltimore_losangeles$type == "ON-ROAD", ]

aggsumsbla <- aggregate(bla_vehicles$Emissions, by = list(bla_vehicles$year, bla_vehicles$fips), FUN = sum)

#creating change in tons to better visualize change
aggsumsbladiff <- aggsumsbla
aggsumsbladiff[1:4,]$x <- aggsumsbladiff[1:4,]$x - aggsumsbladiff[1,]$x
aggsumsbladiff[5:8,]$x <- aggsumsbladiff[5:8,]$x - aggsumsbladiff[5,]$x

#creating meaningful names for locations
aggsumsbladiff$Group.2 <- factor(aggsumsbladiff$Group.2, labels = c("Los Angeles", "Baltimore"))

png("plot6.png")
ggplot(aggsumsbladiff, aes(Group.1, x, colour = Group.2)) + 
      geom_line() + 
      labs(title = "Motor Vehicle Emissions for Los Angeles and Baltimore", x = "Year", y = expression("Change in PM" [2.5] ~ "Emitted (tons)")) + 
      theme(legend.title = element_blank())
dev.off()