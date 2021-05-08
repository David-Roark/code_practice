=begin
Write your code for the 'Series' exercise in this file. Make the tests in
`series_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/series` directory.
=end

class Series
  def initialize(str)
    @str = str
  end

  def slices(num)
    raise ArgumentError if num > @str.size
    arr = []
    for i in 0..(@str.size - num) do
      arr << @str[i..(i + num - 1)]
    end

    return arr
  end
end
