class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if num_buckets == count
    self[key] << key 
    @count += 1
  end

  def include?(key)
    # !self[key].empty? 
    self[key].include?(key)
  end

  def remove(key)
    if self[key].include?(key)
      self[key].pop
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num.hash % num_buckets
    @store[index] 
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(2 * num_buckets) { Array.new }
    count = 0
    old_store.each do |bucket|
      bucket.each do |item|
        self.insert(item)
      end
    end
  end
end
