class Diamond
  def self.make_diamond(char)
    char.upcase!
    arr_base = [*'A'..char]
    s = arr_base.size

    arr_base = arr_base.map.with_index { |c, i|
      i == 0 ? c.center(2*s-1) + "\n" : "#{' '*(s-i-1)}#{c}#{' '*(2*i-1)}#{c}#{' '*(s-i-1)}\n"
     }

    (arr_base + arr_base[0..-2].reverse).join
  end
end
puts Diamond.make_diamond('C')
