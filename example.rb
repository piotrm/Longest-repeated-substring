require 'profile'
load 'substring.rb'

text1 = "alaalaalaalaalaaaalalalaaaalaaaalaaaallaaa"
text2 = "ala ma kota. kota ma ala. kot ten psoci. psoci gdy sie rozochoci. kota ma ala. ala ma kota."
text3 = "abcdefghijk"

s = Substring.new
puts "Text1: #{text1} => #{s.longest_repeated_substring(text1)}"
puts "Text2: #{text2} => #{s.longest_repeated_substring(text2)}"
puts "Text3: #{text3} => #{s.longest_repeated_substring(text3)}"
