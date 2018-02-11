defmodule Deals.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :string
      add :deal_thread_id, references(:deal_threads, on_delete: :delete_all),
                           null: false
      add :post_author_id, references(:post_authors, on_delete: :delete_all),
                           null: false
      timestamps()
    end

    create index(:comments, [:deal_thread_id])
    create index(:comments, [:post_author_id])
  end
end
