library(SparkR, lib.loc = c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib")))
Sys.setenv("JAVA_HOME" = "C:\\Progra~1\\Java\\jre1.8.0_172") # modify Java path (space in "Program Files" causes error)

sparkR.session(master = "local[*]", sparkConfig = list(spark.driver.memory = "2g"))

# Create list of matrices and multiply each with itself

  list.of.M = list()
  for (i in 1:100)
  {
    list.of.M[[i]] = replicate(20, rnorm(20))
  }

  res = spark.lapply(list.of.M, function(x) x %*% x)


sparkR.stop()
detach("package:SparkR", unload=TRUE)

