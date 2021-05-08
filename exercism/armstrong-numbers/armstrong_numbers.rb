class ArmstrongNumbers

  def self.include?(n)
    n == n.to_s.chars.inject(0) { |s, x| s += x.to_i**(n.to_s).size }
  end
end
