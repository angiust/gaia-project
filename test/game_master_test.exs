defmodule GameMasterTest do
  use ExUnit.Case
  doctest GameMaster

  test "process game" do
    rank_list = GameMaster.process(TestGame)
    assert is_list(rank_list)
    assert MapSet.new(rank_list) == MapSet.new(["player1", "player2"])
  end
end

defmodule TestGame do
  def generate_players, do: %{"player1" => fn -> nil end, "player2" => fn -> nil end}
  def generate_initial_state, do: nil
  def who_is_next(state, player_names), do: {:game_over, ["player1", "player2"]}
  def legal_moves(state), do: []
end
