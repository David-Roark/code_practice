class Cipher
  attr_accessor :key

  def initialize(k = nil)
    valid?(k) if k
    @key = k || generate_key
  end

  def encode(pt)
    pt.chars.map.with_index { |c, i| (97 + ((c.ord + @key[i].ord - 97*2) % 26)).chr } .join
  end

  def decode(pt)
    pt.chars.map.with_index { |c, i| (97 + ((c.ord - @key[i].ord) % 26)).chr } .join
  end

  private
  def generate_key
    k = ''
    (100 + rand(200)).times { k += (97 + rand(26)).chr }

    k
  end

  def valid?(k)
    raise ArgumentError unless /\A[a-z]+\z/ =~ k
    true
  end
end
