class Diamond
  ALPHABET = ('A'..'Z').to_a

  def self.make_diamond(char)
    top_half = top_half(char)
    diamond = add_bottom_half(top_half)
    diamond.join
  end

  # rubocop:disable Metrics/MethodLength
  def self.top_half(letter)
    outer = ALPHABET.index(letter)
    inner = 1
    ALPHABET[0..outer].each_with_object([]) do |char, top_half|
      if char == 'A'
        top_half << "#{' ' * outer}A#{' ' * outer}\n"
      else
        top_half << "#{' ' * outer}#{char}#{' ' * inner}#{char}#{' ' * outer}\n"
        inner += 2
      end
      outer -= 1
    end
  end
  # rubocop:enable Metrics/MethodLength

  def self.add_bottom_half(top_half)
    diamond = top_half
    diamond + top_half[0...-1].reverse
  end
end
