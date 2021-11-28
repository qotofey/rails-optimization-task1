require 'benchmark'
require_relative 'lib/handling'

GC.disable

time_for_10000 = Benchmark.realtime do
  Handling::UserRepository.new('data10000.txt').work
end

time_for_20000 = Benchmark.realtime do
  Handling::UserRepository.new('data20000.txt').work
end

time_for_30000 = Benchmark.realtime do
  Handling::UserRepository.new('data30000.txt').work
end

time_for_40000 = Benchmark.realtime do
  Handling::UserRepository.new('data40000.txt').work
end

puts "Finish in #{time_for_10000.round(2)} (10000 lines)"
puts "Finish in #{time_for_20000.round(2)} (20000 lines)"
puts "Finish in #{time_for_30000.round(2)} (30000 lines)"
puts "Finish in #{time_for_40000.round(2)} (40000 lines)"