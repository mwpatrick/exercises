# Fizz Buzz game simulation. Program will count from 1 to
# a user supplied integer ; it will emit "fizz" when the number
# is divisble by 3 and "buzz" when divisible by 5
#
# It will do this in a loop which renders a table from the idea of
# this being done by a circle of people in the style of a game

# TODO: sanity check args in a better way - right now it just blows up

require 'optparse'

options = {}
opt_parser = OptionParser.new do |opt|
  opt.banner = 'Usage: fizzbuzz [OPTIONS]'
  opt.on('--people INTEGER', 'How many people in the circle?') do |setting|
    options[:people] = Integer(setting)
  end

  opt.on('--count INTEGER', 'How many numbers to do? 1 to COUNT') do |setting|
    options[:count] = Integer(setting)
  end

  opt.on('-h', '--help', 'help') do
    puts opt_parser
  end
end

opt_parser.parse!

if options.count < 2
  puts opt_parser
else
  puts "call on options #{options.inspect}"
end

# from 1 to options[:count]
# write the number in a 3 character field
#  if X mod 3, fizz
#  if X mod 5, buzz
#  if X mod options[:people] newline

(1..(options[:count]).to_i).each do |k|
  fb_string = ''
  fb_string += 'fizz' if (k % 3).zero?
  fb_string += 'buzz' if (k % 5).zero?
  print format('%3s %8s', k, fb_string)
  if (k % options[:people].to_i).zero?
    puts            # newline
  else
    print '    '    # just some space
  end
end
