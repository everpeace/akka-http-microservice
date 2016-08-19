// DON'T EDIT THE NEXT LINE
version := "4.0.0-SNAPSHOT"
// ABOVE LINE IS MAINTAINED BY CD SERVER

enablePlugins(AshScriptPlugin)

name := "akka-http-microservice"
organization := "com.theiterators"
scalaVersion := "2.11.8"

maintainer := "Shingo Omura"
dockerBaseImage := "openjdk:8-alpine"
dockerExposedPorts := Seq(9000)
dockerRepository := Some("everpeace")

scalacOptions := Seq("-unchecked", "-deprecation", "-encoding", "utf8")

libraryDependencies ++= {
  val akkaV       = "2.4.3"
  val scalaTestV  = "2.2.6"
  Seq(
    "com.typesafe.akka" %% "akka-actor" % akkaV,
    "com.typesafe.akka" %% "akka-stream" % akkaV,
    "com.typesafe.akka" %% "akka-http-experimental" % akkaV,
    "com.typesafe.akka" %% "akka-http-spray-json-experimental" % akkaV,
    "com.typesafe.akka" %% "akka-http-testkit" % akkaV,
    "org.scalatest"     %% "scalatest" % scalaTestV % "test"
  )
}

Revolver.settings
