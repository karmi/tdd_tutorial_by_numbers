class Fixnum

  UNITS = %w{zero one two three four five six seven eight nine ten}

  def to_words
    UNITS[self]
  end
end
