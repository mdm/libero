defmodule Libero.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :display_name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :admin, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:display_name, :email])
    |> validate_required([:display_name, :email])
    |> unique_constraint(:email)
  end

  @doc false
  def create_changeset(user, attrs) do
    user
    |> changeset(attrs)
    |> cast_and_validate_password(attrs)
  end

  defp cast_and_validate_password(user, attrs) do
    user
    |> cast(attrs, [:password])
    |> validate_required([:password])
    |> validate_length(:password, min: 8)
    |> put_password_hash()
  end

  defp put_password_hash(user) do
    case user do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(user, :password_hash, Argon2.hash_pwd_salt(pass))
      _ ->
        user
      end
  end
end
