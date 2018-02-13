defmodule BulsuWeb.Router do
  use BulsuWeb, :router

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

  scope "/", BulsuWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", BulsuWeb do
    pipe_through :api
    post "/new", UserController, :create
    post "/getdata", UserController, :get_data
  end
end
