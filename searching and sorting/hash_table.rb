class HashTable

  def initialize(size)
    @size = size
    @slots = [nil] * size
    @data = [nil] * size
  end

  def put(key, data)
    hash_value = self.hash_function(key, @slots.length)

    if @slots[hash_value] == nil
      @slots[hash_value] = key
      @data[hash_value] = data
    else
      if @slots[hash_value] == key
        @data[hash_value] = data
      else
        next_slot = self.rehash(hash_value, @slots.length)

        while @slots[next_slot] != nil and @slots[next_slot] != key
          next_slot = self.rehash(next_slot, @slots.length)
        end

        if @slots[next_slot] == nil
          @slots[next_slot] = key
          @data[next_slot] = data
        else
          @data[next_slot] = data
        end
      end
    end
  end

  def hash_function(key, size)
    return key % size
  end

  def rehash(old_hash, size)
    return (old_hash + 1) % size
  end
end
