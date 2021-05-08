class InvalidCodonError < ArgumentError
end

class Translation
  H = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP'
  } .freeze

  def self.of_codon(codon)
    H[codon]
  end

  def self.of_rna(strand)
    raise InvalidCodonError if /[^AUGC]/ =~ strand || strand.size % 3 != 0

    result = []
    strand.scan(/.{3}/).map { |e|
      return result if H[e] == 'STOP'
      result << H[e]
    }

    result
  end
end
