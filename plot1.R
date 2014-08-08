dataset <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "NA")
d<- dataset
d$Global_active_power <- as.numeric(as.character(d$Global_active_power))
d$Date <- strptime(d$Date, format = "%d/%m/%Y")
d$Date <- as.Date( as.character(d$Date), "%Y-%m-%d")
newdata <- subset(d, d$Date == as.Date("2007-02-01") | d$Date == as.Date("2007-02-02") )
png(filename = "plot1.png", width = 480, height = 480, bg = "white") 
hist((newdata$Global_active_power), xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()
