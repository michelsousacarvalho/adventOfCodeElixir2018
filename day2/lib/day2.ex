defmodule Day2 do
	
	#FIRST VERSION
	# def count_characters(string) when is_binary(string) do
	# 	string
	# 	|> String.to_charlist()
	# 	|> Enum.reduce(%{}, fn codepoint, acc ->
	# 		Map.update(acc, codepoint, 1, &(&1 +1))
	# 	end)
	# end
	
	#SECOND VERSION
	# def checksum(list) when is_list(list) do
	# 	{twices, thrices} =
	# 	list
	# 	|> Enum.map(fn box_id ->
	# 		box_id
	# 		|> count_characters()
	# 		|> get_twice_and_thrice()
	# 	end)
	# 	|> Enum.reduce({0, 0}, fn {twice, thrice}, {total_twice, total_thrice} ->
	# 		{twice+total_twice, thrice + total_thrice}
	# 	end)
	# 	twices * thrices
	# end
	
	def checksum(list) when is_list(list) do 
		{twices, thrices} = 
		Enum.reduce(list, {0,0}, fn box_id, {total_twice, total_thrice} ->
			{twice, thrice} = box_id |> count_characters() |> get_twice_and_thrice()
			{twice+total_twice, thrice + total_thrice}
		end)
		twices * thrices
	end
	

	def get_twice_and_thrice(characters) when is_map(characters) do
		Enum.reduce(characters, {0, 0}, fn
			{_codepoint,2}, {_twice, thrice}-> {1, thrice}
			{_codepoint,3}, {twice, _thrice}-> {twice, 1}
			_, acc -> acc
		end)
	end
	
	#SECOND VERSION
	# def get_twice_and_thrice(characters) when is_map(characters) do
	# 	twice = Enum.count(characters, fn {_codepoint, count} -> count == 2 end)
	# 	thrice = Enum.count(characters, &match?({_codepoint, 3}, &1))
	# 	{min(twice,1), min(thrice,1)}
	# end
	
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

	def closest(list) when is_list(list) do 
		list
		|> Enum.map(&String.to_charlist/1)
		|> closest_charlists()
	end


	def closest_charlists([head | tail]) do 
		Enum.find_value(tail, &one_char_difference_string(&1, head)) ||
			closest_charlists(tail)
	end

	defp one_char_difference_string(charlist1, charlist2) do
		charlist1 
		|> Enum.zip(charlist2)
		|> Enum.split_with(fn {cp1, cp2} -> cp1 == cp2 end)
		|> case do 
			{tuples_of_codepoints, [_]} -> 
				tuples_of_codepoints
				|> Enum.map(fn {cp, _} -> cp end)
				|> List.to_string()
				
			{_, _} ->
				nil
		end
	end


end
