class Array
  def keep
    arr = []
    self.each { |e| arr << e if yield(e) }

    arr
  end

  def discard
    arr = []
    self.each { |e| arr << e unless yield(e) }

    arr
  end
end
