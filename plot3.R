#Exploratory data analysis


#Leemos archivo de texto como dataframe, cambiamos formato de variable Date a Date y filtramos la tabla para el periodo correspondiente
data<-read.table("hpc.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data<- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
data <- data[complete.cases(data),]


#plot3
datetime <- paste(data$Date, data$Time)
datetime <- setNames(datetime, "Datetime")
data <- cbind(datetime, data)
data$datetime <- as.POSIXct(datetime)



with(data, {
        plot(Sub_metering_1~datetime, type="l",
             ylab="Global Active Power (kw)", xlab="")
        lines(Sub_metering_2~datetime,col='Red')
        lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))