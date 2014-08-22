require 'genderstat/word_counter'

class WordCounters
  def initialize
    @word_counters = []
    Dir.glob("*_words.yaml").each do |filename|
      @word_counters << WordCounter.new(filename)
    end
  end


  def check word
    @word_counters.each { |wc| wc.is_in_here? word }
  end

  def get_totals
    # We could use inject/reduce here, but this is clearer, I think
    h = Hash.new
    @word_counters.each do |wc|
      h[wc.name] = wc.count
    end
    h
  end

  def get_percentages total_word_count
    # We could use inject/reduce here, but this is clearer, I think
    h = Hash.new
    @word_counters.each do |wc|
      h[wc.name] = round( 100 * (wc.count.to_f / total_word_count))
    end
    h
  end

  def get_ratios
    f = @word_counters[0] # f = first
    s = @word_counters[1] # s = second since there are only 2 right now
    {  "#{f.name}_to_#{s.name}" => round( ( f.count.to_f / s.count.to_f) ) }
  end

  def round float
    float.round(2)
  end

end
