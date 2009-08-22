module NumbersToWords

  UNITS = %w{zero one two three four five six seven eight nine ten}
  TEENS = %w{~ eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen}

  module InstanceMethods

    def to_words
      case self
        when 0..10
          UNITS[self]
        when 11..19
          TEENS[self.modulo(10)]
      end
    end
  end

end
