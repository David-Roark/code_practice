=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end

class Raindrops
  SPEAK = { 3=> "Pling", 5=> 'Plang', 7=> 'Plong' }

  def self.convert(n)
    result = ''

    for i in [3, 5, 7] do 
      result += SPEAK[i] if n % i == 0
    end

    result == '' ? n.to_s : result
  end
end
