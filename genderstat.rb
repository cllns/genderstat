#! /usr/bin/ruby
# A program to determine how "masculine" a piece of writing is.
# Sean Collins 11/11/12

require 'open-uri'
require 'readability'
require 'set'

if ARGV.length != 1
  abort("Usage: genderstat [FILE] or genderstat [URL]")
end

arg = ARGV[0]

if File.exist?(arg)
  puts "reading in file: " + arg
  text = IO.read(arg)
else
  if arg[0,7] != "http://"
    arg = "http://" + arg
  end
  puts "reading in website: " + arg
  text = open(arg).read
end


mas_words = Set.new ["he", "him", "his", "he's", "himself", "man", "dude", "boy", "mankind", "men", "dudes"]
fem_words = Set.new ["she", "her", "hers", "she's", "herself", "woman", "lady", "girl", "womankind", "women", "ladies"]
neu_words = Set.new ["it", "its", "itself", "it's", "humankind", "they"]

all_words = text.downcase.split(" ")

num_mas_words = 0
num_fem_words = 0
num_neu_words = 0
num_other_words = 0

all_words.each { |word|
  if mas_words.include?(word)
    num_mas_words+=1
  elsif fem_words.include?(word)
    num_fem_words+=1
  elsif neu_words.include?(word)
    num_neu_words+=1
  else
    num_other_words+=1
  end
}

# calculate percentages
per_mas_words = ((num_mas_words.to_f / all_words.length.to_f) * 100)
per_fem_words = ((num_fem_words.to_f / all_words.length.to_f) * 100)
per_neu_words = ((num_neu_words.to_f / all_words.length.to_f) * 100)

# cast to float to allow for infinity
rat_m_to_f = num_mas_words.to_f / num_fem_words
# Yes of course I could just use the inverse of rat_m_to_f but why bother?
rat_f_to_m = num_fem_words.to_f / num_mas_words

#clean up the floats. no one cares about more than a couple decimal digits"
per_mas_words_str = sprintf('%.02f', per_mas_words) + "%"
per_fem_words_str = sprintf('%.02f', per_fem_words) + "%"
per_neu_words_str = sprintf('%.02f', per_neu_words) + "%"
rat_m_to_f_str = sprintf('%.02f', rat_m_to_f) 
rat_f_to_m_str = sprintf('%.02f', rat_f_to_m) 

puts
puts "total words:     " + all_words.length.to_s
puts "masculine words: " + num_mas_words.to_s
puts "feminine words:  " + num_fem_words.to_s
puts "neutral words:   " + num_neu_words.to_s
puts
puts "masculine words: " + per_mas_words_str
puts "feminine words: " + per_fem_words_str
puts "neutral words: " + per_neu_words_str

if rat_m_to_f > 1
  puts rat_m_to_f_str + " times as many masculine words as feminine words"
elsif rat_f_to_m > 1
  puts rat_f_to_m_str + " times as many feminine words are masculine words"
else
  puts "Same number of masculine and feminine words"
end
