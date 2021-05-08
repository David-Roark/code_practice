class CircularBuffer
  class BufferEmptyException < ArgumentError
  end

  class BufferFullException < NoMemoryError
  end

  def initialize(size)
    @buffer = Array.new(size)
  end

  def write(value)
    i = @buffer.index(nil)
    raise CircularBuffer::BufferFullException unless i
    @buffer[i] = value

    self
  end

  def write!(value)
    return write(value) if @buffer.index(nil)
    @buffer[0] = value
    @buffer.rotate!

    self
  end

  def read
    raise CircularBuffer::BufferEmptyException unless @buffer[0]
    result = @buffer[0]
    @buffer[0] = nil
    @buffer.rotate!

    result
  end

  def clear
    @buffer = Array.new(@buffer.size)
    self
  end
end
