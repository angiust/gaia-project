defmodule GaiaProject.CLI do
  def main(args \\ []) do
    args
    |> parse_args()
    |> response()
    |> IO.puts()
  end

  defp parse_args(args) do
    [first | [second | _ ]] = args
    {first, second}
  end

  defp response({first, second}) do
    {:ok, chosen_option} = get_player(first)
    chosen_option
  end

  defp get_player(player_name) do
    players = %{"fav0" => 0}
    Map.fetch(players, player_name)
  end

end
