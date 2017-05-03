defmodule WebScrape do
  def main(args) do
    args |> parse_args |> process
  end

  def process([]) do
    IO.puts "No arguments given"
  end

  def process(options) do
    Scraper.scrape_web_page(options[:url])
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [url: :string]
    )
    options
  end
end
