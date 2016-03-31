package com.melonmanchan.leftpad

import org.scalatra._

class LeftPadServlet extends LeftpadStack {
  def padLeft(ch:String, len:Int, str:String) : String = {
    return str.reverse.padTo(len, ch).reverse.mkString("")
  }

  get("/") {
    val ch = params.get("ch").getOrElse(" ")
    val str = params.get("str").getOrElse("")
    val len = params.get("len").getOrElse("0").toInt

    <div>
    {padLeft(ch, len, str)}
    </div>
  }

}
