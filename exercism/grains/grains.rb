class Grains
  def self.square(n)

    case n
    when 1..64
      2**(n-1)
    else
      raise ArgumentError
    end

  end

  def self.total
    (1..64).inject(0) { |s, num| s += 2**(num - 1) }
  end

end
