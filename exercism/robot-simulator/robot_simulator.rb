class Robot
  DIREC = %i(north east south west).freeze

  def orient(direc)
    raise ArgumentError unless DIREC.index(direc)
    @orient = direc
  end

  def bearing
    @orient
  end

  def turn_right
    i_current = DIREC.index(@orient)
    @orient = DIREC[(i_current + 1)%4]
  end

  def turn_left
    i_current = DIREC.index(@orient)
    @orient = DIREC[(i_current - 1)%4]
  end

  def at(*coor)
    @coor = coor
  end

  def coordinates
    @coor
  end

  def advance
    x, y = @coor

    case @orient
    when :east
      x += 1
    when :south
      y -= 1
    when :west
      x -= 1
    when :north
      y += 1
    end

    @coor = [x, y]
  end
end

class Simulator
  INSTR = {
    'L' => :turn_left,
    'R' => :turn_right,
    'A' => :advance
  }.freeze
  
  def instructions(inp)
    result = []
    inp.each_char { |c| result << INSTR[c] }

    result
  end

  def place(obj, x: 0, y: 0, direction: :east)
    obj.at(x, y)
    obj.orient(direction)
  end

  def evaluate(obj, instr)
    instructions(instr).each { |ins| obj.method(ins).call }
  end
end
