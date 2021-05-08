class Board

  def initialize(board)
    @b = board
    @x = board[0].size
    @y = board.size
  end

  def num_bomb(y, x)
    n_bomb = [
              cell(y-1, x-1), cell(y-1, x), cell(y-1, x+1),
              cell(y, x-1),                cell(y, x+1),
              cell(y+1, x-1), cell(y+1, x), cell(y+1, x+1)
            ].count('*')

    n_bomb == 0 ? ' ' : n_bomb
  end

  def cell(y, x)
    @b[y][x]
  end

  def self.transform(inp)
    raise ArgumentError unless valid?(inp)
    board = new(inp)
    inp.map(&:chars)
       .map.with_index { |row, i|
         row.map.with_index { |cell, j| cell == ' ' ? board.num_bomb(i, j) : cell }
       }
       .map(&:join)
  end

  def self.valid?(inp)
    s = inp[0].size
    # same length
    return false unless inp.all? { |e| e.size == s }
    # faulty border
    return false unless /\A\+\-+\+\z/ =~ inp[0] && /\A\+\-+\+\z/ =~ inp[-1]
    return false unless inp[1...-1].all? { |e| e.match?(/\A\|( *\**)*\|\z/) }
    true
  end
end
