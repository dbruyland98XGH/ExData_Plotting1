plot4 <- function() {

#read in the 2 days into dataframe Tbl
 cc <- rep("character", times=9)
headers <-read.table("household_power_consumption.txt",nrows=1,sep=";",colClasses=cc)
cc <- rep("numeric", times=9)
cc[1]<-"character"
cc[2]<-"character"
Tbl <-read.table("household_power_consumption.txt",nrows=2880,sep=";",colClasses=cc,skip=66637)
names(Tbl) <- headers

#merge date and time and make POSIXlt vector timclt
tim<-paste(Tbl[,1],Tbl[,2],sep=" ")
timclt<-strptime(tim,format="%d/%m/%Y %H:%M:%S")

#plot to screendevice

par(mfrow=c(2,2),mar=c(4,4,2,2))

#plot1 topleft
plot(timclt,Tbl[,3],type="l",xlab="",ylab="Global Active Power")

#plot2 topright
plot(timclt,Tbl[,5],type="l",xlab="datetime",ylab="Voltage")

#plot3 bottomleft
plot(timclt,Tbl[,7],col="black",type="l",xlab="",ylab="Energy sub metering")
lines(timclt,Tbl[,8],col="red",type="l")
lines(timclt,Tbl[,9],col="blue",type="l")
#lty must be specified to draw the examples line segments in legend
legend (x="topright",lty="solid",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot4 bottomright
plot(timclt,Tbl[,4],type="l",xlab="datetime",ylab="Global_reactive_power")



#copy screen plot to png
dev.copy(png,file="plot4.png")
dev.off()
}