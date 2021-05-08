class Crypto

  def initialize(text)
    @text = text.downcase.gsub(/[^a-z0-9]/i, '')
  end

  def ciphertext
    return '' if @text == ''

    r = Math::sqrt(@text.size).round
    c = @text.size.fdiv(r).ceil
    arr = @text.scan(/.{#{c}}|.+/)
    arr[-1] = arr[-1].ljust(c, ' ')

    arr.map { |s| s.chars }.transpose.map(&:join).join(' ')
  end

end
