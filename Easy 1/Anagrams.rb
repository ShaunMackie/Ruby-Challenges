=begin

#Problem

- write a program that takes a word (string)
  and a list of possible anagrams(array of strings)
- the program selects the correct sublist of anagrams
  and stores them in an array and returns the array

#Input

- an array of strings

#Output

- an array

#Examples

# Rules + Questions

- ignore capitalization
- an anagram MUST be rearranged
  it cannot be in the same order as the comparision string
- if this was an interview, I would ask how to handle invalid inputs
- if no matching anagrams are found, return an empty array

#Algorithm

- write a program that takes a word and an array of possible anagrams
- the program selects the matching anagrams and returns them in an array

#ImplementationNotes

- create an Anagram class
- when instantiating a new object, it takes one argument, called given_word
- define an instance method called match
- match takes an array of strings as an argument
- init a var called anagrams and assign an empty array
- init a var called sorted_word and assign the value of given_word
  with no caps and sorted
- match checks the array to see if any are anagrams of given_word
  - iterate over the array
  - check to see if the current word does NOT match
    the given word in it's current form
    - then sort it to see if it matches the value of sorted word
    - if it does, add to anagrams array, else move to next word
  return anagrams array

=end

class Anagram
  def initialize(given_word)
    @given_word = given_word
  end

  def match(array)
    sorted_word = @given_word.downcase.chars.sort

    array.select do |word|
      word.downcase != @given_word && sorted_word == word.downcase.chars.sort
    end
  end
end
