defmodule Deals.PostsTest do
  use Deals.DataCase

  alias Deals.Posts

  describe "post_authors" do
    alias Deals.Posts.PostAuthor

    @valid_attrs %{bio: "some bio"}
    @update_attrs %{bio: "some updated bio"}
    @invalid_attrs %{bio: nil}

    def post_author_fixture(attrs \\ %{}) do
      {:ok, post_author} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Posts.create_post_author()

      post_author
    end

    test "list_post_authors/0 returns all post_authors" do
      post_author = post_author_fixture()
      assert Posts.list_post_authors() == [post_author]
    end

    test "get_post_author!/1 returns the post_author with given id" do
      post_author = post_author_fixture()
      assert Posts.get_post_author!(post_author.id) == post_author
    end

    test "create_post_author/1 with valid data creates a post_author" do
      assert {:ok, %PostAuthor{} = post_author} = Posts.create_post_author(@valid_attrs)
      assert post_author.bio == "some bio"
    end

    test "create_post_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_post_author(@invalid_attrs)
    end

    test "update_post_author/2 with valid data updates the post_author" do
      post_author = post_author_fixture()
      assert {:ok, post_author} = Posts.update_post_author(post_author, @update_attrs)
      assert %PostAuthor{} = post_author
      assert post_author.bio == "some updated bio"
    end

    test "update_post_author/2 with invalid data returns error changeset" do
      post_author = post_author_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_post_author(post_author, @invalid_attrs)
      assert post_author == Posts.get_post_author!(post_author.id)
    end

    test "delete_post_author/1 deletes the post_author" do
      post_author = post_author_fixture()
      assert {:ok, %PostAuthor{}} = Posts.delete_post_author(post_author)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_post_author!(post_author.id) end
    end

    test "change_post_author/1 returns a post_author changeset" do
      post_author = post_author_fixture()
      assert %Ecto.Changeset{} = Posts.change_post_author(post_author)
    end
  end

  describe "deal_threads" do
    alias Deals.Posts.DealThread

    @valid_attrs %{description: "some description", expiry_date: "2010-04-17 14:00:00.000000Z", price: "some price", rating: 42, start_date: "2010-04-17 14:00:00.000000Z", title: "some title", url: "some url"}
    @update_attrs %{description: "some updated description", expiry_date: "2011-05-18 15:01:01.000000Z", price: "some updated price", rating: 43, start_date: "2011-05-18 15:01:01.000000Z", title: "some updated title", url: "some updated url"}
    @invalid_attrs %{description: nil, expiry_date: nil, price: nil, rating: nil, start_date: nil, title: nil, url: nil}

    def deal_thread_fixture(attrs \\ %{}) do
      {:ok, deal_thread} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Posts.create_deal_thread()

      deal_thread
    end

    test "list_deal_threads/0 returns all deal_threads" do
      deal_thread = deal_thread_fixture()
      assert Posts.list_deal_threads() == [deal_thread]
    end

    test "get_deal_thread!/1 returns the deal_thread with given id" do
      deal_thread = deal_thread_fixture()
      assert Posts.get_deal_thread!(deal_thread.id) == deal_thread
    end

    test "create_deal_thread/1 with valid data creates a deal_thread" do
      assert {:ok, %DealThread{} = deal_thread} = Posts.create_deal_thread(@valid_attrs)
      assert deal_thread.description == "some description"
      assert deal_thread.expiry_date == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert deal_thread.price == "some price"
      assert deal_thread.rating == 42
      assert deal_thread.start_date == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert deal_thread.title == "some title"
      assert deal_thread.url == "some url"
    end

    test "create_deal_thread/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_deal_thread(@invalid_attrs)
    end

    test "update_deal_thread/2 with valid data updates the deal_thread" do
      deal_thread = deal_thread_fixture()
      assert {:ok, deal_thread} = Posts.update_deal_thread(deal_thread, @update_attrs)
      assert %DealThread{} = deal_thread
      assert deal_thread.description == "some updated description"
      assert deal_thread.expiry_date == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert deal_thread.price == "some updated price"
      assert deal_thread.rating == 43
      assert deal_thread.start_date == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert deal_thread.title == "some updated title"
      assert deal_thread.url == "some updated url"
    end

    test "update_deal_thread/2 with invalid data returns error changeset" do
      deal_thread = deal_thread_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_deal_thread(deal_thread, @invalid_attrs)
      assert deal_thread == Posts.get_deal_thread!(deal_thread.id)
    end

    test "delete_deal_thread/1 deletes the deal_thread" do
      deal_thread = deal_thread_fixture()
      assert {:ok, %DealThread{}} = Posts.delete_deal_thread(deal_thread)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_deal_thread!(deal_thread.id) end
    end

    test "change_deal_thread/1 returns a deal_thread changeset" do
      deal_thread = deal_thread_fixture()
      assert %Ecto.Changeset{} = Posts.change_deal_thread(deal_thread)
    end
  end

  describe "deal_threads" do
    alias Deals.Posts.DealThread

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def deal_thread_fixture(attrs \\ %{}) do
      {:ok, deal_thread} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Posts.create_deal_thread()

      deal_thread
    end

    test "list_deal_threads/0 returns all deal_threads" do
      deal_thread = deal_thread_fixture()
      assert Posts.list_deal_threads() == [deal_thread]
    end

    test "get_deal_thread!/1 returns the deal_thread with given id" do
      deal_thread = deal_thread_fixture()
      assert Posts.get_deal_thread!(deal_thread.id) == deal_thread
    end

    test "create_deal_thread/1 with valid data creates a deal_thread" do
      assert {:ok, %DealThread{} = deal_thread} = Posts.create_deal_thread(@valid_attrs)
    end

    test "create_deal_thread/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_deal_thread(@invalid_attrs)
    end

    test "update_deal_thread/2 with valid data updates the deal_thread" do
      deal_thread = deal_thread_fixture()
      assert {:ok, deal_thread} = Posts.update_deal_thread(deal_thread, @update_attrs)
      assert %DealThread{} = deal_thread
    end

    test "update_deal_thread/2 with invalid data returns error changeset" do
      deal_thread = deal_thread_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_deal_thread(deal_thread, @invalid_attrs)
      assert deal_thread == Posts.get_deal_thread!(deal_thread.id)
    end

    test "delete_deal_thread/1 deletes the deal_thread" do
      deal_thread = deal_thread_fixture()
      assert {:ok, %DealThread{}} = Posts.delete_deal_thread(deal_thread)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_deal_thread!(deal_thread.id) end
    end

    test "change_deal_thread/1 returns a deal_thread changeset" do
      deal_thread = deal_thread_fixture()
      assert %Ecto.Changeset{} = Posts.change_deal_thread(deal_thread)
    end
  end

  describe "comments" do
    alias Deals.Posts.Comment

    @valid_attrs %{body: "some body"}
    @update_attrs %{body: "some updated body"}
    @invalid_attrs %{body: nil}

    def comment_fixture(attrs \\ %{}) do
      {:ok, comment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Posts.create_comment()

      comment
    end

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert Posts.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Posts.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      assert {:ok, %Comment{} = comment} = Posts.create_comment(@valid_attrs)
      assert comment.body == "some body"
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      assert {:ok, comment} = Posts.update_comment(comment, @update_attrs)
      assert %Comment{} = comment
      assert comment.body == "some updated body"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_comment(comment, @invalid_attrs)
      assert comment == Posts.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Posts.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Posts.change_comment(comment)
    end
  end
end
