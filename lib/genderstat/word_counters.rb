require 'genderstat/word_counter'

class WordCounters
  def initialize
    @mas_words = WordCounter.new 'masculine_words.yaml'
    @fem_words = WordCounter.new 'feminine_words.yaml'
  end

  def check word
    @mas_words.is_in_here? word
    @fem_words.is_in_here? word
  end

  def get_totals
    {
      "masculine" => @mas_words.counter,
      "feminine" => @fem_words.counter
    }
  end

  def get_percentages total_word_count
    {
      "masculine" => @mas_words.get_percent(total_word_count),
      "feminine" => @fem_words.get_percent(total_word_count)
    }
  end

  def get_ratios
    {
      "masculine_to_feminine" => @mas_words.counter / @fem_words.counter
    }
  end

end
