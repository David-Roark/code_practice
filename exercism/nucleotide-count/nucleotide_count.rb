class Nucleotide

  def initialize(dna)
    if dna =~ /[^ATCG]/
      raise ArgumentError
    else
      @dna = dna
    end
  end

  def self.from_dna(dna)
    new(dna)
  end

  def count(nu)
    @dna.count(nu)
  end

  def histogram
    h = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
    h.keys.each { |nu| h[nu] = @dna.count(nu) }

    h
  end
end
