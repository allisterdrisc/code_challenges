class RomanNumeral
  DIGIT_TO_ROMAN = {
    1 => ['I', 'X', 'C', 'M'],
    2 => ['II', 'XX', 'CC', 'MM'],
    3 => ['III', 'XXX', 'CCC', 'MMM'],
    4 => ['IV', 'XL', 'CD', 'DM'],
    5 => ['V', 'L', 'D'],
    6 => ['VI', 'LX', 'DC'],
    7 => ['VII', 'LXX', 'DCC'],
    8 => ['VIII', 'LXXX', 'DCCC'],
    9 => ['IX', 'XC', 'CM'],
    0 => ""
  }
  
  attr_reader :number

  def initialize(integer)
    @number = integer
  end
  
  def to_roman
    digits = number.digits
    
    digits.map.with_index do |digit, idx|
      DIGIT_TO_ROMAN[digit][idx]
    end.reverse.join
  end
end
