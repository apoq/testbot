defmodule Jkbot.Router do
  use Trot.Router
  plug Plug.Parsers, parsers: [:urlencoded, :multipart]

  # Setup a static route to priv/static/assets
  static "/css", "assets"

  post "/vkbot" do
	   {:ok, data, _none} = Plug.Conn.read_body(conn)
	   {:ok, data} = JSX.decode data

     if data["message"]["chat"] != nil do
		     id   = data["message"]["chat"]["id"]
		     text = data["message"]["text"]
		     from = data["message"]["from"]["first_name"]
         Yocingo.send_message(id, Handler.parse(text, from))
     end
  end

  import_routes Trot.NotFound
end
