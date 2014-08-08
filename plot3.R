dataset <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "NA")
d<- dataset
d$Global_active_power <- as.numeric(as.character(d$Global_active_power))
d$Sub_metering_1 <- as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_2 <- as.numeric(as.character(d$Sub_metering_2))
d$Sub_metering_3 <- as.numeric(as.character(d$Sub_metering_3))
d$Date <- strptime(d$Date, format = "%d/%m/%Y")
d$Date <- as.Date( as.character(d$Date), "%Y-%m-%d")
newdata <- subset(d, d$Date == as.Date("2007-02-01") | d$Date == as.Date("2007-02-02") )
newdata$Date <- strptime(paste(newdata$Date,as.character(newdata$Time)), "%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
png(filename = "plot3.png", width = 480, height = 480, bg = "white") 
plot(newdata$Date, newdata$Sub_metering_1, type = "l", ylab = "Energy sub meetering", xlab = "", col = "black", main = "")
lines(newdata$Date, newdata$Sub_metering_2, type = "l", ylab = "", xlab = "", col = "red", main = "")
lines(newdata$Date, newdata$Sub_metering_3, type = "l", ylab = "Energy sub meetering", xlab = "", col = "blue", main = "")

legend('topright', names(d)[7:9], lty=1, col=c('black', 'red', 'blue'), cex=.75)

dev.off()
