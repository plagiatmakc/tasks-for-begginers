class Five
  attr_reader :str

  def initialize
    @str = 'i love ruby'
    formalize(@str, :camel)
    formalize(@str, :underscore)
    formalize(@str, :css)
  end

  def formalize (str, type)
    arr = str.split
    new_str = ""
    case type
    when :camel
      arr.each { |i| new_str += i.capitalize }
    when :underscore
      arr.each do |i|
        if i != arr[arr.size - 1]
          new_str += i.downcase + "_"
        else
          new_str += i.downcase
        end
      end
    when :css
      arr.each do |i|
        if i != arr[arr.size - 1]
          new_str += i.downcase + "-"
        else
          new_str += i.downcase
        end
      end
    else puts "type not fond, please input :camel, :underscore or :css"
    end
    puts new_str
  end
end
