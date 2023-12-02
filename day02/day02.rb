input = File.open("./input.txt").read.split("\n")

red = "red"
green = "green"
blue = "blue"

games = []

input.each do | selection |
    
    cubes = []
    
    game = {}

    find_game_no = selection.split(":")
    
    if find_game_no[0].match(/(\d+)/)
        number = find_game_no[0].scan(/\d+/)[0]
        game[:game_no] = number.to_i
    end

    r = 0
    g = 0
    b = 0

    hands = find_game_no[1].split(";")

    hands.each do | hand |
        
        shown_cubes = hand.split(",")
        
        shown_cubes.each do | colour |

            if (colour.include? red) && (colour.scan(/\d+/)[0].to_i>r)
                r = colour.scan(/\d+/)[0].to_i
            end

            if (colour.include? green) && (colour.scan(/\d+/)[0].to_i>g)
                g = colour.scan(/\d+/)[0].to_i
            end

            if (colour.include? blue) && (colour.scan(/\d+/)[0].to_i>b)
                b = colour.scan(/\d+/)[0].to_i
            end

        end

    end

    game[:red] = r
    game[:green] = g
    game[:blue] = b

    games.push game

    # 

    # cubes.push shown_cubes
end

cubes_available = {
    red => 12,
    green => 13,
    blue => 14
}

feasible_games = []

games.each do | feasibility_check |

    if (feasibility_check[:red]<= cubes_available[red]) && (feasibility_check[:green]<= cubes_available[green]) && (feasibility_check[:blue]<= cubes_available[blue])
        feasible_games.push feasibility_check[:game_no]
    end
end

puts feasible_games.sum

# Don't forget Ruby uses 0 index, not 1!
# { game_no: 0, red: 0, green: 0, blue: 0 }