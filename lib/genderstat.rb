
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


    @word_counters.get_ratios.each do |name, ratio|
      puts "The ratio of #{name} words is #{ratio}."
    end
  end
end
