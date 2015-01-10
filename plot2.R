##Plot 2

##Reads the .txt file already downloaded and upzipped
colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
data <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", colClasses=colClasses)

##Clean data for plotting
data$DateTime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

##Subset data based on dates
data = subset(data, data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"))

#Create histogram
png(filename = "plot2.png", width = 480, height = 480, bg="transparent")
plot(data$DateTime, data$Global_active_power, pch=NA, xlab="", ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

dev.off()
