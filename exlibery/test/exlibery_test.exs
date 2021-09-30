defmodule ExliberyTest do
  use ExUnit.Case
  doctest Exlibery

  test "greets the world" do
    assert Exlibery.hello() == :world
  end
end
