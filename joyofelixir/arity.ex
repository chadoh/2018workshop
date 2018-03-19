defmodule Greeter do
  def hello(), do: phrase() <> "friend"

  def hello(names) when is_list(names) do
    names
    |> Enum.join(", ")
    |> hello
  end

  def hello(a) when is_binary(a) do
    phrase() <> a
  end

  def hello(a, b), do: phrase() <> "#{a} & #{b}"

  defp phrase, do: "Hello, "
end

IO.puts(Greeter.hello())
IO.puts(Greeter.hello("Pablo"))
IO.puts(Greeter.hello("Pablo", "Harper"))
IO.puts(Greeter.hello(["Chad", "Lisa"]))
