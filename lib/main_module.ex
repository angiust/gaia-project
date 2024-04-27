defmodule Play.CLI do
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

  defp response({player_name, _game_filename}) do
    {:ok, chosen_option} = get_player(player_name)
    chosen_option
  end

  defp get_player(player_name) do
    players = %{"fav0" => 0}
    Map.fetch(players, player_name)
  end
end
