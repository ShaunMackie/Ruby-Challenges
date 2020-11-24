=begin

#Problem

- write a program that will convert a trinary number represented by a string to it's decimal equivalent
- we're not allowed to use any existing methods etc

#Input

- a string

#Output

- an integer

#Examples

# Rules + Questions

- must do it manually; can't use any methods that perform the calculation for us
- return 0 if the input is invalid(contains non-digit chars)

#Algorithm 

- write a program that converts a trinary number(represented by a string) to it's decimal equivalent

# Implementation Notes 

- create a Trinary class, where objects instantiated from the class take one argument
- store the argument in an instance variable called trinary_string
- use a guard claus, return 0 if the input is invalid
  - return 0 if deleting all alphabetic chars changes the input string
- init a result var and assign a value of zero
- init a multiplier var and assign a value of the length of the string - 1

- convert the sting to an array of chars
- convert each char to an integer
- multiply the multiplier by 3 by the integer
- add the result to the result var total
- reduce the value of multiplier by 1
- return the result variable

=end

class Trinary
  def initialize(trinary_string)
    @trinary_string = trinary_string
  end

  def string_to_integers
    @trinary_string.chars.map do |char|
      char.to_i 
    end
  end

  def to_decimal
    return 0 if @trinary_string.delete('A-Za-z') != @trinary_string
    result = 0
    multiplier = @trinary_string.length - 1
    integers = string_to_integers

    integers.each do |num|
      result += num * 3 ** multiplier
      multiplier -= 1
    end
    result
  end
end
