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

alias Rentit.{Repo, Plant, PurchaseOrder}

[
  %{name: "Plant 1", price_per_day: 110.0, description: "Plant 1 description"},
  %{name: "Plant 2", price_per_day: 130.0, description: "Plant 2 description"},
  %{name: "Plant 3", price_per_day: 120.0, description: "Plant 3 description"},
  %{name: "Plant 4", price_per_day: 150.0, description: "Plant 4 description"},
  %{name: "Plant 5", price_per_day: 100.0, description: "Plant 5 description"}
 ]
 |> Enum.each(fn plant -> Repo.insert!(Plant.changeset(%Plant{}, %{name: plant.name, price_per_day: plant.price_per_day, description: plant.description})) end)


[
  %{start_date: "2019-01-11", end_date: "2019-01-13", cost: 330, plant_id: 11 },
  %{start_date: "2019-01-14", end_date: "2019-01-17", cost: 440, plant_id: 11 },
  %{start_date: "2019-01-18", end_date: "2019-01-22", cost: 550, plant_id: 11 },
  %{start_date: "2019-01-07", end_date: "2019-01-08", cost: 200, plant_id: 15 },
  %{start_date: "2019-01-09", end_date: "2019-01-11", cost: 300, plant_id: 15 },
  %{start_date: "2019-01-11", end_date: "2019-01-12", cost: 300, plant_id: 14 },
  %{start_date: "2019-01-13", end_date: "2019-01-15", cost: 450, plant_id: 14 }
]
|> Enum.each(fn item -> Repo.insert!(PurchaseOrder.changeset(%PurchaseOrder{}, %{start_date: Date.from_iso8601!(item.start_date), end_date: Date.from_iso8601!(item.end_date), cost: item.cost, plant_id: item.plant_id  })) end)
