
#! /usr/bin/ruby
# A program to determine how "masculine" a piece of writing is.
# Sean Collins 11/11/12

require 'yaml'
require 'genderstat/text_reader'
require 'genderstat/word_counter'


class Genderstat
  def initialize arg
    @mas_words = WordCounter.new 'masculine_words.yaml'
    @fem_words = WordCounter.new 'feminine_words.yaml'

    @all_words = TextReader.new(arg).read

    @all_words.each { |word|
      @mas_words.is_in_here?(word)
      @fem_words.is_in_here?(word)
    }

    print_results
  end

  def print_results
    puts
    puts "total words:     #{@all_words.count.to_s}"
    puts "masculine words: #{@mas_words.counter.to_s}"
    puts "feminine words:  #{@fem_words.counter.to_s}"
    puts
    puts "masculine words: #{@mas_words.get_percent @all_words.count}%"
    puts "feminine words:  #{@fem_words.get_percent @all_words.count}%"

    # cast to float to allow for infinity
    rat_m_to_f = @mas_words.get_relative_frequency @fem_words.counter
    # Yes of course I could just use the inverse of rat_m_to_f but why bother?
    rat_f_to_m = @fem_words.get_relative_frequency @mas_words.counter

    if rat_m_to_f > 1
      puts "#{rat_m_to_f} times as many masculine words as feminine words"
    elsif rat_f_to_m > 1
      puts "#{rat_f_to_m} times as many feminine words are masculine words"
    else
      puts "Same number of masculine and feminine words"
    end
  end
end
