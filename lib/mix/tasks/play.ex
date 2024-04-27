defmodule Mix.Tasks.Play do
  use Mix.Task

  def run(args) do
    IO.inspect(args)
    CLI.Play.main(args)
  end
end
