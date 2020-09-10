#Exploratory data analysis


#Leemos archivo de texto como dataframe, cambiamos formato de variable Date a Date y filtramos la tabla para el periodo correspondiente
data<-read.table("hpc.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data<- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
data <- data[complete.cases(data),]



datetime <- paste(data$Date, data$Time)
datetime <- setNames(datetime, "Datetime")
data <- cbind(datetime, data)
data$datetime <- as.POSIXct(datetime)



#plot4
par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
        plot(Global_active_power~datetime, type="l", 
             ylab="Global Active Power (kw)", xlab="")
        
        plot(Sub_metering_1~datetime, type="l", 
             ylab="Global Active Power (kw)", xlab="")
        lines(Sub_metering_2~datetime,col='Red')
        lines(Sub_metering_3~datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Voltage~datetime, type="l", 
             ylab="Voltage (v)", xlab="")

        plot(Global_reactive_power~datetime, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})
