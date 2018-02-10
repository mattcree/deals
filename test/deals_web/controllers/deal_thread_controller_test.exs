defmodule DealsWeb.DealThreadControllerTest do
  use DealsWeb.ConnCase

  alias Deals.Posts

  @create_attrs %{description: "some description", expiry_date: "2010-04-17 14:00:00.000000Z", price: "some price", rating: 42, start_date: "2010-04-17 14:00:00.000000Z", title: "some title", url: "some url"}
  @update_attrs %{description: "some updated description", expiry_date: "2011-05-18 15:01:01.000000Z", price: "some updated price", rating: 43, start_date: "2011-05-18 15:01:01.000000Z", title: "some updated title", url: "some updated url"}
  @invalid_attrs %{description: nil, expiry_date: nil, price: nil, rating: nil, start_date: nil, title: nil, url: nil}

  def fixture(:deal_thread) do
    {:ok, deal_thread} = Posts.create_deal_thread(@create_attrs)
    deal_thread
  end

  describe "index" do
    test "lists all deal_threads", %{conn: conn} do
      conn = get conn, deal_thread_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Deal threads"
    end
  end

  describe "new deal_thread" do
    test "renders form", %{conn: conn} do
      conn = get conn, deal_thread_path(conn, :new)
      assert html_response(conn, 200) =~ "New Deal thread"
    end
  end

  describe "create deal_thread" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, deal_thread_path(conn, :create), deal_thread: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == deal_thread_path(conn, :show, id)

      conn = get conn, deal_thread_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Deal thread"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, deal_thread_path(conn, :create), deal_thread: @invalid_attrs
      assert html_response(conn, 200) =~ "New Deal thread"
    end
  end

  describe "edit deal_thread" do
    setup [:create_deal_thread]

    test "renders form for editing chosen deal_thread", %{conn: conn, deal_thread: deal_thread} do
      conn = get conn, deal_thread_path(conn, :edit, deal_thread)
      assert html_response(conn, 200) =~ "Edit Deal thread"
    end
  end

  describe "update deal_thread" do
    setup [:create_deal_thread]

    test "redirects when data is valid", %{conn: conn, deal_thread: deal_thread} do
      conn = put conn, deal_thread_path(conn, :update, deal_thread), deal_thread: @update_attrs
      assert redirected_to(conn) == deal_thread_path(conn, :show, deal_thread)

      conn = get conn, deal_thread_path(conn, :show, deal_thread)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, deal_thread: deal_thread} do
      conn = put conn, deal_thread_path(conn, :update, deal_thread), deal_thread: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Deal thread"
    end
  end

  describe "delete deal_thread" do
    setup [:create_deal_thread]

    test "deletes chosen deal_thread", %{conn: conn, deal_thread: deal_thread} do
      conn = delete conn, deal_thread_path(conn, :delete, deal_thread)
      assert redirected_to(conn) == deal_thread_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, deal_thread_path(conn, :show, deal_thread)
      end
    end
  end

  defp create_deal_thread(_) do
    deal_thread = fixture(:deal_thread)
    {:ok, deal_thread: deal_thread}
  end
end
