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
    items  = ArrayWrapper.new(1, 2, 3, 4)
    result = items.find_all { |element| element > 2 }
    assert_equal result, [3, 4]
  end

  def test_find_all_with_no_result
    items  = ArrayWrapper.new(1, 2, 3, 4)
    result = items.find_all { |element| element > 4 }
    assert_equal result, []
  end

  def test_reduce_sum
    items  = ArrayWrapper.new(1, 2, 3, 4)
    result = items.reduce(0) { |acc, element| acc + element }
    assert_equal 10, result
  end

  def test_reduce_no_accumulator
    items  = ArrayWrapper.new
    result = items.reduce(50) { |acc, el| acc + el }
    assert_equal 50, result
  end

  def test_reduce_with_operation
    items  = ArrayWrapper.new(1, 2, 3, 4)
    result = items.reduce(0, :+)
    assert_equal 10, result
  end

  def test_reduce_no_acc
    items  = ArrayWrapper.new(1, 2, 3, 4)
    result = items.reduce(:+)
    assert_equal 10, result
  end

  def test_first
    items = ArrayWrapper.new(1, 2, 3, 4)
    assert_equal items.first, 1
  end

  def test_first_again
    items = ArrayWrapper.new
    assert_nil items.first
  end
end