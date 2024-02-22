class Series
  def initialize(series)
    @series = series
  end

  def slices(num)
    raise ArgumentError unless valid_length?(num)
    arr = series.chars.map(&:to_i)
    slices_arr = []
    0.upto(arr.size - num) do |start_idx|
      slices_arr << arr[start_idx, num]
    end
    slices_arr
  end

  private

  attr_reader :series

  def valid_length?(num)
    num <= series.size
  end
end
