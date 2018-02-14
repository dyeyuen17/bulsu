defmodule Bulsu.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bulsu.Accounts.User


  schema "users" do
    field :email, :string, default: "vince@u.com"
    field :firstname, :string
    field :lastname, :string
    field :username, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:firstname, :lastname, :email, :username, :password])
    |> validate_required([:firstname, :lastname, :username, :password])
    |> unique_constraint(:username)
  end

  
end
