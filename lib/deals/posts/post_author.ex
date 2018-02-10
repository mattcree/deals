defmodule Deals.Posts.PostAuthor do
  use Ecto.Schema
  import Ecto.Changeset
  alias Deals.Posts.PostAuthor


  schema "post_authors" do
    field :bio, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%PostAuthor{} = post_author, attrs) do
    post_author
    |> cast(attrs, [:bio])
    |> validate_required([:bio])
    |> unique_constraint(:user_id)
  end
end
