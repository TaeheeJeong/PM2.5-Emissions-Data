# Assignment: Exploratory Data Analysis_Course Project_2
# author: Taehee Jeong
# date: 06/06/2016
# National Emissions Inventory (NEI)
# PM2.5 Emissions Data 

## Load data (big size)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset for Baltimore
NEI_Baltimore<-subset(NEI,fips=="24510")

## ggplot for total PM2.5 emission in Baltimore
library(ggplot2)
g<-ggplot(NEI_Baltimore,aes(year,log10(Emissions)))
g+geom_point()+facet_grid(.~type)+geom_smooth(method="lm")+ylab(expression("log"*PM[2.5]))

# save plot as png file
dev.copy(png,file="plot3.png")
dev.off()