defmodule Leftpad.Controllers.Main do
  use Sugar.Controller

  def index(conn, []) do
      str = conn.params["str"] || ""
      ch  = conn.params["ch"] || "  "
      len = conn.params["len"] || 0

      ch_list = String.to_char_list(ch)
      ch_head = hd(ch_list)

      padded = String.rjust(str, String.to_integer(len), ch_head)

      json conn, %{str: padded}
  end
end
