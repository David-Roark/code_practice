class Bob

  def self.hey(str)
    arr = str.chars

    if arr.all? { |c| c =~ /\s/ }
      'Fine. Be that way!'
    elsif arr[0..-2].all? { |e| e =~ /[A-Z]/ } && arr[-1] == '?'
      "Calm down, I know what I'm doing!"
    elsif arr.all? { |e| e =~ /[A-Z]/  }
      'Whoa, chill out!'
    elsif str[-1] == '?'
      'Sure.'
    else
     'Whatever.'
    end
  end
end
