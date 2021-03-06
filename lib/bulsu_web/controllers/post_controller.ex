defmodule BulsuWeb.PostController do
  use BulsuWeb, :controller

  alias Bulsu.Posts
  alias Bulsu.Posts.Post

  action_fallback BulsuWeb.FallbackController

  # def index(conn, _params) do
  #   posts = Posts.list_posts()
  #   render(conn, "index.json", posts: posts)
  # end
  #
  def create(conn, %{"post" => post_params}) do
    with {:ok, %Post{} = post} <- Posts.create_post(post_params) do
      conn
      |> put_status(:created)
      |> render("show.json", post: post)
    end
  end

  def get_post(conn, post_params) do
    posts = Posts.get_post(post_params["username"])
    
    conn
    |> render("index.json", %{posts: posts})
  end
  #
  # def show(conn, %{"id" => id}) do
  #   post = Posts.get_post!(id)
  #   render(conn, "show.json", post: post)
  # end
  #
  # def update(conn, %{"id" => id, "post" => post_params}) do
  #   post = Posts.get_post!(id)
  #
  #   with {:ok, %Post{} = post} <- Posts.update_post(post, post_params) do
  #     render(conn, "show.json", post: post)
  #   end
  # end
  #
  # def delete(conn, %{"id" => id}) do
  #   post = Posts.get_post!(id)
  #   with {:ok, %Post{}} <- Posts.delete_post(post) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
