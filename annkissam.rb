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
    final_result = []
    sentences(str, dictionary).each do |a|
      set = a.split(" ")
      if all_words_valid?(set) && verb_correct?(set) && noun_articles_correct?(set)
        final_result << a
      end
    end
    final_result.sort! #This can be returned without any sort but it added because it looks cool.
  end

  private

  def all_words_valid? set
    (set & $dictionary) == set
  end

  def verb_correct? set
    (set & $verbs).count >= 1
  end

  def noun_articles_correct? set
    ((set & $nouns).count >= 1) || ((set & $verbs).count >= 2)
  end
end

lets_test = Annkissam.new
print lets_test.valid_sentence(str, $dictionary)
