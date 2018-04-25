Sys.setlocale("LC_ALL","English")
setwd("C:/Users/kieran.cagney/Documents/R")
Plot_read_df <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Plot_df <- subset(Plot_read_df, Date %in% c("1/2/2007","2/2/2007"))
Plot_df$Date <- as.Date(Plot_df$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(Plot_df$Date), Plot_df$Time)
Plot_df$Datetime <- as.POSIXct(datetime)
  with(Plot_df, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()

