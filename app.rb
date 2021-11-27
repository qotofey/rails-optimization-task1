# require 'ruby-progressbar'
#
# parts_of_work = 100
# progressbar = ProgressBar.create(
#   total: parts_of_work,
#   format: '%a, %J, %E, %B'
# )
# progressbar_step2 = ProgressBar.create(
#   total: parts_of_work,
#   format: '%a, %J, %E, %B'
# )
#
# puts 'step 1'
# (1..10).each do |i|
#   sleep(0.1)
#   progressbar.increment
# end
# puts 'step 2'
# (1..parts_of_work).each do |i|
#   sleep(0.01)
#   progressbar_step2.increment
# end

# require_relative 'task-1'
#
# puts work('data.txt')
# puts('Finished')
require_relative 'lib/handling'

Handling::UserRepository.new('data.txt').work
