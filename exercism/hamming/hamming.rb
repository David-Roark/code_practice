=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end
class Hamming

  def self.compute(adn1, adn2)
    raise ArgumentError if adn1.size != adn2.size

    adn2.chars.zip(adn1.chars).count { |x| x[0] != x[1] }
  end

end