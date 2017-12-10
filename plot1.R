plot1 <- function () {
    old_par <- par(no.readonly = T)

    # 1. Read the data
    pwr_data <- read.table("household_power_consumption.txt", sep=';', header = TRUE, as.is = TRUE, na.strings = c("?"))
    
    # 2. Filter data by date
    fdata <-pwr_data[as.Date(pwr_data$Date,"%d/%m/%Y") == as.Date("2007-02-01") | as.Date(pwr_data$Date,"%d/%m/%Y") == as.Date("2007-02-02"),]
    
    # 3. Plot the histogram of the data
    hist(fdata$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

    # 4. Copy to png file
    dev.copy(png,filename="plot1.png",width = 480, height = 480)
    
    # 5. Close graphics device
    dev.off()

    par(old_par)
}

plot1()