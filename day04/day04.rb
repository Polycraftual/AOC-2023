input = File.open("./input.txt").read.split("\n")

winning_cards = []

input.each_with_index do | card, index |
    winning_nos, card_nos = card.gsub(/Card\s*(\d*):/,"").split("|")

    moo = winning_nos.split(" ")

    hey = moo.map do | number |
        number.to_i
    end

    moo2 = card_nos.split(" ")

    hey2 = moo2.map do | number |
        number.to_i
    end

    if hey2.any? { |item| hey.include?(item) }
        puts "moo"
    else
        puts "nope"
    end

    # Return a smaller array where the output returns "true"
    matches = hey2.select { |item| hey.include?(item) }.size

    puts matches
    winning_cards.push matches
#    pp winning_nos
#    pp card_nos

end

points = []

winning_cards.each do | number |
    if number == 0
        points.push 0
    elsif number == 1
        points.push 1
    else
        score = 2 ** (number-1)
        points.push score
    end
end


# pp winning_cards
pp points.sum