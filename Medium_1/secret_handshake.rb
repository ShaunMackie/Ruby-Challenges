class SecretHandshake
  def initialize(number)
    @number = number
  end

  def commands
    results = []
    binary = @number.to_i.to_s(2)

    results << 'wink' if binary[-1] == '1'
    results << 'double blink' if binary[-2] == '1'
    results << 'close your eyes' if binary[-3] == '1'
    results << 'jump' if binary[-4] == '1'
    results.reverse! if binary[-5] == '1'
    results
  end
end
