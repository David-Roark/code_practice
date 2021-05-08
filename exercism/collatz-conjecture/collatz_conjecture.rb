class CollatzConjecture
  def self.steps(n)
    raise ArgumentError unless n > 0 && n.is_a?(Integer)
    step = 0
    
    while n > 1
      n.even? ? n = n / 2 : n = 3*n + 1
      step += 1
    end

    step
  end
end
