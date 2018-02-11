defmodule DealsWeb.DealThreadController do
  use DealsWeb, :controller

  import Deals.Accounts.Auth

  alias Deals.Posts
  alias Deals.Posts.DealThread
  alias Deals.Posts.Comment
  alias Deals.Accounts.Auth
  alias Deals.Accounts.User

  plug :id_check when action in [:new, :create, :edit]

  def index(conn, _params) do
    deal_threads = Posts.list_deal_threads()
    render(conn, "index.html", deal_threads: deal_threads)
  end

  def new(conn, _params) do
    changeset = Posts.change_deal_thread(%DealThread{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"deal_thread" => deal_thread_params}) do
    %User{id: id} = Auth.current_user(conn)
    author = Posts.get_author_id_by_user(id)
    deal_thread_with_author = Map.put(deal_thread_params, "author_id", author)
    IO.inspect deal_thread_with_author
    case Posts.create_deal_thread(deal_thread_with_author) do
      {:ok, deal_thread} ->
        conn
        |> put_flash(:info, "Deal thread created successfully.")
        |> redirect(to: deal_thread_path(conn, :show, deal_thread))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    deal_thread = Posts.get_deal_thread!(id)
    changeset = Posts.change_comment(%Comment{})
    render(conn, "show.html", deal_thread: deal_thread, changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    deal_thread = Posts.get_deal_thread!(id)
    changeset = Posts.change_deal_thread(deal_thread)
    render(conn, "edit.html", deal_thread: deal_thread, changeset: changeset)
  end

  def update(conn, %{"id" => id, "deal_thread" => deal_thread_params}) do
    deal_thread = Posts.get_deal_thread!(id)

    case Posts.update_deal_thread(deal_thread, deal_thread_params) do
      {:ok, deal_thread} ->
        conn
        |> put_flash(:info, "Deal thread updated successfully.")
        |> redirect(to: deal_thread_path(conn, :show, deal_thread))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", deal_thread: deal_thread, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    deal_thread = Posts.get_deal_thread!(id)
    {:ok, _deal_thread} = Posts.delete_deal_thread(deal_thread)

    conn
    |> put_flash(:info, "Deal thread deleted successfully.")
    |> redirect(to: deal_thread_path(conn, :index))
  end
end
