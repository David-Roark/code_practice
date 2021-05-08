class Atbash
  AP = [*'a'..'z']
  En_hash = AP.zip(AP.reverse).to_h

  def self.encode(text)
    resutl = ''
    i = 0

    text.downcase.each_char { |chr|
      if /[a-z0-9]/ =~ chr
        i += 1
        resutl += En_hash[chr] || chr
        if i % 5 == 0
          resutl += ' '
          i = 0
        end
      else
        c = ''
      end
    }

    resutl.chomp(' ')
  end

  def self.decode(text)
    text.delete(' ').gsub(/[a-z]/, En_hash.invert)
  end
end
p Atbash.encode('plaintext')
