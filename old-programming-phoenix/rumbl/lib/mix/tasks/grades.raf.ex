defmodule Mix.Tasks.Grades.Raf do
  use Mix.Task
  import Ecto.Query
  alias Rumbl.Repo
  alias Rumbl.Video

  @shortdoc "Counts number of videos by each category, and returns them"
  # partial solution comprehension/result thanks to Colelabar & Caleb

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

    IO.puts("___________________________ ")
    IO.puts("| Category | Upload Total |")
    IO.puts("|__________|______________|")

    Enum.each(list, fn {name, count} ->
      IO.puts("| #{String.pad_trailing(name, 8)} |       #{count}      |")
    end)

    IO.puts("|__________|______________|")
    IO.puts("Hey check out the table, users are adding videos!")
  end
end
