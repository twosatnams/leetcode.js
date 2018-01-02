require 'byebug'
require 'rspec'

# Since I'm writing this in Ruby, it'll be a little unclean to use the in-built array
# To rectify, I'm going to write a StaticArray class first, which behaves more like a C array
# Not exactly like a C array though because it doesn't force only one types of elements

class StaticArray
  def initialize(length)
    @store = Array.new(length)
  end

  def [](index) # find
    raise 'Index out of bounds' if index >= @store.length
    @store[index]
  end

  def []=(index, value) # assignment
    raise 'Index out of bounds' if index >= @store.length
    @store[index] = value
  end

  def length
    @store.length
  end

  def to_s
    @store.to_s
  end
end

class DynamicArray
  # Store is the StaticArray that holds all of our elements
  # Count reflects the index of the last element, plus one. Just like Ruby's length method on Array
  attr_accessor :store, :count

  def initialize()
    @count = 0
    @store = StaticArray.new(8) # 8 is just a random choice
  end

  def [](index)
    # A ruby array return nil if the index is more than the length
    index < @store.length ? @store[index] : nil
  end

  def []=(index, value)
    increase_size(@store.length - index) if index >= @store.length
    @store[index] = value
    @count = index + 1 if index + 1 > @count
  end

  def length
    @count
  end

  def push(*nums)
    increase_size(nums.length) if @count + nums.length > @store.length
    (0...nums.length).each { |idx| @store[@count + idx] = nums[idx] }
    @count = @count + nums.length
  end

  def append(num)
    # Best Case - O(1) : When the resize condition is not met
    # Worst Case - O(N) : When the resize condition is met

    # The resize condition is only met when the number of elements equal some exponentiation with base 2
    # For example -
    # For the first 1000 append operations, the resize condition will only be met 6 times
    # i.e. when the size hits 16, 32, 64, 128, 256 and 512
    # Admittedly, the operation will be slow when the size equals one of these numbers
    # But for the remaining 994 times, it will be O(1) and very fast
    # Hence, we can say that this whole operation occurs in constant amortized time

    increase_size(1) if @count + 1 > @store.length # O(N) if the condition is met
    @store[@count] = num # O(1)
    @count = @count + 1 # O(1)
  end

  def pop(size)
    (@count - 1).downto(@count - size).each { |idx| @store[idx] = nil }
    @count = @count - size
    check_and_decrease_size
  end

  def unshift(*nums)
    increase_size(nums.length) if @count + nums.length > @store.length
    # Move all the previous elements back and make space for new ones
    (@count - 1).downto(0).each { |idx| @store[idx + nums.length] = @store[idx] }
    (0...nums.length).each { |idx| @store[idx] = nums[idx] }
    @count = @count + nums.length
  end

  def shift(size)
    # Move all elements from back to the front
    (size...@count + size).each { |idx| @store[idx - size] = @store[idx] }

    # Take all the element that were left untouched and make them nils
    ((@count - size)...@count).each { |idx| @store[idx] = nil }
    @count = @count - size
    check_and_decrease_size
  end

  def include?(element)
    (0...@count).each do |idx|
      return true if @store[idx] == element
    end
    false
  end

  def to_s
    @store.to_s
  end

  def real_length
    # For testing purposes only
    @store.length
  end

  private

  def increase_size(num_new_elements)
    # We simply double the size of the array and check if that is sufficient
    # If not, we keep on repeating that until its sufficient
    # Our array size stays a number that can be represented as 2^n

    new_length = @store.length * 2
    required_length = @count + num_new_elements
    while required_length > new_length
      new_length = new_length * 2
    end

    # Copy everything into a new StaticArray of correct length
    new_store = StaticArray.new(new_length)
    (0...@store.length).each { |idx| new_store[idx] = @store[idx] }
    @store = new_store
  end

  def check_and_decrease_size
    # We want to keep the size of the store equal to the nearest bigger 2^n number
    if Math.log(@count, 2).ceil < Math.log(@store.length, 2).to_i
      new_store = StaticArray.new(2**Math.log(@count, 2).ceil)
      (0...@count).each { |idx| new_store[idx] = @store[idx] }
      @store = new_store
    end
  end
end

describe DynamicArray do
  arr = DynamicArray.new
  it "starts out with length 0" do
    expect(arr.length).to eq(0)
  end

  it "returns the correct length after we add elements" do
    arr.push(0,1,2,3)
    expect(arr.length).to eq(4)
  end

  it "resizes itself when we add more elements" do
    arr.push(4,5,6,7,8,9,10)
    expect(arr.length).to eq(11)
    expect(arr.real_length).to eq(16)
  end

  it "returns the correct element if we search using its index" do
    expect(arr[4]).to eq(4)
  end

  it "can insert an element at a random place if index is within bounds" do
    arr[14] = 14
    expect(arr[14]).to eq(14)
  end

  it "returns the correct length if elements are inserted at random places" do
    expect(arr.length).to eq(15)
  end

  it "resizes itself if we ask it to insert an element at an out of bounds place" do
    arr[23] = 23
    expect(arr.length).to eq(24)
    expect(arr.real_length).to eq(32)
  end

  it "can remove elements from the back using pop" do
    arr.pop(2)
    expect(arr.length).to eq(22)
    expect(arr.real_length).to eq(32)
  end

  it "can remove elements from the back using pop and resize the store" do
    arr.pop(8)
    expect(arr.length).to eq(14)
    expect(arr.real_length).to eq(16)
  end

  it "can add elements to the front" do
    arr.unshift(100, 101)
    expect(arr.length).to eq(16)
    expect(arr.real_length).to eq(16)
  end

  it "can add elements to the front and resize the store" do
    arr.unshift(96, 97, 98, 99)
    expect(arr.length).to eq(20)
    expect(arr.real_length).to eq(32)
  end

  it "can remove elements from the front" do
    arr.shift(2)
    expect(arr.length).to eq(18)
    expect(arr.real_length).to eq(32)
  end

  it "can remove elements from the front and resize the store" do
    arr.shift(3)
    expect(arr.length).to eq(15)
    expect(arr.real_length).to eq(16)
  end
end
