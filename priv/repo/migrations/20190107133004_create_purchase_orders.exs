defmodule Rentit.Repo.Migrations.CreatePurchaseOrders do
  use Ecto.Migration

  def change do
    create table(:purchase_orders) do
      add :start_date, :date
      add :end_date, :date
      add :cost, :float
      add :plant_id, references(:plants, on_delete: :nothing)

      timestamps()
    end

  end
end
