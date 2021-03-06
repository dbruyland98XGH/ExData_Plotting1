plot1 <- function() {
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

#plot histogram to screendevice
with(Tbl,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))

#copy screen to png file
dev.copy(png,file="plot1.png")
dev.off()
}