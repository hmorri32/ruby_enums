require "minitest/autorun"
require "minitest/pride"
require 'pry'
require_relative "../lib/stuff.rb"

class ArrayWrapperTest < Minitest::Test
  def test_map
    items  = ArrayWrapper.new(1,2,3,4)
    result = items.map { |n| n * 2}
    assert_equal result, [2, 4, 6, 8]
  end

  def test_find
    items  = ArrayWrapper.new(1, 2, 3, 4)
    result = items.find { |element| element == 3 }
    assert_equal result, 3
  end

  def test_find_all
    items = ArrayWrapper.new(1, 2, 3, 4)
    result = items.find_all {|element| element > 2 }
    assert_equal result, [3, 4]
  end

  def test_find_all_with_no_result
    items = ArrayWrapper.new(1, 2, 3, 4)
    result = items.find_all { |element| element > 4 }
    assert_equal result, []
  end
end