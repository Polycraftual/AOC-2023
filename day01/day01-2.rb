#Take the input and make a new item in an array that is separate for each line of input
input = File.open("./example2.txt").read.split("\n")

numbers = {
"one" => 1,
"two" => 2,
"three" => 3,
"four" => 4,
"five" => 5,
"six" => 6,
"seven" => 7,
"eight" => 8,
"nine" => 9,
}

lines_without_letters = []

# For each item in the array strip out the non-digit characters and push that to the array as a combined string
input.each_with_index do |input_numerical, index|
    puts ""
    first_digit = 0
    last_digit = 0
    temp_string = ""
    
    input_numerical.each_char do |line|
        if line.match(/(\d+)/)
            first_digit = line.to_i
            break
        else
            temp_string = temp_string+line
            numbers.each do |number_as_word, number_as_digit|
                if temp_string.include? number_as_word
                    first_digit = numbers[number_as_word]
                end
            end
            if first_digit > 0
            break
            end
        end
    end

    input_numerical.reverse.each_char do |line|
        if line.match(/(\d+)/)
            last_digit = line.to_i
            break
        else
            temp_string = temp_string+line
            numbers.each do |number_as_word, number_as_digit|
                if temp_string.reverse.include? number_as_word
                    last_digit = numbers[number_as_word]
                end
            end
            if last_digit > 0
            break
            end
        end
    end

    puts input_numerical
    puts "#{first_digit}#{last_digit}"
    
    lines_without_letters.push "#{first_digit}#{last_digit}".to_i
end

# puts lines_without_letters

puts lines_without_letters.sum

# values = []

# # For each item of the new array, take the first and last character and save it to a new array as a combined integer
# lines_without_letters.each do |line|
#     firstNo = line.split("").first
#     lastNo = line.split("").last
#     values.push("#{firstNo}#{lastNo}".to_i)
# end

# # Add up all the items in the new array
# #puts values.sum