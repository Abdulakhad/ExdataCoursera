dataset <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "NA")
d<- dataset
d$Global_active_power <- as.numeric(as.character(d$Global_active_power))
d$Global_reactive_power <- as.numeric(as.character(d$Global_reactive_power))
d$Sub_metering_1 <- as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_2 <- as.numeric(as.character(d$Sub_metering_2))
d$Sub_metering_3 <- as.numeric(as.character(d$Sub_metering_3))
d$Voltage        <- as.numeric(as.character(d$Voltage))

d$Date <- strptime(d$Date, format = "%d/%m/%Y")
d$Date <- as.Date( as.character(d$Date), "%Y-%m-%d")
newdata <- subset(d, d$Date == as.Date("2007-02-01") | d$Date == as.Date("2007-02-02") )
newdata$Date <- strptime(paste(newdata$Date,as.character(newdata$Time)), "%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

png(filename = "plot4.png", width = 480, height = 480) 
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(newdata, {

plot(Date, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", col = "black", main = "")
plot(Date, Voltage, type = "l", ylab = "Voltage", xlab = "", col = "black", main = "")
plot(Date, Sub_metering_1, type = "l", ylab = "Energy sub meetering", xlab = "", col = "black", main = "")
lines(Date, Sub_metering_2, type = "l", ylab = "", xlab = "", col = "red", main = "")
lines(Date, Sub_metering_3, type = "l", ylab = "Energy sub meetering", xlab = "", col = "blue", main = "")
legend('topright', names(d)[7:9], lty=1, col=c('black', 'red', 'blue'), cex=.75)
plot(newdata$Date, newdata$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "Datetime", col = "black", main = "")

}
)

dev.off()

