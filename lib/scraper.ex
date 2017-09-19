defmodule Scraper do
  def scrape_web_page(url) when is_bitstring(url) do
    case HTTPoison.get(url, [], []) do
      {:ok, %{body: body, headers: headers, status_code: 200}} ->
        body
        |> Floki.find("a")
        |> Floki.attribute("href")
        |> Enum.filter(&Regex.match?(~r/http(s?):\/\/www./, &1))
        |> Enum.map(&HTTPoison.get(&1))
        |> Enum.map(&(elem(&1, 1).body))
        |> Enum.map(&Regex.run(~r/<title>(.+)<\/title>/, &1))
        |> Enum.filter(&(&1 != nil))
        |> Enum.map(&List.last(&1))
      {:error, %HTTPoison.Error{reason: reason}} -> IO.inspect(reason)
    end
  end

  def scrape_web_page(_), do: IO.puts "Error, check input"

  def scrape_web_page, do: IO.puts "Error, requires url"
end
