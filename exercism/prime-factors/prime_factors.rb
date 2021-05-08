require 'prime'
class PrimeFactors
  def self.of(num)
    arr = []

    Prime.each(num) do |pri|
      break if num < pri
      if num%pri == 0
        arr << pri
        num = num/pri
        redo
      else
        next
      end
    end

    arr
  end
end
