require 'prime'

class Affine
  AP = [*'a'..'z']

  def initialize(a, b)
    raise ArgumentError unless a.gcd(26) == 1
    @a, @b = a, b
  end

  def encode(pt)
      result = pt.downcase.scan(/[a-z0-9]/).map.with_index do |char, ind|
                  if /[0-9]/ =~ char
                    char
                  else
                    i = (@a * (AP.index(char)) + @b) % 26
                    char = AP[i]
                  end
                  char += ' ' if ((ind + 1) % 5 == 0)

                  char
                end
      result.join.sub(/ $/, '')
  end

  def decode(ct)
    result = ct.scan(/[a-z0-9]/).map.with_index do |char|
                if /[0-9]/ =~ char
                  char
                else
                  i_char_pt = 0
                  i_char_ct = AP.index(char)

                  (0..25).each { |n|
                    if (@a * n + @b) % 26 == i_char_ct
                      i_char_pt = n
                      break
                    end
                  }

                  AP[i_char_pt]
                end
              end
    result.join
  end
end
