class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 0
    aliquot = aliquot_sum(num)
    if aliquot == num
      'perfect'
    elsif aliquot > num
      'abundant'
    else
      'deficient'
    end
  end

  def self.aliquot_sum(num)
    divisors = []
    (1...num).each do |n|
      if num % n == 0
        divisors << n
      end
    end
    divisors.sum
  end
end
