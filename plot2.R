plot2 <- function() {
#
#put datafile and all plotx.R files in working directory
#then source the "plotx.R" file
#then call the function plotx()
#

cc <- rep("character", times=9)
headers <-read.table("household_power_consumption.txt",nrows=1,sep=";",colClasses=cc)

cc <- rep("numeric", times=9)
cc[1]<-"character"
cc[2]<-"character"
Tbl <-read.table("household_power_consumption.txt",nrows=2880,sep=";",colClasses=cc,skip=66637)
names(Tbl) <- headers

#merge date and time and convert to POSIXlt
tim<-paste(Tbl[,1],Tbl[,2],sep=" ")
timclt<-strptime(tim,format="%d/%m/%Y %H:%M:%S")


#plot to screendevice
plot(timclt,Tbl[,3],type="l",xlab="",ylab="Global Active Power (killowatts)")


#copy screen to png file
dev.copy(png,file="plot2.png")
dev.off()
}