library("data.table")
library("dplyr")
powerRating <- fread(input = "household_power_consumption.txt", sep = ";", header = TRUE)
powerRatingF <- filter(powerRating, as.Date(Date,format="%d/%m/%Y") >= "2007-02-01" & as.Date(Date,format="%d/%m/%Y") <= "2007-02-02" )

png("plot1.png", width = 480, height = 480)

hist(as.numeric(powerRatingF$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

dev.off()