defmodule JacahBackendWeb.UserController do
  use JacahBackendWeb, :controller

  alias JacahBackend.Admin
  alias JacahBackend.Admin.User

  action_fallback(JacahBackendWeb.FallbackController)

  def index(conn, _params) do
    users = Admin.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Admin.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    else
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> put_view(JacahBackendWeb.ChangesetView)
        |> render("error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Admin.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Admin.get_user!(id)

    with {:ok, %User{} = user} <- Admin.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    else
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> put_view(JacahBackendWeb.ChangesetView)
        |> render("error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Admin.get_user!(id)

    with {:ok, %User{}} <- Admin.delete_user(user) do
      send_resp(conn, :no_content, "")
    else
      {:error, :not_found} -> send_resp(conn, :not_found, "")
    end
  end
end
