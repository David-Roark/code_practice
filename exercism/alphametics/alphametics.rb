class Alphametics
  def self.solve(puzzle)
    result = {}
    list_chars = puzzle.scan(/[A-Z]/).uniq

    # the method #permutation:
    # [1,2,3].permutation(3).to_a
    # => [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

    [*0..9].permutation(list_chars.size) do |list_nums|
      r = list_chars.zip(list_nums).to_h

      if Alphametics.match?(r, puzzle)
        result = r
        break
      end
    end

    return result
  end

  def self.match?(hash, puzzle)
    regex = hash.keys.join
    tr = puzzle.gsub(/[#{regex}]/, hash)
    return false if tr =~ /\b0+([1-9])/

    eval(tr)
  end
end
