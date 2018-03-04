#reading of file from my local drive
powerfile <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(powerfile) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(powerfile,powerfile$Date=="1/2/2007" | powerfile$Date =="2/2/2007")

#plotting of data
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subpower$Date), subpower$Time)
subpower$Datetime <- as.POSIXct(datetime)

plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="1",xlab="",ylab="Global Active Power (kilowatts)") 
