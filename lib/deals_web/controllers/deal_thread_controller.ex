defmodule DealsWeb.DealThreadController do
  use DealsWeb, :controller

  alias Deals.Posts
  alias Deals.Posts.DealThread

  def index(conn, _params) do
    deal_threads = Posts.list_deal_threads()
    render(conn, "index.html", deal_threads: deal_threads)
  end

  def new(conn, _params) do
    changeset = Posts.change_deal_thread(%DealThread{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"deal_thread" => deal_thread_params}) do
    case Posts.create_deal_thread(deal_thread_params) do
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
    render(conn, "show.html", deal_thread: deal_thread)
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
