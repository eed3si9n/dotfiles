resolvers += Resolver.url(
  "bintray-thricejamie-sbt-plugins",
    url("http://dl.bintray.com/thricejamie/sbt-plugins"))(
        Resolver.ivyStylePatterns)

addSbtPlugin("com.37pieces" % "sbt-meow" % "0.1")
