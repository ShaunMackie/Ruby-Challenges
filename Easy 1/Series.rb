=begin

#Problem

- write an instance method that you call on an object
  when you call the instance method on the object, you're actually operating on a string that is stored in the state of the object
  this means that the 'slices' instance method must access the state of the object where the string is stored

- and outputs all possible consecutive number series of X size in that string, where X is the given argument
  the output must be an array of arrays

#Input

- a string of digits

#Output

- an array of arrays or an ArgumentError

#Examples

# Rules + Questions

- the program must output an array of nested arrays
- each consecutive number series is it's own array, inside of an array
- if the given integer argument is larger than the size of the string, return an ArgumentError
- the 'slice' instance method must be called on an object, so our slice method must access the state of the object when it is called

#Algorithm 

- define a function that takes an integer as an argument
- the function accesses a string of digits that is stored in the state of an object
- the function takes the string of digits and converts it to an integer
- it then returns an array containing all possible consecutive number series of length X, where X is the given integer argument
- each number series is it's own array

# Implementation Notes 

create a file called 'series'
define a Series class
  - define a constructor method that takes one argument: string_of_digits
  - use a getter, I think this will be easier for testing

define an instance method called 'slices'
- initialize a variable results and assign an empty array
- initialize a counter variable and assign a value of zero

- the IM takes an integer as an argument
- it accesses string_of_digits, which is the state of a Series object
  - initialize a variable 'digits' and the store string_to_digits string

- we need a guard clause at the beginning, where we return an ArgumentError if the given integer argument is greater than the size of the value of string_of_digits
- if the given argument is too big, raise ArugmentError, 'Some string' - the string may or may not be necessary

- initialize a loop
- slice off the first string from the value of counter to the given integer argument
- store the sliced off number in the results array after converting each digit to an integer
  - can we store the sliced number in a variable
  - then iterate over that value, converting each digit to an integer
  - store each integer in the results array - but will this create the nested arrays we need?

- increment the counter by 1
- break when the number is too big - how to do this?
  - could we break when counter + integer argument is greater than digits.size
- return the results array

- after I got a working solution, I refactored without notes, not sure if that's a bad habit or not, will ask in forums
=end

class Series
  attr_reader :string_of_digits
  
  def initialize(string_of_digits)
    @string_of_digits = string_of_digits
  end

  def slices(integer)
    results = []
    digits = self.string_of_digits
    counter = 0
    size_limit = digits.size
    sliced_strings = []

    raise ArgumentError, "Too darn big!" if integer > size_limit

    loop do
      sliced_strings << digits.slice(counter, integer)
      counter += 1
      break if counter + integer > size_limit
    end
    
    sliced_strings.each do |numbers|
      results << numbers.split('').map(&:to_i)
    end
    results
  end
end

class Series
  attr_reader :string_of_digits
  
  def initialize(string_of_digits)
    @string_of_digits = string_of_digits
  end

  def argument_error(integer)
    raise ArgumentError, "Too darn big!" if integer > self.string_of_digits.size
  end

  def sliced_strings(integer)
    counter = 0
    digits = self.string_of_digits
    sliced_strings = []

    loop do
      sliced_strings << digits.slice(counter, integer)
      counter += 1
      break if counter + integer > digits.size
    end
    sliced_strings
  end

  def slices(integer)
    results = []
    argument_error(integer)

    sliced_strings(integer).each do |numbers|
      results << numbers.split('').map(&:to_i)
    end
    results
  end
end

series = Series.new('012345')

p series.slices(3)
