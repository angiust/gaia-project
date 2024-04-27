defmodule GameMaster do
  def process(game) do
    players = game.generate_players()
    initial_state = game.generate_initial_state()
    # it will depends by the final state.
    get_rank_list(game, initial_state, players)
  end

  def get_rank_list(game, state, players) do
    next = game.who_is_next(state, Map.keys(players))

    case next do
      {:ok, next_player} ->
        get_rank_list(game, next_state(game, state, next_player, players), players)

      {:game_over, rank_list} ->
        rank_list
    end
  end

  def next_state(game, state, next_player, players) do
    legal_moves = game.legal_moves(state)
    player_choose_move = Map.fetch!(players, next_player).(state, legal_moves)
  end
end
