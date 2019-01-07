# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rentit.Repo.insert!(%Rentit.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Rentit.{Repo, Plant}

[
  %{name: "Plant 1", price_per_day: 110.0, description: "Plant 1 description"},
  %{name: "Plant 2", price_per_day: 130.0, description: "Plant 2 description"},
  %{name: "Plant 3", price_per_day: 120.0, description: "Plant 3 description"},
  %{name: "Plant 4", price_per_day: 150.0, description: "Plant 4 description"},
  %{name: "Plant 5", price_per_day: 100.0, description: "Plant 5 description"}
 ]
 |> Enum.each(fn plant -> Repo.insert!(Plant.changeset(%Plant{}, %{name: plant.name, price_per_day: plant.price_per_day, description: plant.description})) end)
