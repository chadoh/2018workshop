#Got help from Raf who also got help from a number of other classmates and Prof. O
defmodule Mix.Tasks.Grades.Brandon do
  use Mix.Task
  import Ecto.Query
  alias Rumbl.Repo
  alias Rumbl.Video

  @shortdoc "Counts the number of videos in each category"

  def run(_) do
    Mix.Task.run("app.start")

    grid =
      Repo.all(
        from(
          v in Video,
          join: c in assoc(v, :category),
          select: {c.name, count(v.id)},
          group_by: c.name
        )
      )

    IO.puts("| Category | Upload Total |")
    IO.puts("|__________|______________|")

    Enum.each(grid, fn {name, count} ->
      IO.puts("| #{String.pad_trailing(name, 8)} |       #{count}      |")
    end)

  end
end
