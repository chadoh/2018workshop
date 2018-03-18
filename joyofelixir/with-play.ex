last_name_first = fn user ->
  with {:ok, first} <- Map.fetch(user, :first),
       {:ok, last} <- Map.fetch(user, :last),
    do: last <> ", " <> first
end

[
  %{ first: "Chad", last: "Ostrowski" },
  %{ first: "Lisa", last: "Yoder" },
  %{ first: "No Last" },
]
|> Enum.map(last_name_first)
|> IO.inspect
