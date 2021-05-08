class Luhn

  def self.valid?(n)
    n.delete!(' ')

    return false if (n.size <= 1 || !!(n =~ /[^\d]/))

    arr = n.scan(/\d/).map(&:to_i)

    arr = arr.reverse.map.with_index { |num, i|
      if i%2 == 1
        num*2 > 9 ? num*2 - 9 : num*2
      else
        num
      end
    }

    arr.sum%10 == 0
  end
end
