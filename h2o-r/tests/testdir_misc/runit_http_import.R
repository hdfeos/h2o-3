setwd(normalizePath(dirname(R.utils::commandArgs(asValues=TRUE)$"f")))
source("../h2o-runit.R")

#-----------------#
# Testing on HTTP #
#-----------------#

test.import.http <- function(conn) {
  url <- "http://s3.amazonaws.com/h2o-public-test-data/smalldata/prostate/prostate.csv.zip"

  t <- system.time(aa <- h2o.importFile(conn, url))
  print(aa)
  print(t)

  testEnd()
}

doTest("Testing HTTP File Import", test.import.http)