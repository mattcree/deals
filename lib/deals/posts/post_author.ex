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
    IO.inspect attrs
    post_author
    |> cast(attrs, [:user_id, :bio])
    |> unique_constraint(:user_id)
  end
end
