class OcrNumbers
  STORE = {
    ["   ", "  |", "  |", "   "] => '1',
    [" _ ", " _|", "|_ ", "   "] => '2',
    [" _ ", " _|", " _|", "   "] => '3',
    ["   ", "|_|", "  |", "   "] => '4',
    [" _ ", "|_ ", " _|", "   "] => '5',
    [" _ ", "|_ ", "|_|", "   "] => '6',
    [" _ ", "  |", "  |", "   "] => '7',
    [" _ ", "|_|", "|_|", "   "] => '8',
    [" _ ", "|_|", " _|", "   "] => '9',
    [" _ ", "| |", "|_|", "   "] => '0'
  }

  def self.convert(input)
    # split multi lines
    # special test 111,111,456,789 was pass!!
    lines = input.gsub(/(\n         \n)(         \n)?/, '\1CUT_AT_HERE\2')
                 .split("CUT_AT_HERE")

    lines.map { |line| OcrNumbers.convert_line(line) } .join(',')
  end

  def self.convert_line(line)
    arr = line.split("\n")
    # raise ERROR if can't split by 3 chars
    raise ArgumentError unless arr.all? { |x| x.size % 3 == 0 }

    arr.map { |row| row.scan(/.{3}/) }
       .transpose
       .map { |n| OcrNumbers.convert_num(n) }
       .join
  end

  def self.convert_num(n)
    raise ArgumentError unless n.size == 4
    STORE.fetch(n, '?')
  end
end
