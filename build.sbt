name := "SimpleApp"

version := "1.0"

scalaVersion := "2.11.8"

libraryDependencies += "org.apache.spark" %% "spark-core" % "2.1.0" % "provided"

assemblyOption in assembly := (assemblyOption in assembly).value.copy(includeScala = false)
