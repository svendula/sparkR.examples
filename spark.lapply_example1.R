library(SparkR, lib.loc = c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib")))
sparkR.session()

# Create list of matrices and multiply each with itself

  list.of.M = list()
  for (i in 1:10000)
  {
  list.of.M[[i]] = replicate(20, rnorm(20))
  }

  res = spark.lapply(list.of.M, function(x) x %*% x)


  save(res, file="/path-to-file/spark.lapply_res1.RData")

sparkR.stop()
detach("package:SparkR", unload=TRUE)

