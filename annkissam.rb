$nouns = ["abcd", "c", "def", "h", "ij", "cde"]
$verbs = ["bc", "fg", "g", "hij", "bcd"]
$articles = ["a", "ac", "e"]
print "Enter the string:"
str = gets.chomp
$dictionary = $nouns + $verbs + $articles

class Annkissam

  def sentences(str, dictionary)
    n = str.length
    result = []
    result << str if dictionary.include? str
    1.upto(n-1) do |i|
      str_part = str[i..-1]
      if dictionary.include?(str_part)
        one_result = sentences(str[0..i-1], dictionary).map { |t| t+" "+str_part }
        result += one_result
      end
    end
    result
  end

  def valid_sentence(str, dictionary)
    sentences(str, dictionary)
  end

end

lets_test = Annkissam.new
print lets_test.valid_sentence(str, $dictionary)
