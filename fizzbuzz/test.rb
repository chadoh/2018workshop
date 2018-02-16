require 'minitest/autorun'
require_relative './app'

class FizzBuzzTest < Minitest::Test
  def test_process_1
    assert_equal 1, FizzBuzz.process(1), 1
  end

  def test_process_3
    assert_equal "Fizz", FizzBuzz.process(3)
  end

  def test_process_5
    assert_equal "Buzz", FizzBuzz.process(5)
  end

  def test_process_15
    assert_equal "FizzBuzz", FizzBuzz.process(15)
  end
end
