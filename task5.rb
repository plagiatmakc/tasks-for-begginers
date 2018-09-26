# Formatting string
class Five
  attr_reader :str

  def initialize
    @str = 'i love ruby'
    formalize(@str, :camel)
    formalize(@str, :underscore)
    formalize(@str, :css)
  end

  def formalize(str, type)
    arr = str.split
    new_str = ''
    case type
    when :camel
      arr.each { |i| new_str += i.capitalize }
    when :underscore
      arr.each do |i|
        i != arr[arr.size - 1] ? new_str += i.downcase + '_' : new_str += i.downcase
      end
    when :css
      arr.each do |i|
        i != arr[arr.size - 1] ? new_str += i.downcase + '-' : new_str += i.downcase
      end
    else puts 'type not fond, please input :camel, :underscore or :css'
    end
    puts new_str
  end
end
