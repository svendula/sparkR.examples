library(SparkR, lib.loc = c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib")))
sparkR.session()

# Linear model on iris data with two different error distributions

  families <- c("gaussian", "poisson")

  spark_glm = spark.lapply(families, function(x) glm(Sepal.Length ~ Sepal.Width + Species, iris, family = x))


save(spark_glm, file="/path-to-file/spark.lapply_res2.RData")

sparkR.stop()
detach("package:SparkR", unload=TRUE)
