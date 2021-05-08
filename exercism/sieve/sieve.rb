require 'prime'

class Sieve

  def initialize(n)
    @lists = [*2..n]
  end

  def primes
    size = @lists.size
    l = @lists

    @lists.each.with_index { |num, i|
      l = l - Array.new(size - i) { |index| (index+2)*num }
    }

    l
  end
end
