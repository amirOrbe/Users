defmodule BunsanUsersWeb.UserFallBackController do
    use BunsanUsersWeb, :controller

    def call(conn, {:error, changeset = %Ecto.Changeset{}}) do
        conn
        |> put_status(400)
        |> json(%{errors: "Changeset Errors"})
    end

    def call(conn, {:error, error}) do
        conn
        |> put_status(404)
        |> json(%{error: error})
    end

    def call(conn, _) do
        conn
        |> put_status(500)
        |> json(%{error: "Unhandled error: please call Bunsan"})
    end
end