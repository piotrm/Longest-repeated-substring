#==Longest Repeated Substring
#
#==Klasa Substring
#Klasa ta realizuje wyszukiwanie najdłuższego powtarzającego się podciągu. Wydaje mi się, że bardziej intuicyjnym rozwiązaniem byłoby napisanie rozszerzenia dla klasy String:
#
#	class String
#		def longest_repeated_substring(text)
#			...
#		end
#		
#		def extract_substring(text)
#			...
#		end
#
#Ale to by było niezgodne z konwencją rozwiązania, a więc niech będzie.
#
#
#==Uwagi:
#* Nie byłem do końca pewien czy substring może zawierać spacje. Jeśli tak, to odczytywanie wyniku, biorąc pod uwagę zalecany format wyjścia (substring'i podzielone spacjami) może być utrudnione. W każdym razie funkcja przewiduje szukanie po całym tekście, włączając w to spacje.
#* Nie wiedziałem, czy mam zachować zasady *enkapsulacji* czy też nie, dlatego będąc leniwym nie stworzyłem akcesorów ani konstruktora. To bardzo źle?
#

#Klasa do obsługi podciągów
class Substring
	
	#Metoda realizująca wyszukiwanie najdłuższego powtarzającego się podciągu
	def longest_repeated_substring(text)
		repeated_substring = []
		result = []

		substrings = extract_substrings(text)
		
		#wybranie unikalnych podciągów
		substrings.uniq.each do |str|
			count = 0
			#liczenie ilości powtórzeń danego podciągu
			text.scan(str){|t| count += 1}
			repeated_substring.push(str) if count > 1
		end
		
		unless repeated_substring.empty?
			#sortowanie wybranych podciągów po długości i alfabetycznie pozwala umiejscowić na końcu listy najdłuższy ciąg powtarzany
			maximum_length = repeated_substring.sort_by{|w| w.length}[-1].length
			#wyszukanie wszystkich powtórzonych ciągów o największej długości
			result = repeated_substring.find_all{|elem| elem.size == maximum_length}
		end
		
		result.join(" ")
	end

	#Metoda realizująca wyszukiwanie konkretnych podciągów na potrzeby longest_repeated_substring. Pod pojęciem "konkretny" mam na myśli taki, który jest co najwyżej tak długi jak połowa długości całego tekstu. Branie pod uwagę dłuższych nie ma sensu, bo one nie mają prawa się powtórzyć. Tak samo podciągi o długości 1 znaku są ignorowane.
	#
	#Nie jestem pewny czy linijka:
	#	(i+1).upto((s/2)+i> s ? s : (s/2)+i-1) do |j|
	#
	#nie jest zbyt karkołomna - mógłbym ją ewentualnie rozbić na:
	#	x = (s/2)+i> s ? s : (s/2)+i-1
	#	(i+1).upto(x)
	#
	#
	#Co więcej, 
	#	0.upto(s-1) do |i|
	#		(i+1).upto(...) do |j| 
	#wygląda jakby miało dużą złożoność, ale to nie jest O(n^2), bo ograniczyłem zakres znaków, 
	#na jakim operuje upto wewnętrzny - jest to maksymalnie n/2
	def extract_substrings(text)
		substrings = []
		s = text.size

		#i iteruje po wszystkich znakach tekstu (bez ostatniego, bo osiągnięcie ostatniego nie wpływa na wynik)
		0.upto(s-1) do |i|
			#j to wartości od i+1 (żeby móc wycinać przedziały tekstu) do (s/2)+i-1 (bez ostatniego elementu) 
			#- czyli to przedział równy połowie długości tekstu.
			#W wypadku, gdy i jest większe niż (s/2) czyli (s/2)+i > s to wtedy j wykraczałoby poza zasięg tekstu, 
			#dlatego zostaje ustawione na koniec tekstu - s
			(i+1).upto((s/2)+i> s ? s : (s/2)+i-1) do |j|
				#Wycinanie substring'ów z tekstu - stąd też potrzebne są dwie wartości oznaczające indeksy (i, j)
				substring = text[i..j]
				#Do zbioru substringów wpadają tylko te, które są dłuższe od 1
				substrings.push(substring) unless substring.size < 2				
				break if j == s-1
			end
		end

		substrings
	end

end
