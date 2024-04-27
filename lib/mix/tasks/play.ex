defmodule Mix.Tasks.Play do
    use Mix.Task

    def run(args) do
        IO.inspect(args)
        Play.CLI.main(args)
    end

end
