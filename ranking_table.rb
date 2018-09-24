class Ranking
  attr_reader :results, :array_of_strings

  def initialize
    @results = {}
    @array_of_strings = []
    puts "input a string or name of file, for calculation input strings just press Enter"
    input = gets.chomp
    if File.file?(input)
      read_file(input)
    else
      puts "File not found, this is files in this directory:"
        system('ls')
    end
  end

  def read_file(input_file)
    raise ArgumentError, 'Your file is empty, nothing to calculate!' if File.empty?(input_file)
    File.readlines(input_file).each do |line|
      get_result(line)
    end
    print_results
  end

  def get_result(str)
    regx_str = /((?<team1>\w* ?\w+) (?<goals1>\d+), (?<team2>\w* ?\w+) (?<goals2>\d+))/.match(str)
    @results[regx_str[:team1]] = 0 unless @results.has_key?(regx_str[:team1])
    @results[regx_str[:team2]] = 0 unless @results.has_key?(regx_str[:team2])
    @results[regx_str[:team1]] += 3 if regx_str[:goals1] > regx_str[:goals2]
    @results[regx_str[:team2]] += 3 if regx_str[:goals1] < regx_str[:goals2]
    if regx_str[:goals1] == regx_str[:goals2]
      @results[regx_str[:team1]] += 1
      @results[regx_str[:team2]] += 1
    end
  end

  def print_results
    num = 0
    @results.sort_by{ |_key, value| value }.reverse.each do |team, score|
      num += 1
      puts score > 1 ? "#{num}. #{team}, #{score}pts" : "#{num}. #{team}, #{score}pt"
    end
  end
end
  run = Ranking.new
