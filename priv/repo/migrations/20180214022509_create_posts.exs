defmodule Bulsu.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :content, :string
      add :username, :string
      timestamps()
    end

  end
end
