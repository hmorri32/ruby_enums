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
end