mydirectory <- "E:/Training/R/Coursera/Exploaratory Analysis/exdata%2Fdata%2Fhousehold_power_consumption"
setwd(mydirectory) 

#Read Data
Energy <- read.csv2("household_power_consumption.txt", header = TRUE , sep = ";", 
                    stringsAsFactors=FALSE) 
Energy_Copy <- Energy
Energy_Copy$Date  = as.Date(Energy_Copy$Date,"%d/%m/%Y")     

#Feb Data
Energy_Feb <- subset( Energy_Copy, Date >= "2007-02-01" & Date <= "2007-02-02" ) 

#Plot2 

Energy_Feb$Global_active_power <- as.numeric(Energy_Feb$Global_active_power)
Energy_Feb <- transform(Energy_Feb, DateTime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

with(Energy_Feb,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)" , xlab = ""))

dev.copy(png, file="plot2.png" , width=480, height=480, units="px")
dev.off()
