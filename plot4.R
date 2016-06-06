# Assignment: Exploratory Data Analysis_Course Project_2
# author: Taehee Jeong
# date: 06/06/2016
# National Emissions Inventory (NEI)
# PM2.5 Emissions Data 

## Load data (big size)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Explore which EI.sector is related with coal combustion-related sources
#unique(SCC$EI.Sector)

## subset SCC with coal combustion-related sources
SCC_coal<-subset(SCC,EI.Sector==c("Fuel Comb - Electric Generation - Coal","Fuel Comb - Industrial Boilers, ICEs - Coal","Fuel Comb - Comm/Institutional - Coal"))

## subset NEI with coal combustion-related sources using SCC
NEI_coal<-subset(NEI,SCC %in% SCC_coal$SCC)

## ggplot for total PM2.5 emission with coal combustion-related
g<-ggplot(NEI_coal,aes(year,log10(Emissions)))
g+geom_point()+geom_smooth(method="lm")+ylab(expression("log"*PM[2.5]))

# save plot as png file
dev.copy(png,file="plot4.png")
dev.off()

