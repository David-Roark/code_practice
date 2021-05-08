class SumOfMultiples

  def initialize(*lists_num)
    @lists = lists_num
  end

  def to(max)
    @lists.map { |e| arr_mul(e, max) } .flatten.uniq.sum

  end

  def arr_mul(n, max)
    return [0] if n == 0
    arr = []
    i = 1
    while n*i < max
      arr << n*i
      i += 1
    end

    arr
  end
end
