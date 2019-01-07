defmodule WhiteBreadContext do
  use WhiteBread.Context
  use Hound.Helpers

  alias Rentit.{Repo,Plant}


  feature_starting_state fn  ->
    Application.ensure_all_started(:hound)
    %{}
  end

  scenario_starting_state fn _state ->
    Hound.start_session
    Ecto.Adapters.SQL.Sandbox.checkout(Repo)
    Ecto.Adapters.SQL.Sandbox.mode(Repo, {:shared, self()})
    %{}
  end

  scenario_finalize fn _status, _state ->
    Ecto.Adapters.SQL.Sandbox.checkin(Repo)
    #Hound.end_session
    nil
  end

  given_ ~r/^the following plants$/, fn state, %{table_data: table} ->

    table
    |> Enum.map(fn plant -> Plant.changeset(%Plant{}, plant) end)
    |> Enum.each(fn changeset -> Repo.insert!(changeset) end)

    {:ok, state}
  end

  and_ ~r/^I want to rent "(?<name>[^"]+)"$/,
  fn state, %{name: name} ->
    {:ok, state |> Map.put(:name, name)}
  end

  and_ ~r/^I open RentIt' web page$/, fn state ->
    navigate_to "/#/"
    {:ok, state}
  end

  and_ ~r/^I enter the plant name$/, fn state ->
    fill_field({:id, "name"}, state[:name])
    {:ok, state}
  end

  and_ ~r/^I enter the start_date$/, fn state ->
    fill_field({:id, "start-date"}, "2019-01-13")
    {:ok, state}
  end

  and_ ~r/^I enter the end_date$/, fn state ->
    fill_field({:id, "end-date"}, "2019-01-17")
    {:ok, state}
  end

  when_ ~r/^I submit the request$/, fn state ->
    click({:id, "search-plant"})
    {:ok, state}
  end

  then_ ~r/^I should receive a list of free plants$/, fn state ->
    assert visible_in_page? ~r/Plants Found/
    {:ok, state}
  end

end
