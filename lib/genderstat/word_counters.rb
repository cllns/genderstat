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

  # We get the ratios of counts among all word_lists
  # This returns a hash with keys that are named "name_to_other_name"
  # This loop does twice as much work as it needs to, since the ratios
  #  are reciprocals of one another, but oh well! It's only division.
  def get_ratios
    h = Hash.new
    @word_counters.each do |wc|
      # We skip over the ratio of name_to_name, since it'll always be one
      @other_word_counters = @word_counters - [wc]
      @other_word_counters.each do |other_wc|
        ratio = round(( wc.count.to_f / other_wc.count.to_f) )
        h["#{wc.name}_to_#{other_wc.name}"] = ratio
      end
    end
    h
  end

  def round float
    float.round(2)
  end

end
