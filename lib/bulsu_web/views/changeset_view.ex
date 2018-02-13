defmodule BulsuWeb.ChangesetView do
  use BulsuWeb, :view

  @doc """
  Traverses and translates changeset errors.

  See `Ecto.Changeset.traverse_errors/2` and
  `BulsuWeb.ErrorHelpers.translate_error/1` for more details.
  """
  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end

  def render("error.json", %{changeset: changeset}) do
    %{
      errors: render_many(changeset.errors, __MODULE__, "err.json")
    }
  end

  def render("err.json", %{changeset: changeset}) do
    {param, {detail, _}} = changeset
    %{
      title: "#{param} - #{detail}",
      status_code: 69
    }
  end
end
