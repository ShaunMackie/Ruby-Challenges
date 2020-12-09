=begin

#Problem

- write a program that uses the Sieve of Eratosthenes to find all prime numbers from 2 up to a given number, including 2 and the given number

#Input

- an integer, which is stored in an instance variable as part of the state of the object that we're calling the instance method on

#Output

- an array

#Examples

# Rules + Questions

- you must use the Sieve of Eratosthenes
- you must include 2 in the return value
- you must include the given integer arguement in the return value, if it is prime
- the return value must be an array
- you must use an instance method

#Algorithm 

- write a program that uses the Sieve of Eratosthenes to find all prime numbers from 2 up to the given integer argument
- the program must return an array

# Implementation Notes 

- create a Sieve class
  - objects instantiated from this class take one argument upon instantiation
  - we'll store that argument in an instance variable called max_number
- create an instance method called primes that accesses the value stored in max_number
  - create an array called prime_array starting from 2 and ending at the value stored in max_number
  - init a counter variable and assign a value of zero
  - init a loop
  - inside of the loop, iterate over prime_array, removing any number that is a multiple of the number stored at prime_array[counter]
  - move to the next number and repeat by incrementing the counter by 1
  - break out of the loop when we've reached the last number
  - return the prime_array


=end

class Sieve
  def initialize(max_number)
    @max_number = max_number
  end

  def primes
    prime_array = (2..@max_number).to_a
    counter = 0

    loop do
      prime_array.each do |number|
        prime_array.delete(number) if number % prime_array[counter] == 0 && number != prime_array[counter]
      end
      counter += 1
      break if prime_array[counter] == prime_array[-1]
    end
    prime_array
  end
end

