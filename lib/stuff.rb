require_relative "custom_enumerable"

class ArrayWrapper
  include CustomEnumerable

  def initialize(*items)
    @items = items.flatten
  end

  def each(&block)
    @items.each(&block)
    self
  end

  def ==(other)
    @items == other
  end
end