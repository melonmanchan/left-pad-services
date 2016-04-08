defmodule Leftpad.Controllers.Main do
  use Sugar.Controller

  def index(conn, []) do
      str = conn.params[:str] || ""
      ch  = conn.params[:chk] || ""
      len = conn.params[:len] || 0

      json conn, %{str: String.rjust(str, len, ch)}
  end
end
