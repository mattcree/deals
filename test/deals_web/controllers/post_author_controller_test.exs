defmodule DealsWeb.PostAuthorControllerTest do
  use DealsWeb.ConnCase

  alias Deals.Posts

  @create_attrs %{bio: "some bio"}
  @update_attrs %{bio: "some updated bio"}
  @invalid_attrs %{bio: nil}

  def fixture(:post_author) do
    {:ok, post_author} = Posts.create_post_author(@create_attrs)
    post_author
  end

  describe "index" do
    test "lists all post_authors", %{conn: conn} do
      conn = get conn, post_author_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Post authors"
    end
  end

  describe "new post_author" do
    test "renders form", %{conn: conn} do
      conn = get conn, post_author_path(conn, :new)
      assert html_response(conn, 200) =~ "New Post author"
    end
  end

  describe "create post_author" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, post_author_path(conn, :create), post_author: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == post_author_path(conn, :show, id)

      conn = get conn, post_author_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Post author"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, post_author_path(conn, :create), post_author: @invalid_attrs
      assert html_response(conn, 200) =~ "New Post author"
    end
  end

  describe "edit post_author" do
    setup [:create_post_author]

    test "renders form for editing chosen post_author", %{conn: conn, post_author: post_author} do
      conn = get conn, post_author_path(conn, :edit, post_author)
      assert html_response(conn, 200) =~ "Edit Post author"
    end
  end

  describe "update post_author" do
    setup [:create_post_author]

    test "redirects when data is valid", %{conn: conn, post_author: post_author} do
      conn = put conn, post_author_path(conn, :update, post_author), post_author: @update_attrs
      assert redirected_to(conn) == post_author_path(conn, :show, post_author)

      conn = get conn, post_author_path(conn, :show, post_author)
      assert html_response(conn, 200) =~ "some updated bio"
    end

    test "renders errors when data is invalid", %{conn: conn, post_author: post_author} do
      conn = put conn, post_author_path(conn, :update, post_author), post_author: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Post author"
    end
  end

  describe "delete post_author" do
    setup [:create_post_author]

    test "deletes chosen post_author", %{conn: conn, post_author: post_author} do
      conn = delete conn, post_author_path(conn, :delete, post_author)
      assert redirected_to(conn) == post_author_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, post_author_path(conn, :show, post_author)
      end
    end
  end

  defp create_post_author(_) do
    post_author = fixture(:post_author)
    {:ok, post_author: post_author}
  end
end
