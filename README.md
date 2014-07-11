OpenData KC:  KCMOPS311 Data
============================

Overview of [KCMO 311 service request data](https://data.kcmo.org/311/KCMOPS311-Data/7at3-sxhp).

The 0-KCMOPS311-download.R script downloads the 311 data using the [Socrata API](http://dev.socrata.com/consumers/getting-started.html).  

On July 11, 2014 the CSV file contains over 2.34 million lines and is about 216 MB in size.  Since most records span 3 lines, there are only about 780,000 data records.

The various R markdown files produce descriptive stats, which are mostly crosstabs that show frequencies of occurrence by year. 

