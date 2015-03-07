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

plot(mydata$Global_active_power ~ mydata$Datetime, type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()