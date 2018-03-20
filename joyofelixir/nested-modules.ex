defmodule Example do
  @greeting "Hello"

  def greet(name), do: ~s(#{@greeting} #{name})
end

defmodule Example.Morning do
  def greet(name), do: "Good morning, " <> name
end

defmodule Example.Evening do
  def greet(name), do: "Good evening, " <> name
end

IO.puts(Example.greet("elpmaxe"))
IO.puts(Example.Morning.greet("Sun"))
IO.puts(Example.Evening.greet("Moon"))
