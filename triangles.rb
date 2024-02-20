=begin
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.
=end

=begin
P----------
check if triangle is equilateral, isosceles, or scalene
not a triangle if: not all sides are > 0, the sum of the lengths of any 2 sides are less than the length of the 3rd side 
equilateral: 3 sides of same length
isosceles: 2 sides same length
scalene: 3 different lengths
=end

# Examples
# triangle_type([3, 3, 3]) == 'equilateral'
# triangle_type([3, 3, 4]) == 'isosceles'
# triangle_type([3, 4, 5]) == 'scalene'
# triangle_type([0, 1, 2]) # => raises argument error
# triangle_type([1, 2, 4]) # => raises argument error
# triangle_type([-2, 2, 4]) # => raises argument error

class Triangle
  attr_reader :sides
  
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new "Invalid triangle lengths" unless valid?
  end
  
  def kind
    if all_equal_sides? 
      'equilateral'
    elsif two_equal_sides?
      'isosceles'
    else
      'scalene'
    end
  end
  
  private
  
  def valid?
    sides.min > 0 && size_equality?
  end
  
  def size_equality?
    sides[0..1].sum > sides[2] &&
    sides[1..2].sum > sides[0] &&
    sides[0] + sides[2] > sides[1]
  end
  
  def all_equal_sides?
    sides.uniq.size == 1
  end
  
  def two_equal_sides?
    sides.uniq.size == 2
  end
end