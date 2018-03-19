defmodule Greeter do
  def hello(names, locale \\ "en")

  def hello(names, locale) when is_list(names) do
    names
    |> Enum.join(" & ")
    |> hello(locale)
  end

  def hello(name, locale) when is_binary(name) do
    phrase(locale) <> name
  end

  defp phrase("en"), do: "Hello, "
  defp phrase("es"), do: "Hola, "
end

IO.puts(Greeter.hello("Harper"))
IO.puts(Greeter.hello("Pablo", "es"))
IO.puts(Greeter.hello(["Pablo", "Harper"]))
IO.puts(Greeter.hello(["Harper", "Pablo"], "es"))
