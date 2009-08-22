require File.join(File.dirname(__FILE__), 'numbers_to_words')

class Fixnum
  include NumbersToWords::InstanceMethods
end
