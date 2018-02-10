defmodule Deals.Posts.DealThread do
  use Ecto.Schema
  import Ecto.Changeset
  alias Deals.Posts.DealThread


  schema "deal_threads" do
    field :description, :string
    field :expiry_date, :utc_datetime
    field :price, :string
    field :rating, :integer
    field :start_date, :utc_datetime
    field :title, :string
    field :url, :string
    field :author_id, :id

    timestamps()
  end

  @doc false
  def changeset(%DealThread{} = deal_thread, attrs) do
    deal_thread
    |> cast(attrs, [:start_date, :expiry_date, :title, :price, :description, :url, :rating])
    |> validate_required([:start_date, :expiry_date, :title, :price, :description, :url, :rating])
  end
end
