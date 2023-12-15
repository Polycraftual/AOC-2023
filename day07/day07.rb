input = File.open("./input.txt").read.split("\n")

card_order = ["2","3","4","5","6","7","8","9","T","J","Q","K","A"]

# winning_hands = {
#     five_kind => [5],
#     four_kind => [4,1],
#     full_house => [3,2],
#     three_kind => [3,1,1],
#     two_pair => [2,2,1],
#     one_pair => [2,1,1,1],
#     high_card => [1,1,1,1,1]
# }

# pp winning_hands

class Play 
    attr_accessor :hand, :bid, :tally

    def initialize(hand, bid, tally)
        self.hand = hand
        self.bid = bid
        self.tally = tally
    end
end

plays = []

input.each do | round |

    hand = round.split(" ")[0]
    bid = round.split(" ")[1].to_i
    tally = hand.split("").tally.sort_by do | card, count |
        -count
    end.to_h

    play = Play.new(hand, bid, tally) 
    plays.push play
end

# pp plays

sorted_plays = plays.sort_by do | play |

    [play.tally.values[0], play.tally.values[1], card_order.index(play.hand[0]),card_order.index(play.hand[1]), card_order.index(play.hand[2]), card_order.index(play.hand[3]), card_order.index(play.hand[4])]

end

puts
pp sorted_plays

winnings = sorted_plays.map.with_index do | play, index |
    play.bid * (index+1)
end

pp winnings.sum