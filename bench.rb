require 'benchmark'
load "substring.rb"

#Benchmarks of longest_repeated_substring(text)

dummy_text = "AllRubyprogrammersregularlaaaaaaaaaayencounterthemysticalerrorsyntaxealamakotarror,unexpectedend,expecaaaaaaatingkeyword_end.Weknowwhatitmeansaaaaaaaa:weleftoffanendsomewhereinthecode.AsRubyalamakotacompiledoursource,itkeepstrackofnesaaaaaaaaaating,andwhenitalamakotareachedtheendoffile(end),itwasexpectingtoseeonemoreendkeyword,andnonewasthere."

dummy_class = Substring.new

Benchmark.bm do |bm|
	bm.report("longest_repeated_substring: ") do 
		dummy_class.longest_repeated_substring(dummy_text)
	end
end

#Benchmarks of some Ruby elements (educational value):
iterations = 100000

Benchmark.bm do |bm|
	bm.report("for: ") do
		for i in 1..iterations do
			x = i
		end
	end
end

Benchmark.bm do |bm|
	bm.report("upto: ") do
		1.upto(100000) do |i|
			x = i
		end
	end
end
