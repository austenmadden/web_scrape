require IEx;

defmodule Scraper do
  def scrape_web_page(url) when is_bitstring(url) do
    case HTTPoison.get(url, [], []) do
      {:ok, %{body: body, headers: headers, status_code: 200}} ->
        %{"title" => title} = Regex.named_captures(~r/<title>(?<title>.+)<\/title>/, body)
        IO.puts(title)
      {:error, %HTTPoison.Error{reason: reason}} -> IO.inspect(reason)
    end
  end


  def scrape_web_page(_), do: IO.puts "Error, check input"

  def scrape_web_page, do: IO.puts "Error, requires url"
end
