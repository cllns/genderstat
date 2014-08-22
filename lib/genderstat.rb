
#! /usr/bin/ruby
# A program to determine how "masculine" a piece of writing is.
# Sean Collins 11/11/12

require 'yaml'
require 'genderstat/text_reader'
require 'genderstat/word_counters'


class Genderstat
  DECIMAL_DIGITS_OF_PRECISION = 2

  def initialize arg
    @word_counters = WordCounters.new
    @text_reader = TextReader.new arg
  end

  def calculate
    @all_words = @text_reader.read
    @all_words.each { |word| @word_counters.check(word) }
  end

  def print_all_results
    puts "total words: #{@all_words.count.to_s}"
    print_totals
    print_percentages
    print_ratios
  end

  def print_totals
    @word_counters.get_totals.each do |name, count|
      puts "#{name} words: #{count}"
    end
  end

  def print_percentages
    @word_counters.get_percentages(@all_words.count).each do |name, percentage|
      puts "#{name} words: #{percentage}%"
    end
  end

  def print_ratios
    @word_counters.get_ratios.each do |name, ratio|
      puts "The ratio of #{name.gsub("_", " ")} words is #{ratio}"
    end
  end
end
