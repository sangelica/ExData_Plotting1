plot2 <- function () {
    old_par <- par(no.readonly = T)
    
    # 1. Read the data
    pwr_data <- read.table("household_power_consumption.txt", sep=';', header = TRUE, as.is = TRUE, na.strings = c("?"))
    
    # 2. Filter data by date
    fdata <-pwr_data[as.Date(pwr_data$Date,"%d/%m/%Y") == as.Date("2007-02-01") | as.Date(pwr_data$Date,"%d/%m/%Y") == as.Date("2007-02-02"),]
    
    # 3. Concatenate date time information
    date_time <-strptime(paste(fdata$Date,fdata$Time),"%d/%m/%Y %H:%M:%S")
    
    # 4. Plot global active power vs date-time
    plot(date_time,fdata$Global_active_power,type="l", ylab = "Global Active Power (kilowatts)", xlab="", pch=20)

    # 5. Copy to png file
    dev.copy(png,filename="plot2.png",width = 480, height = 480)
    
    # 6. Close graphics device
    dev.off()
    
    par(old_par)
}

plot2()