class SumOfMultiples
  attr_reader :set

  def initialize(*set)
    @set = set.empty? ? [3, 5] : set
  end

  def self.to(num)
    SumOfMultiples.new().to(num)
  end

  def to(num)
    multiples = (1...num).to_a.select do |n|
      multiple_of?(n)
    end

    multiples.sum
  end

  private

  def multiple_of?(num)
    set.any? { |divisor| num % divisor == 0 }
  end
end
