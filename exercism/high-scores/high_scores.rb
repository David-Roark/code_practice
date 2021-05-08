=begin
Write your code for the 'High Scores' exercise in this file. Make the tests in
`high_scores_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/high-scores` directory.
=end

class HighScores
  def initialize(s)
    @s = s
  end

  def scores
    @s
  end
  
  def latest
    @s.last
  end
  
  def personal_best
    @s.max
  end

  def personal_top_three
    @s.sort{ |a, b| b <=> a}.first(3)
    
  end
  
  def latest_is_personal_best?
    latest == personal_best
  end
  
  
  
end