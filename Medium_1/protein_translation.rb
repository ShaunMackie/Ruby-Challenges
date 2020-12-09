=begin

#Problem

- write a program that translates RNA sequences into proteins - the program takes a string and returns one or more strings
  the program takes a string
  the string it split into 3-character strings
  each 3-character string corresponds with a string object
  sometimes multiple 3-char strings correspond with the same string object

#Input

- a string

#Output

- a string or an array of strings

#Examples

# Rules + Questions

- if the string does not have a corresponding string object, return a custom InvalidCodonError
- if the 3-char string matches with STOP, the program terminates

#Algorithm 

- given a string, split it into 3-char string objects
- match each 3-char string object with it's corresponding string
  create a hash with 3-char strings as keys and the matching strings as values
- when one 3-char string is given, return the matching string
- when more than one 3-char string is given, return an array of all the matching strings
- I'm super tired right now, but even so I feel like this algo is better than the previous one I did, but still subpar at best
- but I get really tired after doing a few of these. Other option is to quit for the day, rather code tired than quit so here I am

# Implementation Notes 

- create a Translation class
- define a constant where 3-char codes are keys with the matching values
- define a 'of_codon' class method that takes a string argument
- return the value that matches the string/key

- define a 'of_rna' class method that takes a string
- convert the string to an array of 3-char keys
  init a codon array
  init a counter and assign a value of zero

- use a guard claus if first 3 chars of the string isn't a valid key, return an InvalidCodonError
- init a results var and assign an empty array
- iterate over the array of keys
- match each one to it's value and store in results var
- break out of the iteration when STOP is found
- return results var

=end

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
