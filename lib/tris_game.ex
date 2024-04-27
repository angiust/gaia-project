defmodule TrisGame do
  def generate_players, do: %{"player1" => &fav0/1, "player2" => &fav0/1}
  defp fav0(moves), do: List.first(moves)

  def generate_initial_state, do: []

  @all_moves for x <- 0..2, y <- 0..2, do: {x, y}
  def legal_moves(state), do: @all_moves -- state

  def next_state(state, player_choose_move), do: [player_choose_move | state]

  @winning_triples ([[{0, 0}, {1, 1}, {2, 2}], [{0, 2}, {1, 1}, {2, 0}]] ++
                      for(x <- 0..2, do: [{x, 0}, {x, 1}, {x, 2}]) ++
                      for(y <- 0..2, do: [{0, y}, {1, y}, {2, y}]))
                   |> Enum.map(fn triple -> MapSet.new(triple) end)

  @triple_containing_move fn move -> Enum.filter(@winning_triples, fn triple -> move in triple end) end

  @winning_triples_by_position @all_moves
                               |> Enum.map(fn move -> {move, @triple_containing_move.(move)} end)
                               |> Enum.into(%{})

  def who_is_next([], player_names), do: {:ok, "player1"}

  def who_is_next([last_move | other_moves], player_names) do
    state = [last_move | other_moves]
    moves_of_current_player = Enum.take_every(state, 2) |> Enum.into(%MapSet{})
    triples_to_check = Map.fetch!(@winning_triples_by_position, last_move)

    if Enum.any?(triples_to_check, fn triple ->
         triple_is_realized?(moves_of_current_player, triple)
       end) do
      {:game_over, [last_player(state), next_player(state)]}
    else
      {:ok, next_player(state)}
    end
  end

  defp triple_is_realized?(moves_of_current_player, triple),
    do: MapSet.subset?(triple, moves_of_current_player)

  defp next_player(state) when rem(length(state), 2) == 0, do: "player1"
  defp next_player(state) when rem(length(state), 2) == 1, do: "player2"
  defp last_player(state) when rem(length(state), 2) == 0, do: "player2"
  defp last_player(state) when rem(length(state), 2) == 1, do: "player1"
end
