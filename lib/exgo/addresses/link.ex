defmodule ExGo.Addresses.Link do
  use Ecto.Schema
  import Ecto.Changeset


  schema "links" do
    field :name, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:name, :url])
    |> validate_required([:url])
    |> unique_constraint(:name)
    |> unique_constraint(:url)
  end
end
