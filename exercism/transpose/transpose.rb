class Transpose
  def self.transpose(iput)
    return '' if iput == ''

    arr = iput.split("\n")
    longest_line = arr.max_by { |x| x.size }

    i_ll = arr.index(longest_line)
    num_col = longest_line.size
    num_row = arr.size

    arr.map { |row| row.chars + Array.new(num_col - row.size) }
       .transpose
       .map { |arr_row|
         arr_row.map.with_index { |e, i| (e.nil? && arr_row[i..-1].all?(&:nil?)) ? '' : e || ' ' } .join
        }
       .join("\n")
=begin
    INPUT: "123\n12313\n1000"
    => 12: create like [
                        [1,2,3,nil,nil],
                        [1,2,3,  1,  3], <= longest line
                        [1,0,0,  0,nil]
                      ]
    => 13: transpose
                =>    [
                        [  1, 1,   1],
                        [  2, 2,   0],
                        [  3, 3,   0],
                        [nil, 1,   0],
                        [nil, 3, nil]
                      ]
    => 14-16: image after join
              replace nil by ' ' if it places before word,
              else replace by ''
    => 17: join
=end
  end
end
