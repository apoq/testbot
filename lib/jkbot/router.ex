defmodule Jkbot.Router do
  use Trot.Router

  # Setup a static route to priv/static/assets
  static "/css", "assets"

  # Sets the status code to 200 with a text body
  get "/text" do
    "Thank you for your question."
  end

  post "/vkbot" do
    IO.puts("TEST")
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
