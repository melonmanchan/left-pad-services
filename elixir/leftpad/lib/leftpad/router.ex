defmodule Leftpad.Router do
  use Sugar.Router
  plug Sugar.Plugs.HotCodeReload

  # Define your routes here
  get "/", Leftpad.Controllers.Main, :index
end
