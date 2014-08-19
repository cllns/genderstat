class Calculator
  def initialize text
    @total_word_count = text.count
  end

  def get_percent some_word_count
    (some_word_count.to_f / @total_word_count.to_f) * 100
  end

end
