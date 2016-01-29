# Cyclical figurate numbers
# Problem 61
# Triangle, square, pentagonal, hexagonal, heptagonal, and octagonal numbers are all figurate (polygonal) numbers and are generated by the following formulae:
#
# Triangle    P3,n=n(n+1)/2   1, 3, 6, 10, 15, ...
# Square      P4,n=n^2         1, 4, 9, 16, 25, ...
# Pentagonal  P5,n=n(3n−1)/2  1, 5, 12, 22, 35, ...
# Hexagonal   P6,n=n(2n−1)    1, 6, 15, 28, 45, ...
# Heptagonal  P7,n=n(5n−3)/2  1, 7, 18, 34, 55, ...
# Octagonal   P8,n=n(3n−2)    1, 8, 21, 40, 65, ...
# The ordered set of three 4-digit numbers: 8128, 2882, 8281, has three interesting properties.
#
# The set is cyclic, in that the last two digits of each number is the first two digits of the next number (including the last number with the first).
# Each polygonal type: triangle (P3,127=8128), square (P4,91=8281), and pentagonal (P5,44=2882), is represented by a different number in the set.
# This is the only set of 4-digit numbers with this property.
# Find the sum of the only ordered set of six cyclic 4-digit numbers for which each polygonal type: triangle, square, pentagonal, hexagonal, heptagonal, and octagonal, is represented by a different number in the set.

module PolygonalNumbers
  extend self

  def triangle(n)
    n * (n + 1) / 2
  end

  def square(n)
    n**2
  end

  def pentagonal(n)
    n * (3 * n - 1) / 2
  end

  def hexagonal(n)
    n * (2 * n - 1)
  end

  def heptagonal(n)
    n * (5 * n - 3) / 2
  end

  def octagonal(n)
    n * (3 * n - 2)
  end
end

def polygonal_numbers(func)
  numbers = []
  loop.with_index do |_, i|
    number = PolygonalNumbers.send(func, i)
    if number.to_s.length > 4
      break
    elsif number.to_s.length == 4
      numbers << number
    end
  end
  numbers
end

triangles   = polygonal_numbers('triangle')
squares     = polygonal_numbers('square')
pentagonals = polygonal_numbers('pentagonal')
hexagonals  = polygonal_numbers('hexagonal')
heptagonals = polygonal_numbers('heptagonal')
octagonals  = polygonal_numbers('octagonal')

def search_in(set, number)
  res = []
  set.each do |el|
    if number.to_s[2..3] == el.to_s[0..1]
      res << [number, el]
    end
  end
  res
end

triangles.each do |triangle|
  p search_in(pentagonals, triangle)
  # pentagonals.each do |pentagonal|
  #   if triangle.to_s[2..3] == pentagonal.to_s[0..1]
  #     p "#{triangle} #{pentagonal}"
  #   end
  # end
end

# def cycle?(arr)
#   permutations = arr.permutation(arr.size).to_a
#   permutations.each do |permutation|
#     (0..permutation.size - 1).each do |i|
#       if permutation[i].to_s[2..3] != permutation[i + 1 == permutation.size ? 0 : i + 1].to_s[0..1]
#         break
#       end
#       return true if i == permutation.size - 1
#     end
#   end
#   false
# end
#
# catch(:done) do
#   triangles.each do |triangle|
#     squares.each do |square|
#       pentagonals.each do |pentagonal|
#         hexagonals.each do |hexagonal|
#           heptagonals.each do |heptagonal|
#             octagonals.each do |octagonal|
#               arr = [triangle, square, pentagonal, hexagonal, heptagonal, octagonal]
#               if cycle?(arr)
#                 p arr
#                 p arr.inject(:+)
#                 throw(:done)
#               end
#             end
#           end
#         end
#       end
#     end
#   end
# end

