defmodule Deals.Accounts.Auth do
  alias Deals.Accounts.{Encryption, User}

  import Plug.Conn
  import Phoenix.Controller
  import DealsWeb.Router.Helpers

  def login(params, repo) do
    user = repo.get_by(User, email: String.downcase(params["email"]))
    case authenticate(user, params["password"]) do
     true -> {:ok, user}
      _    -> :error
    end
  end
  
  defp authenticate(user, password) do
    case user do
      nil -> false
      _   -> Encryption.validate_password(password, user.password_hash)
    end
  end
  
  # Helper functions
  
  def current_user(conn) do  
    id = Plug.Conn.get_session(conn, :current_user)
    if id, do: Deals.Repo.get(User, id)
  end
  
  def logged_in?(conn), do: !!current_user(conn)

  def id_check(conn, _opts) do
    case current_user(conn) do
      nil ->
        error(conn, "You need to log in to view this page", session_path(conn, :new))
      _ ->
        conn
    end
  end

  def success(conn, message, path) do
    conn
    |> put_flash(:info, message)
    |> redirect(to: path)
  end

  def error(conn, message, path) do
    conn
    |> put_flash(:error, message)
    |> redirect(to: path)
    |> halt
  end

end
