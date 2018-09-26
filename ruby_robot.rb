#
class Robot
  attr_accessor :current_pos, :directions

  def initialize(table_x = 5, table_y = 6)
    @table_x = table_x
    @table_y = table_y
    @directions = ['WEST', 'NORTH', 'EAST', 'SOUTH']
    p('Place your robot')
    request = gets.chomp
    while request != 'EXIT'
      regx_command = /(?<command>^\w+)/.match(request)
      case regx_command[:command]
        when 'PLACE'
          regx_params = /(?<command>^\w+) (?<x_dim>\d+),(?<y_dim>\d+),(?<direction>\w+)/.match(request)
          PLACE(regx_params[:x_dim], regx_params[:y_dim], regx_params[:direction])
        when 'MOVE'
          MOVE
        when 'LEFT'
          LEFT
        when 'RIGHT'
          RIGHT
        when 'REPORT'
          REPORT
      end
    end
  end

  def PLACE(x_dim, y_dim, direction)
    return p('dont place outside a table') if x_dim < 0 || x_dim > @table_x || y_dim < 0 || y_dim > @table_y

    @current_pos = {:x_dim => x_dim, :y_dim => y_dim, :direction => direction}
  end

  def LEFT
    @current_pos[:direction] = @directions[@directions.index(@current_pos[:direction]).pred]
  end

  def RIGHT
    @current_pos[:direction] = @directions[@directions.index(@current_pos[:direction]).next]
  end

  def MOVE
    case @current_pos[:direction]
    when 'WEST'
      @current_pos[:x_dim] -= 1 unless @current_pos[:x_dim] == 0
    when 'NORTH'
      @current_pos[:y_dim] += 1 unless @current_pos[:y_dim] == @table_y
    when 'EAST'
      @current_pos[:x_dim] += 1 unless @current_pos[:x_dim] == @table_x
    when 'SOUTH'
      @current_pos[:y_dim] -= 1 unless @current_pos[:y_dim] == 0
    end
  end

  def REPORT
    pp @current_pos
  end

end
_run = Robot.new
_run.PLACE(2,2, 'NORTH')
_run.REPORT
_run.LEFT
_run.MOVE
_run.REPORT
_run.MOVE
_run.REPORT
_run.MOVE
_run.REPORT