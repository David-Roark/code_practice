class PigLatin
  def self.translate(text)
    # case a whole phrase
    if text.include?(' ')
      return text.split(' ').map { |e| PigLatin.translate(e) } .join(' ')
    end
    # case a single word
    # rule 1
    return text + 'ay' if text.start_with?(/[auoie]|xr|yt/)

    c, v = PigLatin.slice_consonant(text)
    # rule 4
    if (text[0,2] =~ /[xryt]/ && text[2] == 'y') || v[0] == 'y'
      i = text.index('y')
      return text[i..-1] + text[0...i] + 'ay'
    # rule 3
    elsif c[-1] + v[0] == 'qu'
      i = text.index('qu')
      return text[i+2..-1] + text[0...i+2] + 'ay'
    # rule 2
    else
      return v + c + 'ay'
    end

  end

  def self.slice_consonant(text)
    # find index of the first char that is vowel in the text
    i = 0
    text.each_char.with_index { |char, index|
      i = index
      break if char =~ /[aoiue]/ || ['xr', 'yt'].include?(text[index, 2])
    }
    # return [consonants, vowel ]
    [text[0...i], text[i..-1]]
  end

end
