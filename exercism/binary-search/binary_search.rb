class BinarySearch
  def initialize(arr)
    @arr = arr
    @size = arr.size
  end

  def search_for(i_start = 0, i_end = @size - 1, data)
    i = i_start
    j = i_end
    x = (i + j) / 2
    return i if @arr[i] == data
    return x if @arr[x] == data
    return nil if i >= j

    data < @arr[x] ? search_for(i+1, x-1, data) : search_for(x+1, j, data)

  end
end
