class Triangle
  attr_reader :rows

  def initialize(n)
    @rows = build(n)
  end

  private
  def build(n)
    store = []
    Array.new(n) do |i|
      store = Array.new(i+1) do |j|
                (j == 0 || j == i) ? 1 : store[j-1] + store[j]
              end
    end
  end

end
