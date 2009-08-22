require 'rubygems'
require 'test/unit'

begin
  require 'redgreen'
rescue LoadError
  puts "[!] Install redgreen gem for better test output ($ sudo gem install redgreen)"
end unless ENV["TM_FILEPATH"]

require 'shoulda'

require File.join( File.dirname(__FILE__), '..', 'numbers_to_words' )

class NumbersToWordsTest < Test::Unit::TestCase

  context "Number one" do

    should "translate to words" do
      assert_equal 'one',   1.to_words
    end

  end

  context "Number two" do

    should "translate to words" do
      assert_equal 'two',   2.to_words
    end

  end

end
