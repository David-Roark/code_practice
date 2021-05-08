class Brackets
  BRACKETS = {
    '(' => ')',
    '[' => ']',
    '{' => '}'
  }.freeze

  def self.paired?(str)
    open_brackets = BRACKETS.keys
    close_brackets = BRACKETS.values
    lists_b = []

    str.each_char do |b|
      if open_brackets.include? b
        lists_b << BRACKETS[b]
      elsif close_brackets.include? b
        return false unless lists_b.pop == b
      else
        next
      end
    end

    lists_b.empty?
  end
end
