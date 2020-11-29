=begin

#Problem

- write a program that takes an integer argument as well as an optional set of 2 or 3 integers
- if no optional integers are given, default to 3 and 5
- the program finds the sum of all the multiples of the optional arguments(or 3 and 5) up to but NOT including the given integer argument
- 

#Input
- an integer and optionally 3 or 3 more integers

#Output

- an integer


#Examples

# Rules + Questions

- if no secondary arguments are given, default to 3 and 5
  - how do I write this if there's going to be 2 default but sometimes 3 are given? can we use 0 for the 3rd arg?
- don't include the given number in the total - so basically use n - 1 when finding the multiples

- if this was an interview, I would ask how I should handle negative numbers as well as invalid inputs

#Algorithm 

- write a program that, given an integer, finds the sum of all of the multiples of particular numbers up to but not including the given integer
- if no particular numbers are given, use 3 and 5
- return the sum

# Implementation Notes 

- create a class call SumOfMultiples
- create a class definition AND an instance method for this problem
- have the class method take an integer as an argument
    - initialize a final_sum variable and assign a value of 0
    - initialize a used numbers var and assign an empty array
    - create a range from 1 up to the given number
    - iterate over the range
    - if the current number * 3 is less than the given argument and the num * 3 isn't in the used_numbers array:
      - add that total to sum
      - add the sum to the used numbers array
    - repeat the above process for 5
    - return the sum var

- have the instance method take 3 arguments when an object is instantiated - have the 3rd IVAR default to 0
    - set up a constructor that takes 3 args, and the last arg defaults to zero
- duplicate the above method, except substitute 3 and 5 for the values in the iVARs and add a 3rd round of it
    - can break out and not bother repeating the third round if hte varo of the 3rd IVAR is zero
=end

class SumOfMultiples

  def initialize(first, second, third = 0)
    @first = first
    @second = second
    @third = third
  end

  def self.to(given_number)
    final_sum = 0
    used_numbers = []
    num1 = 3
    num2 = 5

    2.times do
      (1..given_number).each do |num|
        if num * num1 < given_number && !used_numbers.include?(num * num1)
          final_sum += num * num1
          used_numbers << num * num1
        end
      end
      num1 = num2
    end

    final_sum
  end

  def to(given_number)
    final_sum = 0
    used_numbers = []
    num1 = @first
    num2 = @second
    num3 = @third

    3.times do
      (1..given_number).each do |num|
        if num * num1 < given_number && !used_numbers.include?(num * num1)
          final_sum += num * num1
          used_numbers << num * num1
        end
      end
      num1 = num2
      num2 = num3
    end
    
    final_sum
  end
end
