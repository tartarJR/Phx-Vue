defmodule Rentit.Repo.Migrations.CreatePlants do
  use Ecto.Migration

  def change do
    create table(:plants) do
      add :name, :string
      add :description, :string
      add :price_per_day, :float

      timestamps()
    end

  end
end
