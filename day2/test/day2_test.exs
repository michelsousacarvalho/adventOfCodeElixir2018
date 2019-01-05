defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "count_characters" do
    assert Day2.count_characters("aabbcc") == %{
		?a => 2,
		?b => 2,
		?c => 2
	}
	
    assert Day2.count_characters("éaabbé") == %{
		?a => 2,
		?b => 2,
		?é => 2
	}
  end
  
  test "checksum" do
	  assert Day2.checksum([
		  	"abcdef",
			"bababc",
		  	"abbcde",
		  	"abcccd",
		  	"aabcdd",
		  	"abcdee",
		  	"ababab"
		  ]) == 12
  end
  
end
