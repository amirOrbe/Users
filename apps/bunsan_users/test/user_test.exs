defmodule BunsanUsers.UserTest do
    use BunsanUsers.DataCase
    test "create user succesfully" do
        user = %BunsanUsers.User{}
        changeset = BunsanUsers.User.signup_changeset(user, %{name: "Amir", age: 22, email: "orbebrian@gmail.com"})
        assert 
    end
end