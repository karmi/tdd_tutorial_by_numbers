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

  context "Numbers lower then 10" do

    should "translate to words" do
      assert_equal 'zero',  0.to_words
      assert_equal 'one',   1.to_words
      assert_equal 'two',   2.to_words
      assert_equal 'three', 3.to_words
      assert_equal 'four',  4.to_words
      assert_equal 'five',  5.to_words
      assert_equal 'six',   6.to_words
      assert_equal 'seven', 7.to_words
      assert_equal 'eight', 8.to_words
      assert_equal 'nine',  9.to_words
    end

  end

  # ---------------------------------------------------------------------------

  context "Numbers 10 to 19" do

    should "translate to words" do
      assert_equal 'ten',       10.to_words
      assert_equal 'eleven',    11.to_words
      assert_equal 'fourteen',  14.to_words
      assert_equal 'fifteen',   15.to_words
      assert_equal 'sixteen',   16.to_words
      assert_equal 'seventeen', 17.to_words
      assert_equal 'eighteen',  18.to_words
      assert_equal 'nineteen',  19.to_words
    end

  end

  # ---------------------------------------------------------------------------

end
