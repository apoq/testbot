defmodule Handler do
  def parse(text, from) do
    if text == "призываю чв" || text == "@Jkr_bot призываю чв" do
      "http://cs9568.vk.me/u165996337/-6/x_646e2752.jpg"
    else
      from <> ", не понял тебя"
    end
  end
end
