# Get array elements of of different types
class Six
  attr_reader :array, :array_of_types

  def initialize
    @array_of_types = []
    @array = [[1, 2, 3, 4, '1'], ['2', '5', '10'], [111, 222, 333, 444], ['i', 'love', 'ruby'], { key: 'value' }, [[['text', 100_000]]]]
    get_all(@array, String)
    print @array_of_types
  end

  def get_all(array, type)
    array.each do |arr|
      if arr.is_a?(Array)
        get_all(arr, type)
      elsif arr.is_a?(type)
        @array_of_types << arr
      end
    end
  end
end
