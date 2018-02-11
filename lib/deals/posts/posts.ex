defmodule Deals.Posts do
  @moduledoc """
  The Posts context.
  """

  import Ecto.Query, warn: false
  alias Deals.Repo

  alias Deals.Posts.PostAuthor

  @doc """
  Returns the list of post_authors.

  ## Examples

      iex> list_post_authors()
      [%PostAuthor{}, ...]

  """
  def list_post_authors do
    Repo.all(PostAuthor)
  end

  @doc """
  Gets a single post_author.

  Raises `Ecto.NoResultsError` if the Post author does not exist.

  ## Examples

      iex> get_post_author!(123)
      %PostAuthor{}

      iex> get_post_author!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post_author!(id), do: Repo.get!(PostAuthor, id)

  @doc """
  Creates a post_author.

  ## Examples

      iex> create_post_author(%{field: value})
      {:ok, %PostAuthor{}}

      iex> create_post_author(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post_author(attrs \\ %{}) do
    %PostAuthor{}
    |> PostAuthor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post_author.

  ## Examples

      iex> update_post_author(post_author, %{field: new_value})
      {:ok, %PostAuthor{}}

      iex> update_post_author(post_author, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post_author(%PostAuthor{} = post_author, attrs) do
    post_author
    |> PostAuthor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PostAuthor.

  ## Examples

      iex> delete_post_author(post_author)
      {:ok, %PostAuthor{}}

      iex> delete_post_author(post_author)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post_author(%PostAuthor{} = post_author) do
    Repo.delete(post_author)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post_author changes.

  ## Examples

      iex> change_post_author(post_author)
      %Ecto.Changeset{source: %PostAuthor{}}

  """
  def change_post_author(%PostAuthor{} = post_author) do
    PostAuthor.changeset(post_author, %{})
  end

  def get_author_id_by_user(id) do
    query = from author in PostAuthor, where: author.user_id == ^id, select: author.id
    Repo.one(query)
  end

  alias Deals.Posts.DealThread

  @doc """
  Returns the list of deal_threads.

  ## Examples

      iex> list_deal_threads()
      [%DealThread{}, ...]

  """
  def list_deal_threads do
    Repo.all(DealThread)
  end

  @doc """
  Gets a single deal_thread.

  Raises `Ecto.NoResultsError` if the Deal thread does not exist.

  ## Examples

      iex> get_deal_thread!(123)
      %DealThread{}

      iex> get_deal_thread!(456)
      ** (Ecto.NoResultsError)

  """
  def get_deal_thread!(id), do: Repo.get!(DealThread, id)

  @doc """
  Creates a deal_thread.

  ## Examples

      iex> create_deal_thread(%{field: value})
      {:ok, %DealThread{}}

      iex> create_deal_thread(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_deal_thread(attrs \\ %{}) do
    %DealThread{}
    |> DealThread.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a deal_thread.

  ## Examples

      iex> update_deal_thread(deal_thread, %{field: new_value})
      {:ok, %DealThread{}}

      iex> update_deal_thread(deal_thread, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_deal_thread(%DealThread{} = deal_thread, attrs) do
    deal_thread
    |> DealThread.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a DealThread.

  ## Examples

      iex> delete_deal_thread(deal_thread)
      {:ok, %DealThread{}}

      iex> delete_deal_thread(deal_thread)
      {:error, %Ecto.Changeset{}}

  """
  def delete_deal_thread(%DealThread{} = deal_thread) do
    Repo.delete(deal_thread)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking deal_thread changes.

  ## Examples

      iex> change_deal_thread(deal_thread)
      %Ecto.Changeset{source: %DealThread{}}

  """
  def change_deal_thread(%DealThread{} = deal_thread) do
    DealThread.changeset(deal_thread, %{})
  end

  alias Deals.Posts.Comment

  @doc """
  Returns the list of comments.

  ## Examples

      iex> list_comments()
      [%Comment{}, ...]

  """
  def list_comments do
    Repo.all(Comment)
  end

  @doc """
  Gets a single comment.

  Raises `Ecto.NoResultsError` if the Comment does not exist.

  ## Examples

      iex> get_comment!(123)
      %Comment{}

      iex> get_comment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_comment!(id), do: Repo.get!(Comment, id)

  @doc """
  Creates a comment.

  ## Examples

      iex> create_comment(%{field: value})
      {:ok, %Comment{}}

      iex> create_comment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_comment(attrs \\ %{}) do
    %Comment{}
    |> Comment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a comment.

  ## Examples

      iex> update_comment(comment, %{field: new_value})
      {:ok, %Comment{}}

      iex> update_comment(comment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_comment(%Comment{} = comment, attrs) do
    comment
    |> Comment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Comment.

  ## Examples

      iex> delete_comment(comment)
      {:ok, %Comment{}}

      iex> delete_comment(comment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_comment(%Comment{} = comment) do
    Repo.delete(comment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking comment changes.

  ## Examples

      iex> change_comment(comment)
      %Ecto.Changeset{source: %Comment{}}

  """
  def change_comment(%Comment{} = comment) do
    Comment.changeset(comment, %{})
  end
end
