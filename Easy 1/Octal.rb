=begin

#Problem
 - create a program that can convert octal numbers to decimal numbers
 - manually impliment the conversion - don't use a shortcut

#Input

- a string of digit(s)

#Output

- an integer

#Examples

# Rules + Questions

- manually implement the conversion method


#Algorithm 

- create a program that converts a string of digits from octal numbers to decimal numbers
- manually implement the conversion


# Implementation Notes 

- create an octal class
- objects instantiated from the class should take one argument, stored in an instance variable called 'octal_string'
- define an instance method called 'to_decimal' that accesses the string object stored in octal string
- init a var called result and assign a value of zero
- init a var called multiplier and assign it the length of the array - 1
- convert the string to an array of inidividual integers and store in a var called integers
- use a guard claus and return zero if integers is not a valid integer
- use a guard claus where if the final digit is 8 or 9, it returns zero
- iterate over the integers array and convert each element to it's base 10 equilivent
- add the result of te converted integer to the value of result
- reduce the value of multiplier by 1
- return the result variable

=end

class Octal 
  attr_reader :octal_string
  def initialize(octal_string)
    @octal_string = octal_string
  end

  def to_decimal
    result = 0
    multiplier = octal_string.length - 1

    integers = octal_string.chars.map do |element|
      return 0 if element.to_i.to_s != element
      element.to_i 
    end
    
    return 0 if integers[-1] == 8 || integers[-1] == 9

    integers.each do |num|
      result += num*8**multiplier
      multiplier -= 1
    end
    result
  end
end

