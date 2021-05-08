class BaseConverter
  def self.convert(inp_base, digits, out_base)
    valid?(inp_base, digits, out_base)

    base_10_to(to_base_10(inp_base, digits), out_base)
  end

  def self.to_base_10(inp_base, digits)
    digits.reverse.map.with_index { |n, i| n*inp_base**i } .inject(0, :+)
  end

  def self.base_10_to(n, out_base)
    return [0] if n == 0
    result = []
    while n > 0
      result << n % out_base
      n = n / out_base
    end

    result.reverse
  end

  def self.valid?(inp_base, digits, out_base)
    raise ArgumentError unless inp_base.is_a?(Integer) &&
                               out_base.is_a?(Integer) &&
                               digits.is_a?(Array) &&
                               inp_base > 1 &&
                               out_base > 1 &&
                               digits.all? { |n| n >=0 && n < inp_base }
  end
end
