# This drawing in console matrix, with 1 in main diagonal
class Three
  attr_reader :imax, :jmax

  def initialize
    puts 'Enter size matrix i'
    @imax = gets.chomp.to_i
    puts 'Enter size matrix j'
    @jmax = gets.chomp.to_i
    raise ArgumentError, 'Some argument is not numeric or less 1'\
                          unless @imax > 0 && @jmax > 0

    show_matrix
  end

  def show_matrix
    (1..@imax).each do |i|
      (1..@jmax).each do |j|
        if i == j
          print 1
        elsif j == @imax
          puts
        else print 0
        end
      end
    end
  end
end
