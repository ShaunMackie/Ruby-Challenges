=begin

#Problem

- write a program that, given a string, compares each char in the given string
  with each char in another string, and returns an integer representing the number of chars that are NOT identical

#Input

- a string

#Output

- an integer

#Examples

# Rules + Questions

- if either the given string or the comparision string is longer than the other
  use the shorter string, and ignore the extra trailing chars
- if this was an interview, we'd ask how to handle invalid inputs
- we'd also ask if integers or other objects could be valid or should it only work for strings

#Algorithm 

- write a program that compares each character in two strings
  and returns an integer representing how many of the characters are different
- if one string is longer than the other, ignore the trailing characters of the larger string

# Implementation Notes 

create a class called DNA
- when you instantiate an object, have it take a string argument
  store in an instance variable called dna_sequence
- define an instance method called hamming_distance
  it takes one argument called given_sequence
-init a var called difference and assign a value of 0
- init an index var and assign a value of 0
- init a loop
- compare the first two chars
- increment the value of difference by 1 if the two chars are not identical
- increment the index var by 1
- break out of the loop if we hit a nil

- return difference var

=end

class DNA
  def initialize(dna_sequence)
    @dna_sequence = dna_sequence
  end

  def hamming_distance(given_sequence)
    difference = 0
    index = 0

    loop do
      break if @dna_sequence[index].nil? || given_sequence[index].nil?
      difference += 1 if @dna_sequence[index] != given_sequence[index]
      index += 1
    end
    difference
  end
end
