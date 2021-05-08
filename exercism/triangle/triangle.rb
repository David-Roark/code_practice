class Triangle
  def initialize(sides)
    @a, @b, @c = sides
  end

  def is_triangle?(a,b,c)
    a + b > c && a + c > b && b + c > a
  end
  def equilateral?
    @a != 0 && @a == @b && @a == @c
  end

  def isosceles?
    is_triangle?(@a, @b, @c) ? @a == @b || @b == @c || @c == @a : false
  end

  def scalene?
    is_triangle?(@a, @b, @c) ? @a != @b && @a != @b && @b != @c : false
  end
end
