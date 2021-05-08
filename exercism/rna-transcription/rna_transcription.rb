class Complement
def self.of_dna(str)
  str.gsub(/[GCTA]/, 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U')
end
end
