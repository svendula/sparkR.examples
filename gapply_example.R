library(SparkR, lib.loc = c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib")))
sparkR.session()

# Calculate the mean petal length on each species

  sdf_iris = as.DataFrame(iris)

  schema <- 'Species STRING, mean_PetalLength FLOAT'
  
  sdf_mean = gapply(sdf_iris, cols='Species', function(key, x) {y=data.frame(key, mean(x$Petal_Length), stringsAsFactors=FALSE)}, schema)
  
  rdf_mean = collect(sdf_mean)

save(rdf_mean, file="/home/svendo/workshop/data/gapply_res.RData")

sparkR.stop()
detach("package:SparkR", unload=TRUE)