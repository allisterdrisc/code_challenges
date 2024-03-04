class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(data, next_ele = nil)
    @datum = data
    @next = next_ele
  end

  def tail?
    !@next
  end
end

class SimpleLinkedList
  attr_reader :list

  def initialize
    @list = []
  end

  def self.from_a(array)
    new_list = new
    unless array.nil? || array.empty?
      array.reverse.each do |ele|
        new_list.push(ele)
      end
    end
    new_list
  end

  def size
    list.size
  end

  def empty?
    list.empty?
  end

  def peek
    list.empty? ? nil : head.datum
  end

  def head
    list[-1]
  end

  def pop
    list.pop.datum
  end

  def push(ele)
    list.push(Element.new(ele))
    head.next = list[-2] if list.size > 1
  end

  def to_a
    list.reverse.map(&:datum)
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end
end
