require 'set'

class WordCounter
  attr_reader :counter

  def initialize filename
    @words = Set.new YAML.load_file filename
    @counter = 0
  end

  def is_in_here? word_in_question
    @counter += 1 if @words.include? word_in_question
  end
end
