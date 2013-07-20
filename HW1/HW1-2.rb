class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end
  
def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length == 2
    s0 = game[0][1].upcase
    s1 = game[1][1].upcase
    raise NoSuchStrategyError unless ["R", "S", "P"].include? s0
    raise NoSuchStrategyError unless ["R", "S", "P"].include? s1
    if ( s0 == s1) 
        return game[0]
    end
    if (s0 == "R")
        return (s1 == "S" ? game[0] : game[1])
    elsif (s0 == "S") 
        return (s1 == "P" ? game[0] : game[1])
    else
        return (s1 == "R" ? game[0] : game[1])
    end
end
 
puts rps_game_winner([ ["Armando", "P"], ["Dave", "S"] ])
 
def rps_tournament_winner(tournament)
   s0 = tournament[0][1]
   if (s0.is_a? String) 
      return rps_game_winner(tournament)
   else
      return rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
   end
end
puts rps_tournament_winner([
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
])
