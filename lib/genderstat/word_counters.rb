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
      "masculine" => @mas_words.count,
      "feminine" => @fem_words.count
    }
  end

  def get_percentages total_word_count
    {
      "masculine" => round( 100 * (@mas_words.count / total_word_count) ),
      "femininee" => round( 100 * (@fem_words.count / total_word_count) ),
    }
  end

  def get_ratios
    {
      "masculine_to_feminine" => round( @mas_words.count / @fem_words.count)
    }
  end

  def round float
    float.round(2)
  end

end
