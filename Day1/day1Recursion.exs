defmodule Day1 do 
	def final_frequency(input) do 
		input
		|> String.split("\n", trim: true)
		|> sum_lines(0)
	end
	
	defp sum_lines([line | lines], current_frequency) do 
		new_frequency = String.to_integer(line) + current_frequency
		sum_lines(lines, new_frequency)
	end
	
	defp sum_lines([], current_frequency) do
		current_frequency
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