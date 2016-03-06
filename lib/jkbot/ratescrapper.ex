defmodule Ratescrapper do
  def getRubRate() do
    "курс доллара: " <> _getRubRateBody("usd") <> "\n" <>
    "курс евро: " <> _getRubRateBody("eur")
  end

  def getKztRate() do
    "курс доллара: " <> _getKztRateBody("usd") <> "\n" <>
    "курс евро: " <> _getKztRateBody("euro")
  end

  defp _getRubRateBody(rate) do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.get("http://www.sberometer.ru/")
    [{"span", [_,_],[rate]}] = Floki.find(body, "#bcs_" <> rate <> "_buy")
    rate
  end

  defp _getKztRateBody(rate) do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.get("http://fin.zakon.kz/fin-kurs")
    [{"span", [_,_],[rate]}] = Floki.find(body, "span." <> rate <> "_icon")
    rate
  end
end
