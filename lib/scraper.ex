defmodule Scraper do
  def scrape_web_page(url) when is_bitstring(url) do
    HTTPoison.get!("https://api.github.com")
    |> IO.puts
  end

  def scrape_web_page(_), do: IO.puts "Error, check input"

  def scrape_web_page, do: IO.puts "Error, requires url"
end
