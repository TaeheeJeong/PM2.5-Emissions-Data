# Assignment: Exploratory Data Analysis_Course Project_2
# author: Taehee Jeong
# date: 06/06/2016
# National Emissions Inventory (NEI)
# PM2.5 Emissions Data 

## Load data (big size)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Explore which EI.sector is related with motor vehicle sources
#unique(SCC$EI.Sector)

## subset SCC with motor vehicle sources
mobile<-c("Mobile - On-Road Gasoline Light Duty Vehicles","Mobile - On-Road Gasoline Heavy Duty Vehicles","Mobile - On-Road Diesel Light Duty Vehicles","Mobile - On-Road Diesel Heavy Duty Vehicles","Mobile - Non-Road Equipment - Gasoline","Mobile - Non-Road Equipment - Other","Mobile - Non-Road Equipment - Diesel","Mobile - Aircraft","Mobile - Commercial Marine Vessels","Mobile - Locomotives")

SCC_motor<-subset(SCC,EI.Sector==mobile)
NEI_motor<-subset(NEI,SCC %in% SCC_motor$SCC)


## subset NEI with motor vehicle sources within Baltimore
NEI_motor_Baltimore<-subset(NEI_motor, fips=="24510")

## subset NEI with motor vehicle sources within Los Angeles County
NEI_motor_LA<-subset(NEI_motor, fips=="06037")

## plot 
par(mfrow=c(1,2))
boxplot(log10(NEI_motor_Baltimore$Emissions)~NEI_motor_Baltimore$year,xlab="year",ylab="log(PM2.5)_Baltimore",ylim=c(-7,3))
boxplot(log10(NEI_motor_LA$Emissions)~NEI_motor_LA$year,xlab="year",ylab="log(PM2.5)_LA",ylim=c(-7,3))

# save plot as png file
dev.copy(png,file="plot6.png")
dev.off()




