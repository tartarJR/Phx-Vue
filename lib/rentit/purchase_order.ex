defmodule Rentit.PurchaseOrder do
  use Ecto.Schema
  import Ecto.Changeset


  schema "purchase_orders" do
    field :cost, :float
    field :end_date, :date
    field :start_date, :date
    belongs_to :plant, Rentit.Plant, foreign_key: :plant_id

    timestamps()
  end

  @doc false
  def changeset(purchase_order, attrs) do
    purchase_order
    |> cast(attrs, [:start_date, :end_date, :cost, :plant_id])
    |> validate_required([:start_date, :end_date, :cost, :plant_id])
  end
end
