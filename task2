class Two
  attr_reader :radius

  def initialize
    puts "Input a radius of circle"
    @radius = gets.chomp.to_i
    raise ArgumentError, 'Radius must be a numeric and be more 0!' unless @radius > 0
    draw_circle
  end

  def draw_circle
    (0..@radius * 2).each do |y|
      tilt = (Math.sqrt((@radius**2) - ((y - @radius)**2))).round
      (0..@radius * 2).each do |x|
        if x == (@radius - tilt) ||  x == (@radius + tilt)
          print "*"
        else
          print "  "
        end
      end
      puts
    end
  end
end
