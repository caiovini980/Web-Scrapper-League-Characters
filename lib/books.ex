defmodule Books do
  def get_champions() do
    IO.puts "Lista de personagens do League of Legends"

    case HTTPoison.get("https://br.leagueoflegends.com/pt-br/champions/") do
       {:ok, %HTTPoison.Response{body: body}} ->
        content = body
        |> Floki.find("span.style__Text-sc-12h96bu-3.gPUACV")
        |> Enum.map(fn champion ->
          champion
          |> Floki.text()
        end)
        |> format_content()
        {:ok, content}
    end
  end

  def format_content(content) do
    Enum.map(content, fn string ->
      IO.puts " " <> string #<> -> concatena
      IO.puts " -------------------"
    end)
  end
end
