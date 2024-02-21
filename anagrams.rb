=begin
Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets", and "banana",
the program should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.
=end

=begin 
given a word and a list of words find which words are anagrams of the given word
anagrams are words that are made up of the same letters as another word (no more no less)
anagrams are cae insensitive (so lowercase everything when testing)
anagram must not be identical to og word (corn and corn not anagrams)


=end

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end
  
  def match(list)
    list.select do |str|
      str = str.downcase
      not_same_word?(str) && anagram?(str)
    end
  end
  
  def not_same_word?(other_word)
    word != other_word
  end
  
  def anagram?(other_word)
    word.chars.sort == other_word.chars.sort
  end
end