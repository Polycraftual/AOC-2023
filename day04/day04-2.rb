input = File.open("./input.txt").read.split("\n")

winning_cards = {}

input.each_with_index do | card, index |
    winning_nos, card_nos = card.gsub(/Card\s*(\d*):/,"").split("|")

    win_array = winning_nos.split(" ").map do | number |
        number.to_i
    end

    card_array = card_nos.split(" ").map  do | number |
        number.to_i
    end

    # Return a smaller array where the output returns "true"
    matches = card_array.select { |item| win_array.include?(item) }.size

    if card_array.any? { |item| win_array.include?(item) }
        # puts "moo"
    else
        # puts "nope"
    end

    winning_cards[index] = [matches, 1]
    
    # puts matches
    # winning_cards.push matches
end

# pp winning_cards

winning_cards.each_with_index do | (card_no,counts), index |

    # pp counts

    match_count = counts[0]
    current_count = counts[1]
    
    current_count.times do | per_card |
        match_count.times do | loop_count |
            loops = loop_count+1
            # pp "#{index}, #{loops}"
            next_card_match_count = winning_cards[index+loops][0]
            next_card_count = winning_cards[index+loops][1]
            next_card_count = next_card_count+1
            winning_cards[index+loops] = [next_card_match_count,next_card_count]
        end
    end
end

# pp winning_cards
puts winning_cards.sum {|k,v| v.last }

# {card_no: [matches, current_count]}
# {Card 1: [4, 1]}
# {Card 2: [2, 2]}