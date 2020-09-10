#Exploratory data analysis


#Leemos archivo de texto como dataframe, cambiamos formato de variable Date a Date y filtramos la tabla para el periodo correspondiente
data<-read.table("hpc.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data<- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
data <- data[complete.cases(data),]


#plot2
datetime <- paste(data$Date, data$Time)
datetime <- setNames(datetime, "Datetime")
data <- cbind(datetime, data)
data$datetime <- as.POSIXct(datetime)
plot(data$Global_active_power~data$datetime, type="l", ylab="Global Active Power (kw)", xlab="")

