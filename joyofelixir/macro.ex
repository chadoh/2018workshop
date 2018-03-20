defmodule Hello do
  defmacro __using__(opts) do
    meet = Keyword.get(opts, :meet, "Hi")
    part = Keyword.get(opts, :part, "Bye")

    quote do
      def hello(name), do: "#{unquote(meet)}, #{name}"
      def bye(name), do: "#{unquote(part)}, #{name}"
    end
  end
end

defmodule English do
  use Hello
end

defmodule Spanish do
  use Hello, meet: "Hola", part: "Adios"
end

IO.puts(English.hello("Chad"))
IO.puts(English.bye("Chad"))
IO.puts(Spanish.hello("Lisa"))
IO.puts(Spanish.bye("Lisa"))
