# Capture KCMO 311 data and report some quick descriptive stats.
# efg, UMKC Center for Health Insights.
# 2013-12-12.  Updated 2014-04-10.

setwd("C:/Data/KC/data-kcmo-org/KCMOPS311/")

sink("KCMOPS311_Data.txt", split=TRUE)
captured <- format(Sys.time(), "%Y-%m-%d-%H%M%S")

library(downloader)
fileUrl <- "https://data.kcmo.org/api/views/7at3-sxhp/rows.csv?accessType=DOWNLOAD"

filename <-  paste0("KCMOPS311", "-", captured, ".csv")
download(fileUrl, filename, mode="w")

d <- read.csv(filename, as.is=TRUE, colClasses="character")
str(d)  # structure

d$CREATION.DATE <- as.Date(d$CREATION.DATE, "%m/%d/%Y")
#d$CREATION.YYYYMM <- substr(d$CREATION.DATE, 1, 7)

table(d$SOURCE, d$CREATION.YEAR)
table(d$DEPARTMENT, d$CREATION.YEAR)
table(d$WORK.GROUP, d$CREATION.YEAR)
table(d$COUNCIL.DISTRICT, d$CREATION.YEAR)
table(d$NEIGHBORHOOD, d$CREATION.YEAR)
table(d$ZIP.CODE, d$CREATION.YEAR)
table(d$STATUS, d$CREATION.YEAR)
table(d$QUALITY.OF.SERVICE, d$CREATION.YEAR)
hist(log10(1+as.numeric(d$DAYS.TO.CLOSE)))

### Health
health <- d[d$DEPARTMENT == "Health", ]
dim(health)

#table(health$WORK.GROUP)
#table(health$REQUEST.TYPE)

counts <- as.data.frame.matrix(table(health$REQUEST.TYPE, health$CREATION.YEAR))

counts <- cbind(counts, TOTAL=apply(counts,1,sum))
counts <- rbind(counts, TOTAL=apply(counts,2,sum))

counts
write.csv(counts, "KCMO-311-Health.csv", row.names=FALSE)

sink()

