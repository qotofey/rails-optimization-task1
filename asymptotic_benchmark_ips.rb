# gem install benchmark-ips
# gem install kalibera

require 'benchmark/ips'
require_relative 'lib/handling'

GC.disable

Benchmark.ips do |x|
  x.config(stats: :bootstrap, confidence: 95)
  x.report("1000 lines") do
    Handling::UserRepository.new('data1000.txt').work
  end
  x.report("2000 lines") do
    Handling::UserRepository.new('data2000.txt').work
  end
  x.report("3000 lines") do
    Handling::UserRepository.new('data3000.txt').work
  end
  x.report("4000 lines") do
    Handling::UserRepository.new('data4000.txt').work
  end
end