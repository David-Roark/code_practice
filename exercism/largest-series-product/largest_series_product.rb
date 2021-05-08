class Series
  def initialize(num)
    @num = num
  end

  def largest_product(n)
    raise ArgumentError if n > @num.size || n < 0 || @num =~ /[^\d+]/
    return 1 if n == 0
    arr = @num.chars.map(&:to_i)
    arr[0..-n].map
              .with_index { |_, i| arr[i,n].inject(1, :*) } 
              .max
  end
end
