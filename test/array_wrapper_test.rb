require "minitest/autorun"
require "minitest/pride"
require 'pry'
require_relative "../lib/stuff.rb"

class ArrayWrapperTest < Minitest::Test
  attr_reader :items

  def setup
    @items  = ArrayWrapper.new(1,2,3,4)
  end

  def test_map
    result = items.map { |n| n * 2}
    assert_equal result, [2, 4, 6, 8]
  end

  def test_find
    result = items.find { |element| element == 3 }
    assert_equal result, 3
  end

  def test_find_all
    result = items.find_all { |element| element > 2 }
    assert_equal result, [3, 4]
  end

  def test_find_all_with_no_result
    result = items.find_all { |element| element > 4 }
    assert_equal result, []
  end

  def test_reduce_sum
    result = items.reduce(0) { |acc, element| acc + element }
    assert_equal 10, result
  end

  def test_reduce_no_accumulator
    items  = ArrayWrapper.new
    result = items.reduce(50) { |acc, el| acc + el }
    assert_equal 50, result
  end

  def test_reduce_with_operation
    result = items.reduce(0, :+)
    assert_equal 10, result
  end

  def test_reduce_no_acc
    result = items.reduce(:+)
    assert_equal 10, result
  end

  def test_first
    assert_equal items.first, 1
  end

  def test_first_again
    items = ArrayWrapper.new
    assert_nil items.first
  end
end