class Frame
  attr_accessor :throws, :tab

  def initialize(pins)
    raise Game::BowlingError if pins < 0 || pins > 10

    @throws = [pins]
    @tab
  end

  def full?
    @throws == [10] || @throws.size == 2
  end

  def build_tab
    @tab = if @throws == [10]
             :strike
           elsif @throws.sum == 10
             :spare
           else
             :open
           end
  end
end

class Game
  class BowlingError < ArgumentError; end

  def initialize
    @frames = []
  end

  def roll(pins)
    if full_frames?
      raise BowlingError if @frames[9].tab == :open
      raise BowlingError if @frames[9].tab == :spare && @frames[10]&.throws&.size == 1
      raise BowlingError if @frames[9].tab == :strike && @frames[10]&.throws&.size == 2
    end

    if @frames == [] || @frames[-1].full?
      @frames << Frame.new(pins)
    else
      raise BowlingError if @frames[-1].throws[0] + pins > 10

      @frames[-1].throws << pins
    end

    @frames[-1].build_tab if @frames[-1].full?

    self
  end

  def score
    valid_score?

    result = 0
    @frames[0, 10].each_with_index do |f, i|
      result += case f.tab
                when :open
                  f.throws.sum
                when :spare
                  10 + @frames[i + 1].throws[0]
                else
                  10 + bonus(i)
                end
    end

    result
  end

  private
  def full_frames?
    @frames.size >= 9 && @frames[9]&.full?
  end

  def bonus(i)
    return 10 + @frames[i + 2].throws[0] if @frames[i + 1]&.tab == :strike

    @frames[i + 1].throws.sum
  end

  def valid_score?
    raise BowlingError unless full_frames?

    if @frames[9].tab == :spare
      raise BowlingError unless @frames[10] && @frames[10].throws.size == 1
    end

    if @frames[9].tab == :strike
      raise BowlingError unless (@frames[10]&.tab != :strike && @frames[10]&.throws&.size == 2) ||
                                (@frames[10]&.tab == :strike && @frames[11]&.throws&.size == 1)
    end

    true
  end
end
