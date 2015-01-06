# Download latest KCMO 311 data for analysis.
# efg, UMKC Center for Health Insights.
# 2014-07-11.  Last updated 2015-01-03.

library(downloader)  # download
library(tools)       # md5sum

#setwd("C:/Data/Cities/KCMO/data-kcmo-org/KCMOPS311/")
setwd("E:/FOIA/Cities/KCMO/KCMOPS311/2015-01-03/")

filename <- paste0("0-KCMOPS311-download-",
                   format(Sys.time(), "%Y-%m-%d"), ".txt")
sink(filename, split=TRUE)

# Download
time.1 <- Sys.time()
captured <- format(time.1, "%Y-%m-%d-%H%M%S")
captured

fileUrl <- "https://data.kcmo.org/api/views/7at3-sxhp/rows.csv?accessType=DOWNLOAD"
filename <-  paste0("KCMOPS311", "-", captured, ".csv")
download(fileUrl, filename, mode="w")

# File Info
file.info(filename)
md5sum(filename)
format(Sys.time(), "%Y-%m-%d-%H%M%S")

# Line Count
s <- readLines(filename)
length(s)

# Structure of File
# data.frame Overview
d <- read.csv(filename, as.is=TRUE, colClasses="character")
str(d)  # structure

# See if any type conversion problems exist

format(Sys.time(), "%Y-%m-%d-%H%M%S")

d$CreationDate  <- as.POSIXct( strptime(d$CREATION.DATE, "%m/%d/%Y") )
d$CreationMonth <- as.integer(d$CREATION.MONTH)
d$CreationYear  <- as.integer(d$CREATION.YEAR)

d$CloseDate  <- as.POSIXct( strptime(d$CLOSED.DATE, "%m/%d/%Y") )
d$CloseMonth <- as.integer(d$CLOSED.MONTH)
d$CloseYear  <- as.integer(d$CLOSED.YEAR)

d$DaysToClose <- as.integer(d$DAYS.TO.CLOSE)

d$XCoordinate <- as.numeric(d$XCOORDINATE)
d$YCoordinate <- as.numeric(d$YCOORDINATE)

time.2 <- Sys.time()
format(time.2, "%Y-%m-%d-%H%M%S")
cat(sprintf(" %.1f", as.numeric(difftime(time.2, time.1,  units="secs"))), " secs\n")
sink()

