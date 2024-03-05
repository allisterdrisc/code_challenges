class PerfectNumber
  def self.classify(num)
    raise(StandardError) if num < 1
    aliquot = find_sum_of_divs(num)
    if aliquot > num
      'abundant'
    elsif aliquot == num
      'perfect'
    else
      'deficient'
    end
  end

  def self.find_sum_of_divs(num)
    (1...num).to_a.select do |div|
      num % div == 0
    end.sum
  end
end
