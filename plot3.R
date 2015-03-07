filename <- "C:/Users/samip/Documents/exdata-data-household_power_consumption/household_power_consumption.txt"
data <- read.table(filename,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

mydata <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

datetime <- paste(as.Date(mydata$Date), mydata$Time)
mydata$Datetime <- as.POSIXct(datetime)

with(mydata, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub meeting", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()