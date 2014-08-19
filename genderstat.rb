#! /usr/bin/ruby
# A program to determine how "masculine" a piece of writing is.
# Sean Collins 11/11/12

require 'yaml'
require './lib/genderstat/text_reader'
require './lib/genderstat/word_counter'
require './lib/genderstat/calculator'

if ARGV.length != 1
  abort("Usage: genderstat [FILE] or genderstat [URL]")
end

arg = ARGV[0]
all_words = TextReader.new(arg).read

@mas_words = WordCounter.new 'masculine_words.yaml'
@fem_words = WordCounter.new 'feminine_words.yaml'
@neu_words = WordCounter.new 'neutral_words.yaml'


all_words.each { |word|
  @mas_words.is_in_here?(word)
  @fem_words.is_in_here?(word)
  @neu_words.is_in_here?(word)
}

@calc = Calculator.new all_words

# calculate percentages
per_mas_words = @calc.get_percent @mas_words.counter
per_fem_words = @calc.get_percent @fem_words.counter
per_neu_words = @calc.get_percent @neu_words.counter

# cast to float to allow for infinity
rat_m_to_f = @mas_words.counter.to_f / @fem_words.counter
# Yes of course I could just use the inverse of rat_m_to_f but why bother?
rat_f_to_m = @fem_words.counter.to_f / @mas_words.counter

#clean up the floats. no one cares about more than a couple decimal digits"
per_mas_words_str = sprintf('%.02f', per_mas_words) + "%"
per_fem_words_str = sprintf('%.02f', per_fem_words) + "%"
per_neu_words_str = sprintf('%.02f', per_neu_words) + "%"
rat_m_to_f_str = sprintf('%.02f', rat_m_to_f)
rat_f_to_m_str = sprintf('%.02f', rat_f_to_m)

puts
puts "total words:     " + all_words.length.to_s
puts "masculine words: " + @mas_words.counter.to_s
puts "feminine words:  " + @fem_words.counter.to_s
puts "neutral words:   " + @neu_words.counter.to_s
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
