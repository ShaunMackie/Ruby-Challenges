=begin

#Problem

- write a program that takes a string and returns a hash with the words as keys and the 
  number of times the word occurs as values

#Input

- a string

#Output

- a hash

#Examples

# Rules + Questions

- if this were an interview, how would we handle invalid inputs?
- 

#Algorithm 

- write a program that takes a phrase in the form of a string
- counts each word in the string
- and returns a hash with the words as keys and the counts as values

# Implementation Notes 

- create a Phrase class
- define a contructor that takes one argument - sentence
- define an instance method called word_count
  init a var hash and assign an empty hash
  init a var clean_sentence and assign the sentence with punctuation removed
  iterate over the stirng in sentence
  populate the hash with words as keys and counts as values
  return the hsah

=end

class Phrase
  def initialize(sentence)
    @sentence = sentence
  end

  def word_count
    hash = {}
    clean_sentence = @sentence.delete("^A-Za-z 1-9 ',").gsub(',', ' ')

    clean_sentence.downcase.split.each do |word|
      word = word[1..-2] if word[0] == "'" && word[-1] == "'"
      hash.key?(word) ? hash[word] += 1 : hash[word] = 1
    end
    hash
  end
end
