defmodule Scraper do
  def scrape_web_page(url) when is_bitstring(url) do
    crawl(url)
  end

  def scrape_web_page(_), do: IO.puts "Error, check input"

  def scrape_web_page, do: IO.puts "Error, requires url"

  defp crawl(url, titles \\ %{}) when is_bitstring(url) do
    case HTTPoison.get(url, [], []) do
      {:ok, %{body: body, headers: _, status_code: 200}} ->
        title = body
        |> Floki.find("title")
        |> List.last
        |> elem(2)
        |> List.last

        if (titles[url] == nil) do
          titles = Map.put(titles, url, title)
          IO.inspect("#{url}, #{title}")

          titles = body
          |> Floki.find("a")
          |> Floki.attribute("href")
          |> Enum.filter(&Regex.match?(~r/http(s?):\/\//, &1))
          |> Enum.reduce(titles, fn(found_url, acc) -> Map.merge(acc, crawl(found_url, acc)) end)

          titles
        else
          titles
        end
      {:ok, _} -> titles
      {:error, %HTTPoison.Error{reason: _}} -> titles
    end
  end
end
