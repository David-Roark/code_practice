class Triplet
  def initialize(*nums)
    @a, @b, @c = nums
  end

  def sum
    @a + @b + @c
  end

  def product
    @a * @b * @c
  end

  def pythagorean?
    @a < @b && @b < @c && @a < @c && @a**2 + @b**2 == @c**2
  end

  def self.where(sum: nil, min_factor: 1, max_factor: 3)
    result = []
    range = [*min_factor..max_factor].reverse

    for c in range[0..-3]
      for b in range[1..-2]
        for a in range[2..-1]
          next unless a < b && b < c && a < c
          x = new(a, b, c)
          result.push(x) if x.pythagorean?
        end
      end
    end
    result = result.select { |x| x.sum == sum } if sum
    result
  end
end
