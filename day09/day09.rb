input = File.open("./example.txt").read.split("\n")

lines = []

input.each_with_index do | row, index |
    lines.push row.split(" ")
end

rows =[]

lines.each do | y |
    rows.push y.map(&:to_i)
end

rows.each do | row |
    difference = []
    row.each_with_index do | number, index |
        if row[index+1] != nil
            diff = row[index+1] - number
            difference.push diff
            pp difference
        end
    end
end

# pp lines
# pp rows

