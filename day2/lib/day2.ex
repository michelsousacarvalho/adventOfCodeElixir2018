defmodule Day2 do
	
	#FIRST VERSION
	# def count_characters(string) when is_binary(string) do
	# 	string
	# 	|> String.to_charlist()
	# 	|> Enum.reduce(%{}, fn codepoint, acc ->
	# 		Map.update(acc, codepoint, 1, &(&1 +1))
	# 	end)
	# end
	def checksum(list) when is_list(list) do 
		{twices, thrices} = 
		list 
		|> Enum.map(fn box_id ->
			box_id
			|> count_characters()
			|> get_twice_and_thrice()
		end)
		|> Enum.reduce({0, 0}, fn {twice, thrice}, {total_twice, total_thrice} -> 
			{twice+total_twice, thrice + total_thrice}
		end)
		twices * thrices
	end
	
	def get_twice_and_thrice(characters) when is_map(characters) do
		twice = Enum.count(characters, fn {_codepoint, count} -> count == 2 end)
		thrice = Enum.count(characters, &match?({_codepoint, 3}, &1))
		{min(twice,1), min(thrice,1)}
	end
	
	def count_characters(string) when is_binary(string) do 
		count_characters(string, %{})
	end
	
	defp count_characters(<<codepoint::utf8, rest::binary>>, acc) do 
		acc = Map.update(acc, codepoint, 1, &(&1 +1))
		count_characters(rest, acc)
	end
	
	defp count_characters(<<>>, acc) do
		acc
	end 

end
