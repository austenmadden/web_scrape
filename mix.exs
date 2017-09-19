defmodule WebScrape.Mixfile do
  use Mix.Project

  def project do
    [app: :web_scrape,
     version: "0.1.0",
     elixir: "~> 1.5.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     escript: [main_module: WebScrape],
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :floki, :httpoison, :postgrex, :ecto],
     mod: {WebScrape, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:floki, "~> 0.18.0"},
      {:httpoison, "~> 0.13.0"},
      {:postgrex, ">= 0.0.0"} ,
      {:ecto, "~> 2.2.4"}
    ]
  end
end
