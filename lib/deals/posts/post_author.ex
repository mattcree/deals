defmodule Deals.Posts.PostAuthor do
  use Ecto.Schema
  import Ecto.Changeset
  alias Deals.Posts.PostAuthor
  alias Deals.Posts.Comment
  alias Deals.Posts.DealThread
  alias Deals.Accounts.User

  schema "post_authors" do
    field :bio, :string
    has_many :comments, Comment
    has_many :deal_threads, DealThread
    belongs_to :user, User
    timestamps()
  end

  @doc false
  def changeset(%PostAuthor{} = post_author, attrs) do
    IO.inspect attrs
    post_author
    |> cast(attrs, [:user_id, :bio])
    |> unique_constraint(:user_id)
  end
end
