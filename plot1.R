# Filter the columnames
colnam <- read.csv("household_power_consumption.txt",nrows=1,sep=";")
# Read a smaller amount of data that includes the data to be analyze
data<-read.csv("household_power_consumption.txt",skip=66312 ,nrows=4000,sep=";",header=FALSE,na.strings="?")
colnames(data)<-colnames(colnam)
data[,1]<-as.Date(data[,1],format="%d/%m/%Y")
# Open the device
png(filename="plot1.png")
#use hist to plot the data
hist(data[data$Date == "2007-02-01" | data$Date == "2007-02-02" ,3],main="Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red")
#close the device
dev.off()