class CircularBuffer
  attr_accessor :buffer

  attr_reader :buffer_slots

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(buffer_slots)
    @buffer_slots = buffer_slots
    @buffer = []
  end

  def read
    raise BufferEmptyException if buffer.empty?
    buffer.shift
  end

  def write(element)
    return if element.nil?
    raise BufferFullException if buffer.size == buffer_slots
    buffer << element
  end

  def clear
    self.buffer = []
  end

  def write!(element)
    return if element.nil?
    buffer.shift if buffer.size == buffer_slots
    buffer << element
  end
end
