class Allergies
  LIST_AL = %w(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats).freeze

  attr_reader :list
  def initialize(score)
    score = score % 256
    @list = score.to_s(2).reverse.chars
                 .zip(LIST_AL)
                 .map { |sc, name| name if sc == '1' && name }
                 .compact
  end

  def allergic_to?(name)
    @list.include? name.downcase
  end
end
