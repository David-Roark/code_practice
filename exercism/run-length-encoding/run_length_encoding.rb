class RunLengthEncoding
  def self.encode(input)
    return '' if input == ''
    arr_char = input.chars + [true]
    c_size = 0
    char = input[0]
    output = ''

    arr_char.each_with_index { |c, i|
      if c == true
        output += c_size == 1 ? input[i-1] :  "#{c_size}#{input[i-1]}"
        return output
      elsif c == char
        c_size += 1
      else
        output += c_size == 1 ? input[i-1] :  "#{c_size}#{input[i-1]}"
        c_size = 1
        char = input[i]
      end
    }
  end

  def self.decode(input)
    input.scan(/\d*[A-Z_ ]{1}/i)
         .map { |e| e.size == 1 ? e : e[-1]*(e[0..-2].to_i) }
         .join

  end
end
