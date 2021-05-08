class Matrix
  def initialize(input)
    @matrix = input.split("\n").map { |e| e.split.map(&:to_i)  }
  end

  def rows
    @matrix
  end

  def columns
    @matrix.transpose
  end

  def saddle_points
    result = []
    # maxtrix size(ms), max in rows(mr), min in columns(mc)
    ms = @matrix.size
    mr = rows.map { |e| e.max  }
    mc = columns.map { |e| e.min }

    for c in (0..ms-1) do
      for r in (0..ms-1) do
        result << [r, c] if @matrix[r][c] == mr[r] && @matrix[r][c] == mc[c]
      end
    end

    result
  end

end
