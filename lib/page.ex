defmodule WebScrape.Page do
  use Ecto.Schema

  import Ecto.Changeset

  schema "pages" do
    field :url,   :string
    field :title, :string

    timestamps()
  end

  def changeset(page, params \\ %{}) do
    page
    |> cast(params, [:url, :title])
    |> validate_required([:url, :title])
  end
end
