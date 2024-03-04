class CustomSet
  attr_reader :set

  def initialize(arr = [])
    @set = arr
  end

  def empty?
    set.empty?
  end

  def contains?(ele)
    set.include?(ele)
  end

  def subset?(other_set)
    set.all? { |ele| other_set.contains?(ele) }
  end

  def disjoint?(other_set)
    return false if set.any? { |ele| other_set.contains?(ele) }
    true
  end

  def eql?(other_set)
    set.uniq.sort == other_set.set.uniq.sort
  end

  def add(ele)
    set << ele unless contains?(ele)
    self
  end

  def intersection(other_set)
    shared_set = set.select { |ele| other_set.contains?(ele) }
    check_new_set_empty(shared_set)
  end

  def difference(other_set)
    diff_set = set.dup
    other_set.set.each do |ele|
      if contains?(ele)
        diff_set.delete(ele)
      end
    end
    check_new_set_empty(diff_set)
  end

  def union(other_set)
    combo_set = (set + other_set.set).uniq.sort
    check_new_set_empty(combo_set)
  end

  def check_new_set_empty(new_set)
    if new_set.empty?
      CustomSet.new
    else
      CustomSet.new(new_set)
    end
  end

  def ==(other_set)
    set == other_set.set
  end
end
