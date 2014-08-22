
#! /usr/bin/ruby
# A program to determine how "masculine" a piece of writing is.
# Sean Collins 11/11/12

require 'yaml'
require 'genderstat/text_reader'
require 'genderstat/word_counters'


class Genderstat
  def initialize arg
    @word_counters = WordCounters.new

    @all_words = TextReader.new(arg).read

    @all_words.each { |word| @word_counters.check(word) }

    print_results
  end

  def print_results
    puts
    puts "total words: #{@all_words.count.to_s}"

    @word_counters.get_totals.each do |name, count|
      puts "#{name} words: #{count}"
    end

    puts

    @word_counters.get_percentages(@all_words.count).each do |name, percentage|
      puts "#{name} words: #{percentage}%"
    end


    rat_m_to_f = @word_counters.get_ratios["masculine_to_feminine"]
    rat_f_to_m = (1 / rat_m_to_f).round(2)


    if rat_m_to_f > 1
      puts "#{rat_m_to_f} times as many masculine words as feminine words"
    elsif rat_f_to_m > 1
      puts "#{rat_f_to_m} times as many feminine words are masculine words"
    else
      puts "Same number of masculine and feminine words"
    end
  end
end
