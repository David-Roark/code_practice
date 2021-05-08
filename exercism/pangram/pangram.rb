class Pangram
  def self.pangram?(str)
    str.downcase.scan(/[a-z]/).uniq.size == 26
  end

end
