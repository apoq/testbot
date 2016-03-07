defmodule Handler do
  def parse(text, from) do
    randomz = [
      ", не в этот раз",
      ", не понял тебя",
    ]

    text = String.replace(text, "@Jkr_bot", "")
            |> String.strip
            |> String.downcase

    answer = answer(text)
    if answer do
      answer
    else
      from <> Enum.random(randomz)
    end
  end

  def answer("расскажи стишок") do
    Poetryscrapper.getPoetry()
  end

  def answer("призываю чв") do
     "http://cs9568.vk.me/u165996337/-6/x_646e2752.jpg"
  end

  def answer("курс рубля?") do
    Ratescrapper.getRubRate()
  end

  def answer("курс тенге?") do
    Ratescrapper.getKztRate()
  end

  def answer("да нет?") do
    Enum.random(["да", "нет"])
  end

  def answer(_question) do
    nil
  end
end
