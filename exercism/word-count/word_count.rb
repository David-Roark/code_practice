=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end
class Phrase
  def initialize(str)
    @str = str.downcase
  end

  def word_count
    l = {}
    @str.scan(/\w+(?:'\w+)*/).each { |w| l.include?(w) ? l[w] += 1 : l[w] = 1}
    l
  end
  # short way is use mehod #tally (ruby-2.7)
end
