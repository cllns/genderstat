require 'set'

class WordCounter
  attr_reader :count, :name

  def initialize filename
    @words = Set.new YAML.load_file filename
    @name = filename.split('_').first
    @count = 0
  end

  def is_in_here? word_in_question
    @count += 1 if @words.include? word_in_question
  end
end
