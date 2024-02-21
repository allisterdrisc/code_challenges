class Octal
  attr_reader :octal
  attr_accessor :decimal

  def initialize(octal_str)
    @octal = octal_str
    @decimal = 0
  end

  def to_decimal
    return 0 if invalid_octal?(octal)
    digits = octal.to_i.digits
    digits.each_with_index do |digit, power|
      self.decimal += (digit * (8**power))
    end
    decimal
  end

  private

  def invalid_octal?(octal)
    octal.match?(/[a-z89]/i)
  end
end
