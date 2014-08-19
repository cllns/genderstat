require 'set'

class WordList
  def initialize filename
    @words = Set.new YAML.load_file filename
  end

  def is_in_here? word_in_question
    @words.include? word_in_question
  end
end
