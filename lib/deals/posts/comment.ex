defmodule Deals.Posts.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Deals.Posts.Comment


  schema "comments" do
    field :body, :string
    field :deal_thread_id, :id
    field :post_author_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
