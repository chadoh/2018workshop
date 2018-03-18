redact_twos = fn
  2 -> "🔥"
  x -> x
end

[2, 3, 1]
|> Enum.map(redact_twos)
|> IO.inspect
