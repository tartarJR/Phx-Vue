defmodule Rentit.Plant do
  use Ecto.Schema
  import Ecto.Changeset


  schema "plants" do
    field :description, :string
    field :name, :string
    field :price_per_day, :float
    has_many :bids, Rentit.PurchaseOrder

    timestamps()
  end

  @doc false
  def changeset(plant, attrs) do
    plant
    |> cast(attrs, [:name, :description, :price_per_day])
    |> validate_required([:name, :description, :price_per_day])
  end
end
