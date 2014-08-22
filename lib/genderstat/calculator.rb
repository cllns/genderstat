module Calculator

  def get_percent total_word_count
    round (@counter.to_f / total_word_count.to_f) * 100
  end

  def get_relative_frequency other_count
    round @counter.to_f / other_count.to_f
  end

  # round all responses to two digits after the decimal point
  def round float
    float.round(2)
  end
end
