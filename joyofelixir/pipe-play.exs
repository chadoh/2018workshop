day_to_num = fn
  "Monday" -> 1
  "Tuesday" -> 2
  "Wednesday" -> 3
  "Thursday" -> 4
  "Friday" -> 5
  "Saturday" -> 6
  "Sunday" -> 7
end

%{
  "Monday" => 28,
  "Tuesday" => 29,
  "Wednesday" => 29,
  "Thursday" => 24,
  "Friday" => 16,
  "Saturday" => 16,
  "Sunday" => 20
}
|> Enum.map(fn ({day, temp}) -> {day, temp * 1.8 + 32} end)
|> Enum.sort_by(fn ({day, temp}) -> day_to_num.(day) end)
|> IO.inspect
