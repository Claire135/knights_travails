# frozen_string_literal: true

# stores visited nodes (piece routes) so that they do not get revisited during bfs searching.

require_relative 'linked_lists'

class Set
  attr_reader :load_factor, :size

  def initialize
    @load_factor = 0.75
    @capacity = 16
    @buckets = Array.new(@capacity) { LinkedList.new }
    @size = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key)
    index = hash(key) % @capacity
    bucket = @buckets[index]

    unless bucket.find(key)
      bucket.append(key)
      @size += 1
    end
    resize if @size.to_f / @capacity > @load_factor
  end

  def get(key)
    index = hash(key) % @capacity
    node = @buckets[index].find(key)
    node&.value
  end

  def has?(key)
    !get(key).nil?
  end

  def remove(key)
    index = hash(key) % @capacity
    removed_value = @buckets[index].remove(key)
    @size -= 1 if removed_value
    removed_value
  end

  def length
    @size
  end

  def clear
    @buckets = Array.new(@capacity) { LinkedList.new }
    @size = 0
  end

  def keys
    key_array = []
    @buckets.each do |bucket|
      current = bucket.head
      while current
        key_array << current.key
        current = current.next_node
      end
    end
    key_array
  end

  def entries
    entries_array = []
    @buckets.each do |bucket|
      current = bucket.head
      while current
        entries_array << [current.key]
        current = current.next_node
      end
    end
    entries_array
  end

  def resize
    increase_capacity
    rehash_elements
  end
  
  private
  # helper methods for resize
  
  def increase_capacity
    @capacity *= 2
    @buckets = Array.new(@capacity) { LinkedList.new }
    @size = 0
  end
  
  def rehash_elements
    old_buckets = @buckets
    old_buckets.each do |bucket|
      rehash_bucket(bucket)
    end
  end
  
  def rehash_bucket(bucket)
    current = bucket.head
    while current
      set(current.key) # Re-add keys to new resized buckets
      current = current.next_node
    end
  end
end
