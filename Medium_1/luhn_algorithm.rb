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
