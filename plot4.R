plot4 <- function () {
    old_par <- par(no.readonly = T)

    # 1. Read the data
    pwr_data <- read.table("household_power_consumption.txt", sep=';', header = TRUE, as.is = TRUE, na.strings = c("?"))
    
    # 2. Filter data by date
    fdata <-pwr_data[as.Date(pwr_data$Date,"%d/%m/%Y") == as.Date("2007-02-01") | as.Date(pwr_data$Date,"%d/%m/%Y") == as.Date("2007-02-02"),]
    
    # 3. Concatenate date time information
    date_time <-strptime(paste(fdata$Date,fdata$Time),"%d/%m/%Y %H:%M:%S")
    
    # 4. Set plot to have 2 rows and 2 columns
    par(mfrow=c(2,2))
    
    # 5. Plot 1 -  global active power vs Date-Time
    plot(date_time,fdata$Global_active_power,type="l", ylab = "Global Active Power", xlab="", pch=20)
    
    # 6. Plot 2 -  global active power vs Date-Time
    plot(date_time,fdata$Voltage,type="l", ylab = "Voltage", xlab="datetime", pch=20)

    # 7. Plot 3 - global active power vs date-time
    plot(date_time, fdata$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
    lines(date_time, fdata$Sub_metering_2, pch=20, col="red")
    lines(date_time, fdata$Sub_metering_3, pch=20, col = "blue")
    legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty= "n", text.width = strwidth("1000"), yjust=1, xjust=1, pt.cex = 0.6, cex=0.6)
    
    # 8. Plot 4 -  global reactive power vs Date-Time
    plot(date_time, fdata$Global_reactive_power,type="l", ylab = "Global_reactive_power", xlab="datetime", pch=20)
    
    # 9. Copy to png file
    dev.copy(png,filename="plot4.png",width = 480, height = 480)
    
    # 10. Close graphics device
    dev.off()

    # 11. Reset screen device
    par(old_par)
    
}

plot4()