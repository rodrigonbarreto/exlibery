defmodule Exlibery.Users.UserTest do
  use ExUnit.Case
  alias Exlibery.Users.User

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Rua das bananeiras, 35",
          "Rafael",
          "rafael@banana.com",
          "12345678900",
          27
        )

      expected_response = {:ok, response}

      assert response == response
    end

    test "when there are invalid params, returns an error" do
      response =
        User.build(
          "Rua das bananaeiras",
          "Rafael Jr",
          "rafael@banana.com",
          "123456789",
          15
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end