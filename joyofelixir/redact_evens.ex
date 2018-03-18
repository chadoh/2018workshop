# redact_evens = fn x ->
#   case x do
#     m when rem(m, 2) == 0 -> "🔥"
#     x -> x
#   end
# end
redact_evens = fn x ->
  cond do
    rem(x, 2) == 0 -> "🔥"
    x -> x
  end
end

[2, 3, 1, 5, 4, 6]
|> Enum.map(redact_evens)
|> IO.inspect
