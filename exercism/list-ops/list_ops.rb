class ListOps
  def self.arrays(arr)
    s = 0
    arr.each { |n| s += 1 }
    s
  end

  def self.reverser(arr)
    result = []
    arr.each { |n| result = [n] + result }
    result
  end

  def self.concatter(arr1, arr2)
    arr1 += arr2
  end

  def self.mapper(arr)
    result = []
    if block_given?
      arr.each do |x|
        n = yield(x)
        result << n
      end
    end

    result
  end

  def self.filterer(arr, &method)
    result = []
    if method
      arr.each { |x|
        result << x if yield(x)
      }
    else
      return arr
    end

    result
  end

  def self.sum_reducer(arr)
    sum = 0
    arr.each { |n| sum += n }
    sum
  end

  def self.factorial_reducer(arr)
    fac = 1
    arr.each { |n| fac *= n }
    fac
  end
end
