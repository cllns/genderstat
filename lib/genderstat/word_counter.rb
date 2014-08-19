require './lib/genderstat/word_list'

class WordCounter
  attr_reader :counter

  def initialize filename
    @word_list = WordList.new filename
    @counter = 0
  end

  def is_in_here? word_in_question
    @counter += 1 if @word_list.contains? word_in_question
  end
end
