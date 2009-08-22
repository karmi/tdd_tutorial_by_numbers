require 'test/unit'

begin
  require 'redgreen'
rescue LoadError
  puts "[!] Install redgreen gem for better test output ($ sudo gem install redgreen)"
end unless ENV["TM_FILEPATH"]

require File.join( File.dirname(__FILE__), '..', 'numbers_to_words' )

class NumbersToWordsTest < Test::Unit::TestCase

  def test_1_should_return_one
    assert_equal 'one', 1.to_words
  end  

end
