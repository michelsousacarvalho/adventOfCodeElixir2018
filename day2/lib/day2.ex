defmodule Day2 do
	def count_characters(string) when is_binary(string) do
		string
		|> String.to_charlist()
		|> Enum.reduce(%{}, fn codepoint, acc -> 
			Map.update(acc, codepoint, 1, &(&1 +1))
		end)
	end

end
