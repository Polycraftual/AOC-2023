#Take the input and make a new item in an array that is separate for each line of input
input = File.open("./input.txt").read.split("\n")

lines_without_letters = []

# For each item in the array strip out the non-digit characters and push that to the array as a combined string
input.each_with_index do |input_numerical, index|
    line = input_numerical.scan(/(\d+)/)
    lines_without_letters.push(line.join(""))
end

values = []

# For each item of the new array, take the first and last character and save it to a new array as a combined integer
lines_without_letters.each do |line|
    firstNo = line.split("").first
    lastNo = line.split("").last
    values.push("#{firstNo}#{lastNo}".to_i)
end

# Add up all the items in the new array
puts values.sum