defmodule Leftpad.Router do
    use Sugar.Router
    plug Sugar.Plugs.HotCodeReload
    if Sugar.Config.get(:sugar, :show_debugger, false) do
        use Plug.Debugger, otp_app: :leftpad
    end

    plug Plug.Static, at: "/static", from: :leftpad
    # Define your routes here
    get "/", Leftpad.Controllers.Main, :index
end
