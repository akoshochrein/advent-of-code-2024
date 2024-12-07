input = """
7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
"""

defmodule LevelsChecker do
  def check_ascending(list) do
    list |> Enum.sort() == list
  end

  def check_descending(list) do
    list
    |> Enum.sort()
    |> Enum.reverse() ==
      list
  end

  def check_constrained_ascension([head | tail]) do
    cond do
      length(tail) == 0 ->
        true

      length(tail) == 1 ->
        [next] = tail
        diff = abs(head - next)
        diff < 4 and diff > 0

      true ->
        [next | _] = tail
        diff = abs(head - next)

        case diff < 4 and diff > 0 do
          true ->
            check_constrained_ascension(tail)

          false ->
            false
        end
    end
  end
end

input
|> String.split("\n", trim: true)
|> Enum.map(fn line -> String.split(line, " ", trim: true) end)
|> Enum.map(fn line -> Enum.map(line, &String.to_integer/1) end)
|> Enum.map(fn line ->
  (LevelsChecker.check_ascending(line) or LevelsChecker.check_descending(line)) and
    LevelsChecker.check_constrained_ascension(line)
end)
|> Enum.filter(fn line -> line end)
|> Enum.count()
|> IO.inspect()
