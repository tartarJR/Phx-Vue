defmodule RentitWeb.Router do
  use RentitWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RentitWeb do
    pipe_through :browser

    get "/", PageController, :index
  end


  scope "/api", RentitWeb do
    pipe_through :api

    post "/search", PlantApiController, :search
    post "/order", PlantApiController, :order
  end

  # Other scopes may use custom stacks.
  # scope "/api", RentitWeb do
  #   pipe_through :api
  # end
end
