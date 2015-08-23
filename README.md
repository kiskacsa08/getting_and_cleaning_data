Getting and Cleaning Data - Course Project
==========================================

Overview
--------

This repository contains code for the Course Project on Coursera's
"Getting and Cleaning Data" course. It reads in accelerometer and gyroscope
data taken from a Samsung Galaxy S II and produces a cleaned summary of the
data.


How to Use this Script
----------------------

1. Clone this repository to your machine.
2. Download the raw data from
   [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
   to the cloned directory.
3. Set your R session's working directory to the cloned directory (e.g., by
   using ``setwd``).
4. Execute the ``run_analysis.R`` script:

        source('run_analysis.R')

5. When complete, two files named ``avg_tidy_data.txt`` and ``tidy_data.txt`` will be created in the working
   directory.


Output Data
-----------

Details about the output data can be found in the accompanying
[Code Book](CodeBook.md).
