class HashTable

  def initialize(size)
    @size = size
    @slots = [nil] * size
    @data = [nil] * size
  end

  def put(key, data)
    hash_value = self.hash_function(key, @slots.length)

    # if slot is empty
    if @slots[hash_value] == nil
      @slots[hash_value] = key
      @data[hash_value] = data
    else

      # if key already exists, replace old value
      if @slots[hash_value] == key
        @data[hash_value] = data

      # otherwise, find next available slot
      else
        next_slot = self.rehash(hash_value, @slots.length)

        # Get to the next slot
        while @slots[next_slot] != nil and @slots[next_slot] != key
          next_slot = self.rehash(next_slot, @slots.length)
        end

        # Set new key if nil
        if @slots[next_slot] == nil
          @slots[next_slot] = key
          @data[next_slot] = data

        # otherwise replace old value
        else
          @data[next_slot] = data
        end
      end
    end
  end

  def hash_function(key, size)
    # remainder method
    return key % size
  end

  def rehash(old_hash, size)
    # for finding next possible positions
    return (old_hash + 1) % size
  end

  def get(key)
    start_slot = self.hash_function(key, @slots.length)
    data = nil
    stop = false
    found = false
    position = start_slot

    # Until we discern that its not empty or found (and haven't stopped yet)
    while @slots[position] != nil and not found and not stop

      if @slots[position] == key
        found = true
        data = @data[position]
      else
        position = self.rehash(position, @slots.length)
        if position == start_slot
          stop = true
        end
      end
    end
    return data
  end
end
