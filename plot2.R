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
png(filename="plot2.png")
# Finally plot the data
plot(strptime(fildat[,2],format="%d/%m/%Y %H:%M:%S"),
     fildat[,3],
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
# close the device
dev.off()