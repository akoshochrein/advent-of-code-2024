input = """
3   4
4   3
2   5
1   3
3   9
3   3
"""

[first, second] =
  input
  |> String.split("\n", trim: true)
  |> Enum.map(fn line -> String.split(line, " ", trim: true) end)
  |> Enum.map(fn [a, b] -> [String.to_integer(a), String.to_integer(b)] end)
  |> Enum.zip()
  |> Enum.map(fn a -> Tuple.to_list(a) end)
  |> Enum.map(fn l -> Enum.sort(l) end)

first
|> Enum.zip(second)
|> Enum.map(fn {a, b} -> abs(a - b) end)
|> Enum.sum()
|> IO.inspect()
