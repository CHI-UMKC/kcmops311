OpenData KC:  KCMOPS311 Data
============================

Quick look at [KCMO 311 service request data](https://data.kcmo.org/311/KCMOPS311-Data/7at3-sxhp).

The R script downloads the 311 data using the [Socrata API](http://dev.socrata.com/consumers/getting-started.html).  On April 10, 2014 the CSV file contains over 2.2 million lines and is about 210 MB in size.  Since most records span 3 lines, there are only about 757,000 data records.

The script produces some descriptive stats, which are mostly crosstabs that show frequencies of occurrence by year. A slightly-annotated PDF was created with the results from the script.

