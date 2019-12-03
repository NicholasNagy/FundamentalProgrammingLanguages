# File.open("test_1.txt").each{|line|
#     puts line if line = ~/make pancakes/
# }

passed_path = ARGV[0]
if (passed_path.nil?) #checking if the user sent an empty path
    abort("YOU DID NOT SPECIFY WHICH FILE YOU WANT")
else
    lines = File.readlines(passed_path)
end

lines_count = lines.length
lines_joined = lines.join #join return a string from the array lines

# Total characters of the file
char_text = lines_joined.gsub(/\s+/, "") #gsub to return a copy of the string and emitting whitespaces
total_char = char_text.length
puts "total characters #{total_char}"

words_count = lines_joined.split.length #split returns array of words fetched from the file (then we count the length of the array)
puts "word count #{words_count}"

sentences_count = lines_joined.split(/\.|\?|\!/).length #using split with regular expressions
puts "Sentence count #{sentences_count}"

paragraph_count = lines_joined.split(/\n\n/).length #using split with regular expression double spcaed (\n\n)
puts "paragraph count #{paragraph_count}"

page_count = lines_count/50 #divide by 50 and enter the if condition
if (page_count==0)
    page_count = 1
    puts "Page count #{page_count}" # because we only have one page
else 
    puts "Page count #{page_count}"
end

average_word_length = total_char.to_f/words_count #we used .to_f (to float)
puts "average words length #{average_word_length}"

average_sentence = words_count.to_f/sentences_count
puts "average sentence words length #{average_sentence}"

average_paragraph = sentences_count.to_f/paragraph_count
puts "average paragraph is #{average_paragraph}"

average_ppp = paragraph_count.to_f/page_count
puts "average paragraph per page is #{average_ppp}"

total_bytes = File.size(passed_path)
puts "total bytes is #{total_bytes}"

character_density = total_char.to_f/total_bytes
puts "Character density is #{character_density}"

