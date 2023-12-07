input = File.open("./example.txt").read.split("\n")

class Number
    attr_reader :coordinates
    def initialize (coordinates)
        @coordinates = coordinates
    end
    def to_s
        # Map coordinates to a string coordinates.map.to_s""
    end
end

numbers = []

# Find the numbers in the input, identify its coordinates
input.each.with_index do | row, index |
    number_coords = []
    row.each_char.with_index do | digit, pos |
        if digit.match (/\d/)
            x = pos
            y = index
            number_coords.push [x,y]
            pp "#{x},#{y}"
        end
    end

    numbers.push Number.new(number_coords)



    part_numbers = row.scan(/(\d+)/).flatten
    # pp part_numbers

end

# For each number, check whether it's next to a symbol
# Note: Only count each number once

    #what's the index of the number

    # +1x

    # +1y

    # -1x

    # -1y





# For each number next to a symbol, add it to the total



puts
puts numbers
