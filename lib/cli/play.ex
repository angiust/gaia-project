defmodule CLI.Play do
  def main(args \\ []) do
    args
    |> parse_args()
    |> response()
    |> IO.puts()
  end

  defp parse_args(args) do
    [player_name | [game_filename | _]] = args
    {player_name, game_filename}
  end

  defp response({player_name, game_filename}) do
    {:ok, chosen_player} = get_player(player_name)
    game_value = File.read!(game_filename)
    chosen_player.(game_value)
  end

  defp get_player(player_name) do
    players = %{"fav0" => fn _game_value -> 0 end}
    Map.fetch(players, player_name)
  end
end
