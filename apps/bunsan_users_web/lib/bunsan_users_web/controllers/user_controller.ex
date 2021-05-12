defmodule  BunsanUsersWeb.UserController do
    @moduledoc """
    Controller for Users
    """
    use BunsanUsersWeb, :controller
    alias BunsanUsers.User
    def create(conn, %{"user" => user_params}) do
        chg = User.signup_changeset(%User{}, user_params)
        case chg.valid? do
            true ->
               {:ok, user} = User.save(chg)
        conn
        |> put_status(201)
        |> json(%{user: %{name: user.name, age: user.age, email: user.email}})
        false -> 
            conn 
            |> put_status(400)
            |> json(%{error: "Unable to create user"})
        end
    end

    def index(conn, _params) do
        conn 
        |> put_status(200)
        |> json(%{users: []})
    end

    def show(conn, _params) do
        conn
        |>put_status(200)
        |> json(%{user: "user"})
    end
end