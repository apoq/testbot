defmodule Jkbot.Router do
  use Trot.Router
  plug Plug.Parsers, parsers: [:urlencoded, :multipart]

  # Setup a static route to priv/static/assets
  static "/css", "assets"

  post "/vkbot" do
	{:ok, ic, _none} = Plug.Conn.read_body(conn)
	{:ok, data} = JSX.decode ic
	if data["message"]["chat"] != nil do
		IO.inspect data["message"]
		id = data["message"]["chat"]["id"]
		text = data["message"]["text"]
		from = data["message"]["from"]["first_name"]
		if text == "призываю чв" || text == "@Jkr_bot призываю чв" do
			Yocingo.send_message(id, "http://cs9568.vk.me/u165996337/-6/x_646e2752.jpg")
		else
			Yocingo.send_message(id, from <> " пошел к х.ям")
		end
	end
  end

  import_routes Trot.NotFound
end
