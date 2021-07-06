class BinarySort

  attr_reader :initial_array, :item

  def initialize(initial_array, item)
    @initial_array = initial_array
    @item = item
  end


  def call
    sorted_array = array_sort(initial_array)

    low = 0
    high = sorted_array.count - 1
    print(sorted_array)
    puts

    binary_search(sorted_array, low, high, item)
  end

  private
  def array_sort(arr)
    length = arr.count
    sorted_array = []

    while length != 0
      smallest = arr[0]
      smallest_index = 0

      arr.each_with_index do |item, i|
        next if item > smallest
        smallest = item
        smallest_index = i
      end
      sorted_array.push(arr.delete_at(smallest_index))
      length -= 1
    end

    sorted_array
  end

  private
  def binary_search(arr, low, high, item)
    step = (low + high) / 2
    guess = arr[step]
    return step if guess == item
    return binary_search(arr, step + 1, high, item) if guess < item
    return binary_search(arr, low, step - 1, item) if guess > item

    nil
  end



end




