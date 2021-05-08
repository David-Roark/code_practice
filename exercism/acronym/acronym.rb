=begin
Write your code for the 'Acronym' exercise in this file. Make the tests in
`acronym_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/acronym` directory.
=end

class Acronym
  def self.abbreviate(str)
    acronym = ""
    words = str.gsub("-", " ").split(" ")

    words.each do |w|
      acronym += w[0]
    end

    acronym.upcase
    
  end
  
end