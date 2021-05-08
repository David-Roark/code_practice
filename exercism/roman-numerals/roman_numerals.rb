# 1 = I, 5 = V, 10 = X, 50 = L, 100 = C, 500 = D, 1000 = M
class Integer

  def self.build_r(d1, d5, d10)
    %W(#{''} #{d1} #{d1*2} #{d1*3} #{d1+d5} #{d5} #{d5+d1} #{d5+d1*2} #{d5+d1*3} #{d1+d10})
  end

  ROMAN = {
    0 => Integer.build_r('I', 'V', 'X'),
    1 => Integer.build_r('X', 'L', 'C'),
    2 => Integer.build_r('C', 'D', 'M'),
    3 => ['', 'M', 'MM', 'MMM']
  }.freeze

  def to_roman
    self.to_s.chars.reverse.map.with_index { |d, i| ROMAN[i][d.to_i] }.reverse.join('')
  end

end
