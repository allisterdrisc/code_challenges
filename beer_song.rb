class BeerSong
  # rubocop:disable Layout/LineLength
  def self.verse(num)
    if num > 2
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
        "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    elsif num == 2
      two_bottles
    elsif num == 1
      one_bottle
    else
      zero_bottles
    end
  end
  # rubocop:enable Layout/LineLength

  def self.verses(start, ending)
    lines = []
    num = start

    until num < ending
      lines << verse(num)
      num -= 1
    end
    lines.join("\n")
  end

  def self.lyrics
    num = 99
    lines = []
    until num < 0
      lines << verse(num)
      num -= 1
    end

    lines.join("\n")
  end

  def self.two_bottles
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def self.one_bottle
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def self.zero_bottles
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end
