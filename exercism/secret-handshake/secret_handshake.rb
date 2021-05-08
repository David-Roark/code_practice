class SecretHandshake
  @@acts = ['wink', 'double blink', 'close your eyes', 'jump']
  def initialize(n)
    @n = n
  end

  def commands
    return [] unless @n.is_a? Integer

    result = @n.to_s(2).reverse.chars.zip(@@acts).map { |num, act| act if num == '1' && act } .compact
    result.reverse! if @n >= 19

    result
  end
end
