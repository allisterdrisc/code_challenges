=begin
You'll need the following tile scores:

Letter	Value
A, E, I, O, U, L, N, R, S, T	1
D, G	2
B, C, M, P	3
F, H, V, W, Y	4
K	5
J, X	8
Q, Z	10

Sum the values of all the tiles used in each word. For instance, lets consider
the word CABBAGE which has the following letters and point values:

3 points for C
1 point for each A (there are two)
3 points for B (there are two)
2 points for G
1 point for E
Thus, to compute the final total (14 points), we count:

3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14
=end

class Scrabble
  LETTER_VALUES = {
    1 => ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'],
    2 => ['d', 'g'],
    3 => ['b', 'c', 'm', 'p'],
    4 => ['f', 'h', 'v', 'w', 'y'],
    5 => ['k'],
    8 => ['j', 'x'],
    10 => ['q', 'z']
  }

  attr_accessor :my_score
  attr_reader :word

  def initialize(word)
    @word = word.nil? ? ('') : (word.downcase)
    @total = 0
  end

  def score
    word.chars.each do |char|
      LETTER_VALUES.each do |point, letters|
        if letters.include?(char)
          self.total += point
        end
      end
    end
    total
  end

  def self.score(word)
    new(word).score
  end
end
