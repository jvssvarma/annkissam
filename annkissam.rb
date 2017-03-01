# Assuming dictionary as an array here. If it's a hash with nouns, verbs, articles as key's the I would convert it to array's just like below and do the same.
# Nouns, Verbs and Articles are made global, so that they can be accessed anywhere
# This is because we are generating valid sentences from dictionary and the dictionary is constant in this case
NOUNS = ["abcd", "c", "def", "h", "ij", "cde"]
VERBS = ["bc", "fg", "g", "hij", "bcd"]
ARTICLES = ["a", "ac", "e"]

# Get the string here
print "Enter the string:"
str = gets.chomp

# Again create a constant to make it easier to use
DICTIONARY = NOUNS + VERBS + ARTICLES

class Annkissam

  # This will give all the sentences that can be formed with string
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

  # This is to validate the sentence with the conditions
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

  # checks if all words in sentence are from dictionary
  def all_words_valid? set
    (set & DICTIONARY) == set
  end

  # checks if there's a verb in the sentence
  def verb_correct? set
    (set & VERBS).count >= 1
  end

  # checks if there's a noun or atleast 2 articles in the sentence
  def noun_articles_correct? set
    ((set & NOUNS).count >= 1) || ((set & ARTICLES).count >= 2)
  end

end

lets_test = Annkissam.new
print lets_test.valid_sentence(str, DICTIONARY)
