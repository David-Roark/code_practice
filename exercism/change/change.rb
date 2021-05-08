class Change

  class ImpossibleCombinationError < ArgumentError
  end
  class NegativeTargetError < ArgumentError
  end

  def self.generate(coins, change)
    return [] if change == 0
    raise Change::NegativeTargetError if change < 0
    raise Change::ImpossibleCombinationError if change < coins.min

    pos_coins = coins.select { |c| c <= change } .sort { |a, b| b <=> a }
    result = []
    max_size_coins = (change/(pos_coins.min)).ceil
    # 'pos_coins' is sort from bigest to smallest
    # variable 't' will be number of coins to be given to a customer
    # 't' will grow up from 1
    # => return 'result' at 't' when 'sum of coins' equal 'change'
    for t in (1..max_size_coins)
      pos_coins.repeated_combination(t) { |e|
        return e.sort if e.sum == change
       }
    end
    raise Change::ImpossibleCombinationError if result == []
  end
end
