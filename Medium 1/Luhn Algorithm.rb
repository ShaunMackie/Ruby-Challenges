=begin

#Problem

- Write a program that, given a number

    Can check if it is valid per the Luhn formula.
    Can return the checksum, or the remainder from using the Luhn method.
    Can add a check digit to make the number valid per the Luhn formula and return the original number plus that digit.

- I copy/pasted that from the problem page. 

#Input

- an integer

#Output

- a boolean or an integer - problems this complex, while I understand it and am confident I can code a solution, break my mental model for how PEDAC works
- for this problem specifically, it needs 4 methods, one that returns a boolean, an arrary, the checksum, and the check digit
- how should we write the output for that? seems to be a waste of time/overkill to do a pedac for each method :/

#Examples

# Rules + Questions

- how do we handle invalid inputs

#Algorithm 

Write a program that, given a number

    Can check if it is valid per the Luhn formula. This should treat, for example, "2323 2005 7766 3554" as valid.
    Can return the checksum, or the remainder from using the Luhn method.
    Can add a check digit to make the number valid per the Luhn formula and return the original number plus that digit.

- I can't tell if I'm being lazy with this problem. I understand it, but it would require so much writing to explain it
- should I be spending the time to write it out just for the sake of writing it out, if I already understand the problem?
- the one area of the PEDAC process that I won't ever skimp on is the implementation notes
  I write notes so I can follow them and so the code basically writes itself
  all this other stuff seems to be mainly to help understand the problem
  many times I need to go through all the steps just to udnerstand the problem
  but with this one and the last one I did, even though they're quite complex, feels unnecessary
- at the end of the day, my goal is that the code writes itself based on my implementation notes

# Implementation Notes 

- create a Luhn class
- define a constructor that takes one argument 'given_integer'

- define an instance method 'addends'
- iterate over the value of given_integer
- double every 2nd digit, starting from the check digit, which is the rightmost digit
- return the results in an array

- define an instance method 'checksum'
- return the sum of the return value of addends

- define an instance method 'valid?'
- return true if the last digit of the return value of checksum is 0
- else return false

- define an class method 'create' that takes an integer as an argument
- add a trailing 0 to the value of given_integer
- check to see if the new number is valid - need to have it's own valid method INSIDE this class method
- that means it's own version of checksum and addends as well
- if it is, return it
- if it isn't, add 1 to the check digit and try again
- repeat until the number is valid and return it

=end

class Luhn
  def initialize(given_integer)
    @given_integer = given_integer
  end

  def addends
    results = []
    @given_integer.to_s.chars.reverse.each_with_index do |num, idx|
      num = num.to_i * 2
      if idx.odd?
        num > 10 ? results << num - 9 : results << num
      else
        results << num / 2
      end
    end
    results.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum.to_s.split('')[-1] == '0'
  end

  def self.create(number)
    results = []
    temp_number = number * 10

    loop do
      temp_number.to_s.chars.reverse.each_with_index do |num, idx|
        num = num.to_i * 2
      if idx.odd?
        num > 10 ? results << num - 9 : results << num
      else
        results << num / 2
      end
      end
      break if results.sum.to_s.split('')[-1] == '0'
      temp_number += 1
      results = []
    end
    temp_number
  end
end

#got a working solution
#multiple Rubocop errors I couldn't figure out