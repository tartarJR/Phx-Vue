defmodule RentitWeb.PlantApiController do
  use RentitWeb, :controller

  import Ecto.Query

  alias Rentit.{Repo, Plant, PurchaseOrder}

  def search(conn,  %{"name" => name, "start_date" => start_date, "end_date" => end_date}) do

    start_date = Date.from_iso8601!(start_date)
    end_date = Date.from_iso8601!(end_date)

    query2 = from p in Plant,
              distinct: p.name,
              left_join: po in PurchaseOrder, on: p.id == po.plant_id,
              where: (po.start_date <= ^start_date and po.end_date >= ^end_date) and p.name == ^name,
              select: p.name

    names = Repo.all(query2)

    query = from p in Plant,
              where: p.name not in ^names,
              select: p

    plants = Repo.all(query)
    |> (Enum.map (fn(plant) -> %{name: plant.name, description: plant.description, price_per_day: plant.price_per_day} end))

    conn |> json(%{plants: plants})

  end
end
