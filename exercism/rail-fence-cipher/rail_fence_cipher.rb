class RailFenceCipher
  def self.encode(msg, step)
    arr = msg.chars
    rail = Array.new(step) { |i| Array.new(arr.size) }
    y = [*0..step-1] + [*1..step-2].reverse

    arr.each_with_index do |char, i|
      rail[y[0]][i] = char
      y.rotate!
    end

    rail.map(&:join).join
  end

  def self.decode(code, step)
    size_msg = code.size
    msg = ''
    y = [*0..step-1] + [*1..step-2].reverse
    # initialize matrix box
    rail = Array.new(step) { |i| Array.new(size_msg) }

    # set up position of each chars of message
    y1 = y
    size_msg.times do |i|
      rail[y1[0]][i] = true
      y1 = y1.rotate
    end

    # replace chars into right positoin
    rail = rail.map do |e|
     msg_row = code.slice!(0,e.count(true))
     e.map { |el| el ? msg_row.slice!(0) : nil }
    end

    # read message follow zig-zag
    y2 = y
    size_msg.times do |i|
      msg += rail[y2[0]][i] || ''
      y2 = y2.rotate
    end

    msg
  end

end
