class Proverb
  def initialize(*lists, qualifier: nil)
    @lists = lists
    @qualifier = ('' unless qualifier) || (qualifier + ' ')
  end

  def to_s
    result = []
    lyric = -> (a, b) {"For want of a #{a} the #{b} was lost.\n"}

    @lists.each_with_index do |n, i|
      if i == 0
        result << "And all for the want of a #{@qualifier}#{n}."
      elsif i == 1
        result.unshift(lyric.call(@lists[i-1], n))
      else
        result.insert(-2, lyric.call(@lists[i-1], n))
      end
    end

    result.join('')
  end

end
