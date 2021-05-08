class Element
  attr_accessor :data, :next

  def initialize(data = nil)
    @data = data
    @next = nil
  end
end

class Deque
  def initialize
    @root = Element.new
  end

  def push(value)
    if @root.data.nil? && @root.next.nil?
      @root = Element.new(value)
      return self
    end

    e = @root

    while e
     if e.next.nil?
       e.next = Element.new(value)
       break
     else
       e = e.next
     end
    end
    self
  end

  def pop
    pre_e = @root
    e = pre_e.next
    result = pre_e.data

    if e == nil
      pre_e.data = nil
      return result
    end

    while e
     if e.next.nil?
       result = e.data
       pre_e.next = nil
       return result
     else
       pre_e = e
       e = e.next
     end
    end
  end

  def shift
    result = @root.data

    if @root.data && @root.next.nil?
      @root.data = nil
      return result
    end

    e = @root.next
    @root = e

    result
  end

  def unshift(value)
    if @root.data.nil? && @root.next.nil?
      @root.data = value
      return self
    end

    e = Element.new(value)
    e.next = @root
    @root = e

    self
  end
end
p deque = Deque.new
p deque.unshift(10)
p deque.shift
p deque
p deque.unshift(20)
p deque
