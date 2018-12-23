defmodule Day1 do 
	def final_frequency(input) do 
		input
		|> String.splitter("\n", trim: true)
		# |> IO.inspect(label: "split")
		|> Stream.map(fn line -> String.to_integer(line) end)
		# |> IO.inspect(label: "mapped")
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
		|> File.read!()
		|> Day1.final_frequency()
		|> IO.puts
		
	_ ->
		IO.puts :stderr,  "we expected --test or an input file"
		System.halt(1)
end