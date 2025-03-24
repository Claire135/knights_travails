# prevents collissions in the set class.

# frozen_string_literal: true

require_relative 'node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(key, value)
    new_node = Node.new(key, value)

    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next_node while current.next_node
      current.next_node = new_node
    end
  end

  def find(key)
    current = @head
    while current
      return current if current.key == key

      current = current.next_node
    end
    nil
  end

  def remove(key)
    return nil if @head.nil?
  
    if @head.key == key
      return remove_head
    end
  
    remove_from_list(key)
  end

  def to_s
    current = @head
    result = ''

    while current
      result << "( #{current.key} ) -> "
      current = current.next_node
    end

    result << 'nil'
    result
  end

  private
  # helper methods for remove(key)
  def remove_head
    removed_node = @head
    @head = @head.next_node
    removed_node.key
  end
  
  def remove_from_list(key)
    current = @head
    while current.next_node
      if current.next_node.key == key
        removed_node = current.next_node
        current.next_node = current.next_node.next_node
        return removed_node.value
      end
      current = current.next_node
    end
    nil
  end
end
