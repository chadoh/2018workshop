defmodule Mix.Tasks.Grades.Shane do
  use Mix.Task
  import Ecto.Query
  alias Rumbl.Repo
  alias Rumbl.Video

  def run(_) do
    Mix.Task.run("app.start")

    list =
      Repo.all(
        from(
          v in Video,
          join: c in assoc(v, :category),
          select: {c.name, count(v.id)},
          group_by: c.name
        )
      )

    IO.puts("_____________________")
    IO.puts("| Category | Total |")
    IO.puts("|__________|_______|")

    Enum.each(list, fn {name, count} ->
      IO.puts("| #{String.pad_trailing(name, 8)} |       #{count}      |")
    end)

    IO.puts("|__________|_________|")
    IO.puts("Videos are added")
  end
end
