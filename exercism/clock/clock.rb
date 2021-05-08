class Clock
  attr_accessor :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = (hour + minute/60)%24
    @minute = minute%60
  end

  def to_s
    "%02d:%02d" %[@hour, @minute]
  end

  def +(other)
    Clock.new(minute: @minute + other.minute, hour: @hour + other.hour)
  end

  def -(other)
    Clock.new(minute: @minute - other.minute, hour: @hour - other.hour)
  end

  def ==(other)
    self.to_s == other.to_s
  end
end
