Sys.setlocale("LC_ALL","English")
setwd("C:/Users/kieran.cagney/Documents/R")
Plot1_read_df <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Plot1_df <- subset(Plot1_read_df, Date %in% c("1/2/2007","2/2/2007"))
Plot1_df$Date <- as.Date(Plot1_df$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(Plot_df$Date), Plot_df$Time)
Plot_df$Datetime <- as.POSIXct(datetime)
hist(Plot1_df$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()