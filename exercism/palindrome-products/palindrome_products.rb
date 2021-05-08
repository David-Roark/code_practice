class Palindromes
  def initialize(max_factor: 1, min_factor: 1)
    @min = min_factor
    @max = max_factor
    @factors
  end

  def generate
    @factors = [*@min..@max].repeated_combination(2).to_a.select { |n1,n2| (n1*n2).to_s == (n1*n2).to_s.reverse }
    self
  end

  def largest
    @store_pal = @factors.max { |a, b| a[0]*a[1] <=> b[0]*b[1] } .inject(1, :*)
    self
  end

  def smallest
    @store_pal = @factors.min { |a, b| a[0]*a[1] <=> b[0]*b[1] } .inject(1, :*)
    self
  end

  def value
    @store_pal
  end

  def factors
    @factors.select { |n1, n2| n1*n2 == @store_pal }
  end
end
