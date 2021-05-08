class WordProblem
  H = {
    'plus' => '+',
    'minus' => '-',
    'multiplied by' => '*',
    'divided by' => '/'
  } .freeze

  def initialize(input)
    @question = input
  end

  def answer
    arr = @question.gsub(/plus|minus|multiplied by|divided by|What is |\?/, H).split(' ')
    arr[1..-1].inject(arr[0].to_i) do |result, x|
      if %w(+ - * /).include?(x)
        result.method(x)
      else
        raise ArgumentError unless /\A(\+|\-)?\d+\z/ =~ x
        result.call(x.to_i)
      end
    end
  end
end
p WordProblem.new("What is 17 minus 6 plus 3?").answer
