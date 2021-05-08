class ComplexNumber
  attr_reader :real, :imaginary

  def initialize(a, b)
    @real, @imaginary = a, b
  end

  def *(oth)
    a = @real
    b = @imaginary
    c = oth.real
    d = oth.imaginary

    @real = a*c - b*d
    @imaginary = b*c + a*d

    self
  end

  def +(oth)
    a = @real
    b = @imaginary
    c = oth.real
    d = oth.imaginary

    @real = a + c
    @imaginary = b + d

    self
  end

  def -(oth)
    a = @real
    b = @imaginary
    c = oth.real
    d = oth.imaginary

    @real = a - c
    @imaginary = b - d

    self
  end

  def ==(oth)
    @real == oth.real && @imaginary == oth.imaginary
  end

  def /(oth)
    a = @real
    b = @imaginary
    c = oth.real
    d = oth.imaginary

    @real = (a * c + b * d).fdiv(c**2 + d**2)
    @imaginary = (b * c - a * d).fdiv(c**2 + d**2)
    self
  end

  def abs
    Math::sqrt(@real**2 + @imaginary**2)
  end

  def conjugate
    @imaginary = -@imaginary

    self
  end

  def exp
    a = @real
    b = @imaginary

    @real = Math.exp(a) * Math::cos(b)
    @imaginary = Math.exp(a) * Math::sin(b).round(15)

    self
  end
end
