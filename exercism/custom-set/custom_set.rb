class CustomSet
  attr_reader :values

  def initialize(values)
    @values = values.uniq.sort
  end

  def empty?
    @values.size == 0
  end

  def member?(e)
    @values.include?(e)
  end

  def subset?(oth)
    @values == (@values & oth.values)
  end

  def disjoint?(oth)
    (@values & oth.values).empty?
  end

  def ==(oth)
    @values == oth.values
  end

  def add(value)
    return self if @values.include?(value)
    @values.push(value).sort!
    self
  end

  def intersection(oth)
    CustomSet.new(@values & oth.values)
  end

  def difference(oth)
    CustomSet.new(@values - oth.values)
  end

  def union(oth)
    CustomSet.new(@values + oth.values)
  end
end
