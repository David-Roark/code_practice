class Array

  def accumulate
    arr = []
    for i in self
      arr << yield(i)
    end

    arr
  end
end
