# Module for choose task
module Task
  puts 'Choose task from 1 to 6'
  @task = gets.chomp.to_i
  case @task
  when 1
    load 'task1.rb'
  when 2
    load 'task2.rb'
    _run = Two.new
  when 3
    load 'task3.rb'
    _run = Three.new
  when 4
    load 'task4.rb'
    _run = Four.new
  when 5
    load 'task5.rb'
    _run = Five.new
  when 6
    load 'task6.rb'
    _run = Six.new
  else puts 'Choose from 1 to 6'
  end
end
