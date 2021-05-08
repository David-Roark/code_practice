class Element
  attr_accessor :next, :datum

  def initialize(data = nil)
    @datum = data
    @next = nil
  end

  def ==(other)
    return false unless other.is_a? Element
    
    @datum == other.datum
  end
end

class SimpleLinkedList
  attr_accessor :root

  def initialize(data=[])
    data = data.to_a if data.is_a? Range

    if data == []
      @root = nil
    else
      e = Element.new(data[0])
      data[1..-1].each { |d|
        el = Element.new(d)
        el.next = e
        e = el
      }
      @root = e
    end
  end

  def push(e)
    if @root == nil
      @root = e
    else
      e.next = @root
      @root = e
    end

    self
  end

  def pop
    return nil unless @root
    data = @root.datum
    @root = @root.next

    Element.new(data)
  end

  def to_a
    result = []
    e = @root
    while e
      result << e.datum
      e = e.next
    end

    result
  end

  def reverse!
    @root = SimpleLinkedList.new(self.to_a).root

    self
  end

end
