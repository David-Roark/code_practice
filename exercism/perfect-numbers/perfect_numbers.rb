class PerfectNumber
  def self.classify(n)
    raise RuntimeError if n < 1
    i = [*1...n].select { |num| n % num == 0 } .inject(0, :+) <=> n

    %w(perfect abundant deficient)[i]
  end
end
