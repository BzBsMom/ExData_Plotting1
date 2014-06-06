# Filter the columnames
colnam <- read.csv("household_power_consumption.txt",nrows=1,sep=";")
# Read a smaller amount of data that includes the data to be analyze
data<-read.csv("household_power_consumption.txt",skip=66312 ,nrows=4000,sep=";",header=FALSE,na.strings="?")
colnames(data)<-colnames(colnam)
data[,2]<-paste(data[,1],data[,2])
data[,1]<-as.Date(data[,1],format="%d/%m/%Y")
# Filter the data that is going to be included in the plot
fildat<-data[which(data$Date %in% as.Date(c('2007-02-01','2007-02-02'))),]
# Open the device
png(filename="plot3.png")
# Finally plot the data
plot(strptime(fildat[,2],format="%d/%m/%Y %H:%M:%S"),
     fildat[,7],
     type="l",
     xlab="",
     ylab="Energy sub metering")
lines(strptime(fildat[,2],format="%d/%m/%Y %H:%M:%S"),
      fildat[,8],type="l",col="red")
lines(strptime(fildat[,2],format="%d/%m/%Y %H:%M:%S"),
      fildat[,9],type="l",col="blue")

legend("topright", colnames(colnam[7:9]), col=c("black","red","blue"),lwd=2) 
# close the device
dev.off()