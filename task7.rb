module Task
  puts "Choose task from 1 to 6"
  @task = gets.chomp.to_i
  case @task
  when 1
    load "task1"
  when 2
    load "task2"
    _run = Two.new
  when 3
    load "task3"
    _run = Three.new
  when 4
    load "task4"
    _run = Four.new
  when 5
    load "task5"
    _run = Five.new
  when 6
    load "task6"
    _run = Six.new
  else  puts "Choose from 1 to 6"
  end
end
