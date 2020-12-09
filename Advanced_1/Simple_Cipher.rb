class Cipher
  attr_reader :key

  ALPHABET = ('a'..'z').to_a * 2

  def initialize(key = random_key)
    # raise ArgumentError if !ALPHABET.include?(key[0])
    if key.chars.any? { |char| char == char.upcase } || key.empty?
      raise ArgumentError
    end

    @key = key
  end

  def random_key
    random_key = ''

    10.times do
      random_key << ALPHABET[rand(26)]
    end

    random_key
  end

  def index_num(position)
    ALPHABET.index(position)
  end

  def encode(text)
    encoded_string = ''
    index = 0

    text.chars.each do |char|
      encoded_string << ALPHABET[index_num(@key[index]) + index_num(char)]
      index += 1
    end
    encoded_string
  end

  def decode(text)
    decoded_string = ''
    index = 0

    text.chars.each do |char|
      decoded_string << ALPHABET[index_num(char) - index_num(@key[index])]
      index += 1
    end
    decoded_string
  end
end
