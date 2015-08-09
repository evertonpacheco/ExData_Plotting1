library("data.table")
powerRating <- fread(input = "household_power_consumption.txt", sep = ";", header = TRUE)
powerRatingF <- filter(powerRating, as.Date(Date,format="%d/%m/%Y") >= "2007-02-01" & as.Date(Date,format="%d/%m/%Y") <= "2007-02-02" )

s1 <- as.numeric(powerRatingF$Sub_metering_1)
s2 <- as.numeric(powerRatingF$Sub_metering_2)
s3 <- as.numeric(powerRatingF$Sub_metering_3)
z <- paste(powerRatingF$Date, powerRatingF$Time)
d <- as.POSIXct(z,format="%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(c(d,d,d), c(s1,s2,s3),type="n", xlab="",ylab="Energy sub meteering")
lines(d, s1, col = "black")
lines(d, y = s2, col = "red")
lines(d, y = s3, col = "blue")

legend("topright",c("Sub_meeting_1","Sub_meeting_2","Sub_meeting_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red", "blue"))

dev.off()


