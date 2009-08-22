module NumbersToWords

  module InstanceMethods

    def to_words
      case self
      when 0..10
        Translations::UNITS[self]
      when 11..19
        Translations::TEENS[self.modulo(10)]
      when 20..99
        unit = self.modulo(10).zero? ? nil : Translations::UNITS[self.modulo(10)]
        [ Translations::TENS[self/10], unit ].compact.join(' ')
      when 100..999
        hundred = Translations::UNITS[self/100]
        rest    = self.modulo(100).zero? ? nil : self.modulo(100).to_words
        [ hundred, Translations::HUNDRED, rest ].compact.join(' ')
      end
    end

  end

  module Translations
    UNITS    = %w{zero one two three four five six seven eight nine ten}
    TEENS    = %w{~ eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen}
    TENS     = %w{~ ten twenty thirty fourty fifty sixty seventy eighty ninety}
    HUNDRED  = 'hundred'
  end

end