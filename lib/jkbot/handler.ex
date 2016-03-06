defmodule Handler do
  def parse(text, from) do
    randomz = [
      ", не знаю",
      ", в другой раз"
    ]

    answer = answer(text)
    if answer do
      answer
    else
      from <> Enum.random(randomz)
    end
  end

  def answer("курс рубля?") do
    Ratescrapper.getRubRate()
  end

  def answer("курс тенге?") do
    Ratescrapper.getKztRate()
  end

  def answer(_question) do
    nil
  end
end
