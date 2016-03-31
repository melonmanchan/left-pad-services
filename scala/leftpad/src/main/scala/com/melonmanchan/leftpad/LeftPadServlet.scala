package com.melonmanchan.leftpad

import org.scalatra._
import spray.json._
import DefaultJsonProtocol._

class LeftPadServlet extends LeftpadStack {

  case class PadResult(str: String)

  object PadResult extends DefaultJsonProtocol {
    implicit val padFormat = jsonFormat1(PadResult.apply)
  }

  def padLeft(ch:String, len:Int, str:String) : PadResult = {
    return PadResult(str.reverse.padTo(len, ch).reverse.mkString(""))
  }

  before() {
    contentType = "application/json"
  }

  get("/") {
    val ch = params.get("ch").getOrElse(" ")
    val str = params.get("str").getOrElse("")
    val len = params.get("len").getOrElse("0").toInt

    padLeft(ch, len, str).toJson
  }
}

