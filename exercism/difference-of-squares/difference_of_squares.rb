class Squares
  def initialize(n)
    @sq = [*1..n]
  end

  def square_of_sum
    @sq.sum ** 2
  end

  def sum_of_squares
    @sq.inject(0) { |s, x| s += x**2 }
  end

  def difference
    self.square_of_sum - self.sum_of_squares
  end
end
