library("data.table")
powerRating <- fread(input = "household_power_consumption.txt", sep = ";", header = TRUE)
powerRatingF <- filter(powerRating, as.Date(Date,format="%d/%m/%Y") >= "2007-02-01" & as.Date(Date,format="%d/%m/%Y") <= "2007-02-02" )

z <- paste(powerRatingF$Date, powerRatingF$Time)
y <- as.numeric(powerRatingF$Global_active_power)
d <- as.POSIXct(z,format="%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(d, y, type="l", xlab = "", ylab="Global Active Power(kilowatts)")

dev.off()