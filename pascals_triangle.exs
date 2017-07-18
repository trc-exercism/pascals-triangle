defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(num) do
    1..num
      |> Enum.to_list
      |> Enum.map(fn(row) -> row_result(row) end)
      |> Enum.map(fn({result, _acc}) -> result end)
  end

  defp row_result(row) do
    0..(row - 1)
      |> Enum.map_reduce(1, fn(k, acc) -> {get_value(acc, row, k), get_value(acc, row, k)} end)
  end

  defp get_value(_last_element, _row, 0), do: 1
  defp get_value(last_element, row, k) do
    div(last_element * (row - k), k)
  end
end
