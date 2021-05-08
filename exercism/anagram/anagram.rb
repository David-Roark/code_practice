class Anagram

  def initialize(word)
    @word = word.downcase!
    @arr_word = word.chars.sort
  end

  def match(arr)
    arr.select { |w|
      w.downcase != @word && @arr_word == w.downcase.chars.sort
    }
  end

end
