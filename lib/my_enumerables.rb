module Enumerable
  # Your code goes here
  def my_each_with_index
    idx = 0
    self.my_each do |elem|
      yield(elem, idx)
      idx += 1
    end
    self
  end

  def my_select
    arr = []
    self.my_each do |elem|
      arr.push(elem) if yield(elem)
    end
    arr
  end

  def my_all?
    self.my_each do |elem|
      return false unless yield(elem)
    end
    true
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_none?
    self.my_each do |elem|
      return false if yield(elem)
    end
    true
  end
  def my_count
    idx = 0
    self.my_each do |elem|
      if block_given?
        next unless yield(elem)
      end
      idx += 1
    end
    idx
  end

  def my_map
    new_arr = []
    self.my_each do |elem|
      new_arr.push(yield(elem))
    end
    new_arr
  end

  def my_inject(initial)
    self.my_each do |elem|
      initial = yield(elem, initial)
    end
    initial
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each do |elem|
      yield(elem)
    end
    self
  end
end
