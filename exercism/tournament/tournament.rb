class Tournament
  def self.tally(input)
    arr = input.scan(/(.+);(.+);(.+)$/)
    # arr = [team_name_1, team_name_2, result]
    h = Hash.new { |hash, key| hash[key] = [0,0,0,0,0] }
    # h = { team_name: [MP, W, D, L, P], ... }

    arr.each { |x|
      case x[-1]
      when 'win'
        #team win
        h[x[0]][0] += 1 # count MP
        h[x[0]][1] += 1 # count W
        h[x[0]][-1] += 3 # count W

        #team lost
        h[x[1]][0] += 1 # count MP
        h[x[1]][3] += 1 # count L

      when 'draw'
        #team draw
        h[x[0]][0] += 1 # count MP
        h[x[0]][2] += 1 # count D
        h[x[0]][-1] += 1 # count D
        #team draw
        h[x[1]][0] += 1 # count MP
        h[x[1]][2] += 1 # count D
        h[x[1]][-1] += 1 # count D

      when 'loss'
        #team lost
        h[x[0]][0] += 1 # count MP
        h[x[0]][3] += 1 # count L
        #team win
        h[x[1]][0] += 1 # count MP
        h[x[1]][1] += 1 # count W
        h[x[1]][-1] += 3 # count W
      end
    }

    # first sort is sort by team name, second sort is sort by point
    # Array h will be [[team_name, [MP, W, D, L, P]], ...]
    h = h.sort.sort { |t1, t2| t2[-1][-1] <=> t1[-1][-1]  } .to_h

    output = <<~TALLY
    Team                           | MP |  W |  D |  L |  P
    TALLY

    h.each { |team_name, arr_result|
      output << "#{team_name.ljust(31)}| #{arr_result[0].to_s.rjust(2)} | #{arr_result[1].to_s.rjust(2)} | #{arr_result[2].to_s.rjust(2)} | #{arr_result[3].to_s.rjust(2)} | #{arr_result[-1].to_s.rjust(2)}\n"
    }

    return output

  end
end
