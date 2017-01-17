shellPrompt in ThisBuild := { state =>
  val extracted = Project.extract(state)
  import extracted._
  (name in currentRef get structure.data) match {
    case Some(name) => name + "" + scala.Console.CYAN + "> " + scala.Console.RESET
    case _          => "> "
  }
}
