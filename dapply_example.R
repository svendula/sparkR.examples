library(SparkR, lib.loc = c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib")))
sparkR.session()

# Calculate the mean of petal length and petal width in the iris dataset

  sdf_iris = as.DataFrame(iris)
  
	schema = structType(structField("mean_PetalLength", "float"), structField("mean_PetalWidth", "float"))
	
	sdf_mean = dapply(sdf_iris, function(x) y=data.frame(mean(x$Petal_Length), mean(x$Petal_Width)), schema)
	
	rdf_mean = collect(sdf_mean)
	
	save(rdf_mean, file="/path-to-file/dapply_res.RData")

sparkR.stop()
detach("package:SparkR", unload=TRUE)
