defmodule BunsanUsersWeb.UserControllerTest do

    use BunsanUsersWeb.ConnCase

    test "User Creation Succesfully" do
        conn = build_conn()
        |> put_req_header("content-type", "application/json")
        |> post("api/v1/users", create_user_request_body)
        conn
        |> response(201)
    end

    def create_user_request_body do
    ~s({
        "user":{
            "name": "Amir",
            "email": "orbebrian@gmail.com",
            "age": "22"
        }
    })
    end
end