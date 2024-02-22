class Robot
  attr_reader :name

  LETTERS = ('A'..'Z').to_a
  DIGITS = ('0'..'9').to_a
  @@used_names = []

  def initialize
    @name = generate_uniq_name
    @@used_names << name
  end

  def generate_uniq_name
    loop do
      random = ''
      2.times { random << LETTERS.sample }
      3.times { random << DIGITS.sample }
      unless @@used_names.include?(random)
        return random
      end
    end
  end

  def reset
    self.name = generate_uniq_name
    @@used_names << name
  end

  private

  attr_writer :name
end
