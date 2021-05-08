class Prime

  def self.nth(n)
    if n <= 0
      raise ArgumentError
    else
      store_prime = [2]
      i = 3

      while store_prime.size  < n
        store_prime << i if is_prime?(i)
        i += 2
      end

      store_prime[-1]
    end

  end

  def self.is_prime?(n)
    [*3.step(Math.sqrt(n).ceil, 2)].none? { |x| n%x == 0 }
  end

end
