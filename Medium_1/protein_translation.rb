class InvalidCodonError < StandardError; end

class Translation
  CODONS = { 'AUG' => 'Methionine', 'UUU' => 'Phenylalanine',
             'UUC' => 'Phenylalanine',
             'UUA' => 'Leucine', 'UUG' => 'Leucine',
             'UCU' => 'Serine', 'UCC' => 'Serine',
             'UCA' => 'Serine', 'UCG' => 'Serine',
             'UAU' => 'Tyrosine', 'UAC' => 'Tyrosine',
             'UGU' => 'Cysteine', 'UGC' => 'Cysteine',
             'UGG' => 'Tryptophan',
             'UAA' => 'STOP', 'UAG' => 'STOP',
             'UGA' => 'STOP' }

  def self.of_codon(codon)
    CODONS[codon]
  end

  def self.convert_to_codons(strand)
    codon = []
    counter = 0

    (strand.length / 3).times do
      codon << strand[counter..counter + 2]
      counter += 3
    end

    codon
  end

  def self.of_rna(strand)
    results = []
    codon = Translation.convert_to_codons(strand)

    codon.each do |key|
      raise InvalidCodonError unless CODONS.key?(key)
      break if CODONS[key] == 'STOP'
      results << CODONS[key]
    end

    results
  end
end
