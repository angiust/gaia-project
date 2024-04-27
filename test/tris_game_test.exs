defmodule TrisGameTest do
  use ExUnit.Case
  doctest TrisGame

  @next1 {:ok, "player1"}
  @next2 {:ok, "player2"}
  @win1 {:game_over, ["player1", "player2"]}
  @win2 {:game_over, ["player2", "player1"]}

  for {state, next} <- [
        {[], @next1},
        {[{1, 1}], @next2},
        {[{0, 0}, {0, 1}, {1, 0}, {0, 2}, {2, 0}], @win1},
        {[{0, 0}, {0, 1}, {1, 0}, {0, 2}, {2, 0}, {1, 1}], @win2}
      ] do
    test "who is next is correct when state is #{inspect(state)}" do
      assert TrisGame.who_is_next(unquote(state), nil) == unquote(next)
    end
  end
end
