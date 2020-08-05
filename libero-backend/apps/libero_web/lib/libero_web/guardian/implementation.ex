defmodule LiberoWeb.Guardian.Implementation do
  use Guardian, otp_app: :libero_web

  alias Libero.Accounts

  def subject_for_token(user, _claims) do
    # {:ok, to_string(user.id)}
    {:ok, to_string(:user)}
  end

  # def resource_from_claims(%{"sub" => id}) do
    def resource_from_claims(claims) do
    # user = Accounts.get_user!(id)
    # {:ok, user}
    {:ok, :user}
  rescue
    Ecto.NoResultsError -> {:error, :resource_not_found}
  end
end
