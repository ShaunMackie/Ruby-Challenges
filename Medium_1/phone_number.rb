class PhoneNumber
  def initialize(phone_number)
    @phone_number = phone_number
  end

  def number
    invalid = '0000000000'
    clean_number = @phone_number.delete('^0-9')
    size = clean_number.size

    return invalid if number_contains_alpha_chars?
    return invalid if size > 11 || size < 10
    return invalid if size == 11 && clean_number[0] != '1'
    return clean_number[1..-1] if number_begins_with_one?(clean_number)
    clean_number
  end

  def number_contains_alpha_chars?
    @phone_number.delete('a-zA-Z') != @phone_number
  end

  def number_begins_with_one?(clean_number)
    clean_number[0] == '1' && clean_number.size == 11
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..-1]}"
  end
end
