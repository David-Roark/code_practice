class Queens
  def initialize(white: [3, 0], black: [4,7])
    raise ArgumentError unless valid_pos?(white) && valid_pos?(black)

    @white = white
    @black = black
  end

  def attack?
    a = (@white[0] - @black[0]).abs
    b = (@white[1] - @black[1]).abs

    a == 0 || b == 0 || a == b
  end

  private

  def valid_pos?(pos)
    pos.all? { |e| (0..7).include? e }
  end

end
