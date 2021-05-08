class Microwave
  def initialize(t)
    if (t >= 100 && t <= 200) || (t >= 1000)
      @m = t.to_s[0...-2]
      @s = t.to_s[-2..-1]
    elsif t > 200 && t < 1000
      @m = t.to_s[0...-2].to_i + t.to_s[-2..-1].to_i / 60
      @s = t.to_s[-2..-1].to_i % 60
    else
      @m = t/60
      @s = t%60
    end
  end

  def timer
    sprintf("%02d:%02d", @m, @s)
  end
end
