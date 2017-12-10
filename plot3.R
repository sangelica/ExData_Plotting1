plot3 <- function () {
    old_par <- par(no.readonly = T)
    
    # 1. Read the data
    pwr_data <- read.table("household_power_consumption.txt", sep=';', header = TRUE, as.is = TRUE, na.strings = c("?"))
    
    # 2. Filter data by date
    fdata <-pwr_data[as.Date(pwr_data$Date,"%d/%m/%Y") == as.Date("2007-02-01") | as.Date(pwr_data$Date,"%d/%m/%Y") == as.Date("2007-02-02"),]
    
    # 3. Concatenate date time information
    date_time <-strptime(paste(fdata$Date,fdata$Time),"%d/%m/%Y %H:%M:%S")
    
    # 4. Plot global active power vs date-time
    plot(date_time, fdata$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
    lines(date_time, fdata$Sub_metering_2, pch=20, col="red")
    lines(date_time, fdata$Sub_metering_3, pch=20, col = "blue")
    legend("topright", lty=1 , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8)

    # 5. Copy to png file
    dev.copy(png,filename="plot3.png",width = 480, height = 480)
    
    # 6. Close graphics device
    dev.off()
    
    par(old_par)
}

plot3()