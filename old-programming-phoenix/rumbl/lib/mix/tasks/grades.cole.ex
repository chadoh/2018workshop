defmodule Mix.Tasks.Grades.Cole do
  use Mix.Task
  import Ecto.Query
  alias Rumbl.Repo
  alias Rumbl.Video

  def run(_) do
    Mix.Task.run "app.start"

    Repo.all(
      from v in Video,
        left_join: c in assoc(v, :category),
        select: {c.name, count(c.id)},
        group_by: c.id
    )
    |> IO.inspect
  end
end
