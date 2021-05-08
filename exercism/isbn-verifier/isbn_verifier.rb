class IsbnVerifier
  def self.valid?(text)
    arr = text.scan(/[0-9X]/).map { |e| e == 'X' ? 10 : e.to_i }.reverse
    if arr.include? 10
      return false unless arr[0] == 10
    end
    return false unless arr.size == 10

    s = 0
    arr.each.with_index(1) { |x, i| s += x*i }

    s%11 == 0
  end
end
