require 'optparse'
require_relative 'location'

def parse_options
  ARGV << '-h' if ARGV.empty?

  options = {}

  OptionParser.new do |opts|
    opts.banner = 'How to: ruby weather.rb [options]'

    opts.on('-z', '--zipcode digits') do |digits|
      options[:zipcode] = digits
    end

    opts.on('-h', '--help') do
      puts opts
      exit
    end
  end.parse!

  options
end

def main
  options = parse_options

  zipcode = options[:zipcode]

  location = Location.new(zipcode)

  p location.current_conditions
end

main if __FILE__ == $PROGRAM_NAME
