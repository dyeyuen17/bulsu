defmodule Bulsu.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bulsu.Posts.Post


  schema "posts" do
    field :content, :string
    field :username, :string
    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:content, :username])
    |> validate_required([:content, :username])
  end
end
