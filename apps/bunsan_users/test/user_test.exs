defmodule BunsanUsers.UserTest do
    use BunsanUsers.DataCase

    setup do
        user = %BunsanUsers.User{}
        user_chg = BunsanUsers.User.signup_changeset(user, %{"name" => "Brian", "age" => 23, "email" => "brian@gmail.com"})
        stored_user = BunsanUsers.Repo.insert!(user_chg)
        {:ok, user: stored_user}
    end


    test "create user succesfully" do
        user = %BunsanUsers.User{}
        changeset = BunsanUsers.User.signup_changeset(user, %{"name" => "Amir", "age" => 22, "email" => "orbebrian@gmail.com"})
        assert changeset.valid? == true
    end

    test "create user unsuccesfully" do
        user = %BunsanUsers.User{}
        changeset = BunsanUsers.User.signup_changeset(user, %{"name" => "Amir", "age" => "A", "email" => "orbebrian@gmail.com"})
        assert changeset.valid? == false
    end

    test "search user succesfully", %{user: user} do
        user = BunsanUsers.User.search(user.id)
        assert user.name == "Brian"
    end

    test "search all users" do
       user = BunsanUsers.User.search_all
       assert users!= []
    end
end