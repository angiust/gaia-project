defmodule GaiaProjectTest do
  use ExUnit.Case
  doctest GaiaProject

  test "greets the world" do
    assert GaiaProject.hello() == :world
  end
end
