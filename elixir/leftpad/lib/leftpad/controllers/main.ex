defmodule Leftpad.Controllers.Main do
  use Sugar.Controller

  def index(conn, []) do
      str = conn.params["str"] || ""
      ch  = conn.params["ch"] || ""
      len = conn.params["len"] || 0

      padded = String.rjust(str, String.to_integer(len), ?a)

      json conn, %{str: padded}
  end
end
