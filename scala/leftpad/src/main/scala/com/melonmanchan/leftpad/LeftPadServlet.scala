package com.melonmanchan.leftpad

import org.scalatra._
import org.scalatra.json.JacksonJsonSupport
import org.json4s.{DefaultFormats, Formats}

class LeftPadServlet extends LeftpadStack with JacksonJsonSupport {
  protected implicit lazy val jsonFormats: Formats = DefaultFormats


  def padLeft(ch:String, len:Int, str:String) : PadResult = {
    return PadResult(str.reverse.padTo(len, ch).reverse.mkString(""))
  }

  before() {
    contentType = formats("json")
  }

  get("/") {
    val ch = params.get("ch").getOrElse(" ")
    val str = params.get("str").getOrElse("")
    val len = params.get("len").getOrElse("0").toInt

    padLeft(ch, len, str)
  }

}

case class PadResult(str: String)
