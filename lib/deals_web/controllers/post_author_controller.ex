defmodule DealsWeb.PostAuthorController do
  use DealsWeb, :controller

  alias Deals.Posts
  alias Deals.Posts.PostAuthor

  def index(conn, _params) do
    post_authors = Posts.list_post_authors()
    render(conn, "index.html", post_authors: post_authors)
  end

  def new(conn, _params) do
    changeset = Posts.change_post_author(%PostAuthor{})
    render(conn, "new.html", changeset: changeset)
  end

  def show(conn, %{"id" => id}) do
    post_author = Posts.get_post_author!(id)
    render(conn, "show.html", post_author: post_author)
  end

  def edit(conn, %{"id" => id}) do
    post_author = Posts.get_post_author!(id)
    changeset = Posts.change_post_author(post_author)
    render(conn, "edit.html", post_author: post_author, changeset: changeset)
  end

  def update(conn, %{"id" => id, "post_author" => post_author_params}) do
    post_author = Posts.get_post_author!(id)

    case Posts.update_post_author(post_author, post_author_params) do
      {:ok, post_author} ->
        conn
        |> put_flash(:info, "Post author updated successfully.")
        |> redirect(to: post_author_path(conn, :show, post_author))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", post_author: post_author, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post_author = Posts.get_post_author!(id)
    {:ok, _post_author} = Posts.delete_post_author(post_author)

    conn
    |> put_flash(:info, "Post author deleted successfully.")
    |> redirect(to: post_author_path(conn, :index))
  end
end
