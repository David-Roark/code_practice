class BeerSong
  def self.recite(from, to)
    lyrics_x = ->(x) {
      "#{x} bottles of beer on the wall, #{x} bottles of beer.\nTake one down and pass it around, #{x-1} bottles of beer on the wall.\n\n"
    }

    lyrics_1 = "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n\n"

    lyrics_0 = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n\n"

    output = <<~TEXT
    TEXT

    from.downto(from - to + 1) do |n|
      return output.gsub(' 1 bottles ', ' 1 bottle ').gsub(' 0 bottles ', ' no more bottles ').chomp if n < 0
      case n
      when 0
        output << lyrics_0
      when 1
        output << lyrics_1
      else
        output << lyrics_s.call(n)
      end
    end

    output.gsub(' 1 bottles ', ' 1 bottle ').gsub(' 0 bottles ', ' no more bottles ').chomp
  end
end
