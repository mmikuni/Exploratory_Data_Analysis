library(ggplot2)

#reading data into R
nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#finding out which SCC labels correspond to coal sources
#subsets scc data frame based on coal sources
coalscc <- scc[scc$EI.Sector == "Fuel Comb - Electric Generation - Coal" | 
              scc$EI.Sector == "Fuel Comb - Comm/Institutional - Coal" | 
              scc$EI.Sector == "Fuel Comb - Industrial Boilers, ICEs - Coal",]

#gets SCC numbers from subsetted data
coalsccnames <- unique(coal$SCC)

#subsets nei data set based on coal scc names
coal <- nei[nei$SCC %in% coalsccnames, ]

aggsumscoal <- aggregate(coal$Emissions, by = list(coal$year), FUN = sum)

png("plot4.png")
ggplot(aggsumscoal, aes(Group.1, x)) + geom_line() + labs(title = "Emissions from Coal", x = "Year", y = expression("PM" [2.5] ~ "Emitted (tons)"))
dev.off()