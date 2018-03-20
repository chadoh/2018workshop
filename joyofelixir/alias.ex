defmodule Sayings.Greetings do
  def basic(name), do: "Hi, #{name}"
end

defmodule Aliaser do
  alias Sayings.Greetings, as: Hi

  def greeting(name), do: Hi.basic(name)
end

defmodule Importer do
  import Sayings.Greetings

  def greeting(name), do: basic(name)
end

IO.puts(Aliaser.greeting("Pabs"))
IO.puts(Importer.greeting("Harps"))
