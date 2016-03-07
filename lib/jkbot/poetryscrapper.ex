defmodule Poetryscrapper do
  def getPoetry() do
    page = Enum.random(1..600)
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.get("http://poetory.ru/content/list?page=" <> to_string(page))
    [{_,_,lines}] = Floki.find(body, "div.item-text") |> Enum.take(1)
    _parsePoetry(Floki.raw_html(lines))
  end

  defp _parsePoetry(lines) do
    lines = String.strip(lines)
    String.replace(lines, "<br/>","\n")
  end

end
