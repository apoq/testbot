defmodule Jkbot.Router do
  use Trot.Router
  plug Plug.Parsers, parsers: [:urlencoded, :multipart]
  
  # Setup a static route to priv/static/assets
  static "/css", "assets"

  # Sets the status code to 200 with a text body
  get "/text" do
    "Thank you for your question."
  end

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

  # Redirect the incoming request
  get "/text/body", headers: ["x-text-type": "question"] do
    {:redirect, "/text"}
  end

  # Sets the status code to 201 with a text body
  get "/text/body" do
    {201, "optimal tip-to-tip efficiency"}
  end

  # Sets status code to 200 with a JSON-encoded body
  get "/json" do
    %{"hyper" => "social"}
  end

  # Pattern match part of the path into a variable
  get "/presenter/:name" do
    "The presenter is #{name}"
  end

  import_routes Trot.NotFound
end
