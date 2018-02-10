defmodule Deals.Repo.Migrations.CreatePostAuthors do
  use Ecto.Migration

  def change do
    create table(:post_authors) do
      add :bio, :string
      add :user_id, references(:users, on_delete: :delete_all),
                    null: false

      timestamps()
    end

    create unique_index(:post_authors, [:user_id])
  end
end
