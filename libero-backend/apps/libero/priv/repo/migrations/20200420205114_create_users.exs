defmodule Libero.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :password_hash, :string
      add :admin, :boolean, default: false, null: false

      timestamps()
    end

  end
end
