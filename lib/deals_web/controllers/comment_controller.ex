defmodule DealsWeb.CommentController do
  use DealsWeb, :controller

  alias Deals.Posts
  alias Deals.Posts.Comment
  alias Deals.Posts.DealThread
  alias Deals.Accounts.User
  alias Deals.Accounts.Auth

  plug :scrub_params, "comment" when action in [:create, :update]

  def create(conn, %{"comment" => comment_params, "deal_thread_id" => deal_thread_id}) do
    post_author_id = Auth.current_user_id(conn)
                     |> Posts.get_author_id_by_user
    %DealThread{"id": thread_id} = deal_thread = Posts.get_deal_thread!(deal_thread_id)
    full_comment = Map.merge(comment_params, %{"deal_thread_id" => thread_id,
                                               "post_author_id" => post_author_id})
    IO.inspect full_comment
    case Posts.create_comment(full_comment) do
      {:ok, comment} ->
        IO.inspect conn
        IO.inspect comment
        conn
        |> put_flash(:info, "Comment created successfully.")
        |> redirect(to: deal_thread_path(conn, :show, deal_thread))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    comment = Posts.get_comment!(id)
    {:ok, _comment} = Posts.delete_comment(comment)

    conn
    |> put_flash(:info, "Comment deleted successfully.")
    |> redirect(to: comment_path(conn, :index))
  end
end
