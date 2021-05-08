class PhoneNumber
  def self.clean(input)
    arr = input.scan(/[0-9]/).map(&:to_i)

    if arr[0] == 1 && arr.size == 11 && (2..9).include?(arr[1]) && (2..9).include?(arr[4])
      arr[1..-1].join
    elsif arr[0] != 1 && arr.size == 10 && (2..9).include?(arr[0]) && (2..9).include?(arr[3])
      arr.join
    else
      nil
    end

  end
end
