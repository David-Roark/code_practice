class RotationalCipher
  def self.rotate(text, n)
    low = [*'a'..'z'].zip([*'a'..'z'].rotate(n)).to_h
    cap = [*'A'..'Z'].zip([*'A'..'Z'].rotate(n)).to_h
    code = low.merge(cap)

    text.gsub(/[a-zA-Z]/, code)
  end
end
