# OOP
class Dominoes
  attr_accessor :head, :tail

  def initialize(domi)
    @head, @tail = domi
  end

  def self.chain?(ds)
    return true if ds == []
    return ds[0][0] == ds[0][1] if ds.size == 1
    ds.permutation{ |d| return true if can_linked?(d) }

    false
  end

# if all dominoes can link,
# the last 'domi' will be [x, x] like [1,1], [2,2],...
# else return false
  def self.can_linked?(dominoes)
    domi = new(dominoes[0])

    dominoes[1..-1].each do |d|
      linked_domi = domi.link(d)

      if linked_domi
        domi = linked_domi
      else
        return false
      end
    end

    domi.head == domi.tail
  end

# if two dominoes (can link) is [1,2], [3,2] => [1,3]
# if two dominoes (can't link) is [1,2], [5,6] => false
  def link(domi)
    domi = Dominoes.new(domi)

    if self.tail == domi.head
      self.tail = domi.tail
    elsif self.tail == domi.tail
      self.tail = domi.head
    else
      return false
    end

    self
  end
end
