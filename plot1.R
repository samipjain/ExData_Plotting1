filename <- "C:/Users/samip/Documents/exdata-data-household_power_consumption/household_power_consumption.txt"

#READING DATASET
data <- read.table(filename,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

mydata <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))


#Plot 1
hist(mydata$Global_active_power,
     main="Global Active Power",
     col="red",
     xlab="Global Active Power (kilowatts)",
     breaks=12,
     ylim=c(0,1200))

dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()
