library("data.table")
powerRating <- fread(input = "household_power_consumption.txt", sep = ";", header = TRUE)
powerRatingF <- filter(powerRating, as.Date(Date,format="%d/%m/%Y") >= "2007-02-01" & as.Date(Date,format="%d/%m/%Y") <= "2007-02-02" )


z <- paste(powerRatingF$Date, powerRatingF$Time)
y <- as.numeric(powerRatingF$Global_active_power)
d <- as.POSIXct(z,format="%d/%m/%Y %H:%M:%S")
s1 <- as.numeric(powerRatingF$Sub_metering_1)
s2 <- as.numeric(powerRatingF$Sub_metering_2)
s3 <- as.numeric(powerRatingF$Sub_metering_3)

png("plot4.png", width = 480, height = 480)

par(mar =  c(4,4,1,1))
par(mfcol =  c(2,2))
par(mfrow =  c(2,2))

#Global Active Power
plot(d, y, type="l", xlab = "", ylab="Global Active Power(kilowatts)")

#Energy sub meteering
plot(c(d,d,d), c(s1,s2,s3),type="n", xlab="",ylab="Energy sub meteering")
lines(d, s1, col = "black")
lines(d, y = s2, col = "red")
lines(d, y = s3, col = "blue")

legend("topright",c("Sub_meeting_1","Sub_meeting_2","Sub_meeting_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red", "blue"), cex = 0.7)

#Voltage
v <- as.numeric(powerRatingF$Voltage)
plot(d, v, type="l", xlab = "", ylab="Voltage")

#Globeal reactive power
r <- as.numeric(powerRatingF$Global_reactive_power)
plot(d, r, type="l", xlab = "", ylab="Global_reactive_power)")

dev.off()