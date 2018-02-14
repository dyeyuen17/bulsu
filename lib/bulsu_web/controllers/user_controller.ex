defmodule BulsuWeb.UserController do
  use BulsuWeb, :controller

  alias Bulsu.Accounts
  alias Bulsu.Accounts.User

  action_fallback BulsuWeb.FallbackController

  def create(conn, user_params) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> render("show.json", %{user: user})
    end
  end

  def get_data(conn, user_params) do
    user = Accounts.get_users(user_params["username"], user_params["password"])
    conn
    |> render("show.json", %{user: user})
  end

end
