require 'set'
require 'genderstat/calculator'

class WordCounter
  include Calculator
  attr_reader :counter, :name

  def initialize filename
    @words = Set.new YAML.load_file filename
    @name = filename.split('_').first
    @counter = 0
  end

  def is_in_here? word_in_question
    @counter += 1 if @words.include? word_in_question
  end
end
