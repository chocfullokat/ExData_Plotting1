##Plot 3 

##Reads the .txt file already downloaded and upzipped
colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
data <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", colClasses=colClasses)

##Clean data for plotting
data$DateTime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

##Subset data based on dates
data = subset(data, data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"))

#Create scatterplot with two graphs and legend
##using white background to mirror course project page
png(filename = "plot3.png", width = 480, height = 480, bg="white")
plot(data$DateTime,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black") 
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",lty="solid",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()