defmodule Day1 do 
	def final_frequency(file_stream) do 
		file_stream 
		# |> IO.inspect(label: "split")
		|> Stream.map(fn line ->
			{integer, _leftover} = Integer.parse(line)
			integer 
		end)
		|> Enum.sum()
	end
end


case System.argv() do 
	["--test"] ->
		ExUnit.start()
		
		defmodule Day1Test do 
			use ExUnit.Case
			
			import Day1
			
			test "final_frequency" do 
				assert final_frequency("""
							+1
							+1
							+1
							""") == 3
			end
		end
	[input_file] -> 
		input_file
		|> File.stream!([], :line)
		|> Day1.final_frequency()
		|> IO.puts
		
	_ ->
		IO.puts :stderr,  "we expected --test or an input file"
		System.halt(1)
end