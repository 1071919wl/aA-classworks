require "byebug"

class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @max = max
    @store = Array.new(max)
  end

  def insert(num)
    is_valid?(num)
    self.store[num] = true
  end

  def remove(num)
    self.store[num] = false
  end

  def include?(num)
    # @store.include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num > @max || num < 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].pop
  end

  def include?(num)
    @store.flatten.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num % num_buckets
    @store[index]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count


  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    # debugger
    # if @store.flatten.include?(num) == false
    resize! if count == num_buckets

    if !self.include?(num)
      self[num] << num 
      @count += 1
      # resize!
    end
    
  end

  def remove(num)
    if self.include?(num)
      self[num].pop
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num % num_buckets
    @store[index] 
  end

  def num_buckets
    @store.length
  end

  def resize!
      prev = num_buckets
      results = []
      @store.each do |sub|
        sub.each do |ele|
          results << ele
        end
      end
      @store = Array.new(2 * prev) {Array.new} if count == num_buckets
      @count = 0
      results.each {|num| self.insert(num)}
    
  end
end
