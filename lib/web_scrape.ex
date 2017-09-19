defmodule WebScrape do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(WebScrape.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: WebScrape.Supervisor]
    Supervisor.start_link(children, opts)
  end

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
