require 'rubygems'
require 'test/unit'

begin
  require 'redgreen'
rescue LoadError
  puts "[!] Install redgreen gem for better test output ($ sudo gem install redgreen)"
end unless ENV["TM_FILEPATH"]

require 'shoulda'

require File.join( File.dirname(__FILE__), '..', 'fixnum' )

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

  context "Numbers 20, 21, 22, 30, 35, 84 and 99" do

    should "translate to words" do
      assert_equal 'twenty',       20.to_words
      assert_equal 'twenty one',   21.to_words
      assert_equal 'twenty two',   22.to_words
      assert_equal 'thirty',       30.to_words
      assert_equal 'thirty five',  35.to_words
      assert_equal 'eighty four',  84.to_words
      assert_equal 'ninety nine',  99.to_words
    end

  end

  # ---------------------------------------------------------------------------

  context "Numbers 100, 101, 111, 120, 123, 187, 200, 201, 211, 223, 587 and 999" do

    should "translate to words" do
      assert_equal 'one hundred',        100.to_words
      assert_equal 'one hundred one',    101.to_words
      assert_equal 'one hundred eleven', 111.to_words
      assert_equal 'one hundred twenty', 120.to_words
      assert_equal 'one hundred twenty three', 123.to_words
      assert_equal 'one hundred eighty seven', 187.to_words
    end

  end

  # ---------------------------------------------------------------------------

end
