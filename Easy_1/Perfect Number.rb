=begin

#Problem

- write a program that determines if a given number is perfect, abundant, or deficient

#Input

- an integer

#Output

- a string

#Examples

# Rules + Questions

Perfect: Sum of factors = number
Abundant: Sum of factors > number
Deficient: Sum of factors < number

return a Standard Error if the given integer argument is negative

#Algorithm 

- write a program that takes an integer and determines if the number is perfect, abundant, or deficient
  using the above rules, and returns a string saying what type of number it is.

# Implementation Notes 

- define a class called PerfectNumber
- define a class method classify that takes an integer argument
- return a standard error if the input is invalid
- find the sum of the factors of the integer argument
  - initialize a results var and assign an empty array (try select with no array in refactoring)
  - create a range from 1 to the given integer but dont include the given number
  - iterate over the range
  - save a number if dividing by the given integer argument has no remainder (not my best English)
  - sum the results array
  - use conditionals, since > and < didn't seem to work, to return the appropriate string (look for this to be a separate/primary method in refactoring)

=end

# class PerfectNumber
#   def self.classify(integer)
#     raise StandardError unless integer > 0

#     results = (1...integer).select do |num|
#       integer % num == 0
#     end.sum

#     return 'perfect' if results == integer
#     return 'abundant' if results > integer
#     return 'deficient' if results < integer
#   end
# end

class PerfectNumber
  def self.find_divisors(integer)
    raise StandardError unless integer > 0

    (1...integer).select do |num|
      integer % num == 0
    end.sum
  end

  def self.classify(integer)
    results = PerfectNumber.find_divisors(integer)

    return 'perfect' if results == integer
    return 'abundant' if results > integer
    return 'deficient' if results < integer
  end
end
