# Assignment: Exploratory Data Analysis_Course Project_2
# author: Taehee Jeong
# date: 06/06/2016
# National Emissions Inventory (NEI)
# PM2.5 Emissions Data 

## Load data (big size)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## boxplot for total PM2.5 emission for each years 1999, 2002, 2005, and 2008.
boxplot(log10(NEI$Emissions) ~ NEI$year, xlab="year",ylab="log(PM2.5)")

# save plot as png file
dev.copy(png,file="plot1.png")
dev.off()