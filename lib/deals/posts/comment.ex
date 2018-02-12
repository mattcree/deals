defmodule Deals.Posts.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Deals.Posts.Comment
  alias Deals.Posts.DealThread
  alias Deals.Posts.PostAuthor

  schema "comments" do
    field :body, :string
    belongs_to :deal_thread, DealThread
    belongs_to :post_author, PostAuthor
    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:body, :deal_thread_id, :post_author_id])
    |> validate_required([:body, :deal_thread_id, :post_author_id])
  end
end
