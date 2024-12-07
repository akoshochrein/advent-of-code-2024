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

count_instances = fn list, item -> Enum.count(list, fn x -> x == item end) end

first
|> Enum.map(fn a -> {a, count_instances.(second, a)} end)
|> Enum.map(fn {a, b} -> a * b end)
|> Enum.sum()
|> IO.inspect()
