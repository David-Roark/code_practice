class TwelveDays
  @@DAYS = %w(first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth)
  @@TAILS = [
    'twelve Drummers Drumming, ',
    'eleven Pipers Piping, ',
    'ten Lords-a-Leaping, ',
    'nine Ladies Dancing, ',
    'eight Maids-a-Milking, ',
    'seven Swans-a-Swimming, ',
    'six Geese-a-Laying, ',
    'five Gold Rings, ',
    'four Calling Birds, ',
    'three French Hens, ',
    'two Turtle Doves, ',
    'a Partridge in a Pear Tree.'
  ]

  def self.song
    lyrics = ''
    tail = ''

    @@DAYS.each_with_index do |day, i|
      if i == 0
        tail = @@TAILS[-1]
      elsif i == 1
        tail = @@TAILS[-2..-1].join('and ')
      else
        tail = @@TAILS[-i-1] + tail
      end

      lyrics += "On the #{day} day of Christmas my true love gave to me: #{tail}\n\n"
    end

    lyrics.chomp

  end
end
