defmodule Deals.Posts.DealThread do
  use Ecto.Schema
  import Ecto.Changeset
  alias Deals.Posts.DealThread
  alias Deals.Posts.Comment
  alias Deals.Posts.PostAuthor

  schema "deal_threads" do
    field :description, :string
    field :expiry_date, :utc_datetime
    field :price, :string
    field :rating, :integer
    field :start_date, :utc_datetime
    field :title, :string
    field :url, :string
    has_many :comments, Comment
    belongs_to :post_author, PostAuthor
    timestamps()
  end

  @doc false
  def changeset(%DealThread{} = deal_thread, attrs) do
    deal_thread
    |> cast(attrs, [:start_date, :expiry_date, :title, :price, :description, :url, :rating, :post_author_id])
    |> validate_required([:start_date, :expiry_date, :title, :price, :description, :url, :rating, :post_author_id])
  end
end
