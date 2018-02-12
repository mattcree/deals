defmodule Deals.Repo.Migrations.CreateDealThreads do
  use Ecto.Migration

  def change do
    create table(:deal_threads) do
      add :start_date, :utc_datetime
      add :expiry_date, :utc_datetime
      add :title, :string
      add :price, :string
      add :description, :string
      add :url, :string
      add :rating, :integer, default: 0
      add :post_author_id, references(:post_authors, on_delete: :delete_all),
                      null: false

      timestamps()
    end

    create index(:deal_threads, [:post_author_id])
  end
end
