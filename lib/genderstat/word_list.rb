require 'set'

class WordList
  attr_accessor :number_of_occurences

  def initialize filename
    @words = Set.new YAML.load_file filename
    @number_of_occurences = 0
  end

  def is_in_here? word_in_question
    @number_of_occurences += 1 if @words.include? word_in_question
  end
end
