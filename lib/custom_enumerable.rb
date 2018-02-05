module CustomEnumerable
  def map(&block)
    result = []
    each { |element| result << block.call(element) }
    result
  end

  def find(ifnone = nil, &block)
    result = nil
    found  = false
    each do |element|
      if block.call(element)
        result = element
        found  = true
      end
    end
    found ? result : ifnone && ifnone.call
  end

  def find_all(&block)
    result = []
    each { |element| result << element if block.call(element) }
    result
  end

  def reduce(accumulator = nil, operation = nil, &block)
    if operation.nil? && block.nil?
      operation   = accumulator
      accumulator = nil
    end

    block = case operation
      when Symbol
        lambda { |acc, value| acc.send(operation, value) }
      when nil
        block
    end

    if accumulator.nil?
      ignore_first = true; accumulator = first
    end

    index = 0

    each do |element|
      accumulator = block.call(accumulator, element) unless ignore_first && index == 0
      index += 1
    end
    accumulator
  end

  def first
    found = nil
    each { |element| found = element; break }
    found
  end
end