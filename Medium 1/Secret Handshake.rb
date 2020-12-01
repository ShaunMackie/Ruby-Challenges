=begin

#Problem

- write a program that will take a decimal number and convert it to a binary number
- the program uses the binary number to match strings to form a secret handshake
- the 'secret handshake' is returned in the form of the strings stored in an array
- if the input is invalid, return an empty array

#Input

- an integer or a string

#Output

- an array

#Examples

# Rules + Questions

- if the input is not an integer or a string that can be converted to an integer, return an empty array
- if the binary number is over 10,000, subtract 10,000 and then reverse the order of the elements in the array

#Algorithm 

- write a program that will convert an integer to binary
  if the input is a string, first convert it to an integer
  if the string cannot be converted to an integer, return an empty array

- use the binary number to match up with keys from a hash
  when a number matches a key, store the value in an array
  if the binary number is over 10k, subtract 10k and reverse the order of the elements in the array

- easily the worst algorythm I've ever written this far into the course. I can't seem to wrap my head around the algo
  even though I feel like I can easily solve this problem.
  is it possible that i can fully understand the problem, without being able to write even a half decent algorythm?
  let's try to solve it and find out

# Implementation Notes 

create a SecretHandShake class
define a constructor that takes one argument - number

define an instance method commands
  init a results var and assign an empty array
  convert the value of the number ivar to binary and store in var binary
  
  
  use a conditional to match all the words
  return the array
  ?????game over????
=end

class SecretHandshake
  def initialize(number)
    @number = number
  end

  def commands
    results = []
    binary = @number.to_i.to_s(2)

    results << 'wink' if binary[-1] == '1'
    results << 'double blink' if binary[-2] == '1'
    results << 'close your eyes' if binary[-3] == '1'
    results << 'jump' if binary[-4] == '1'
    results.reverse! if binary[-5] == '1'
    results
  end
end
