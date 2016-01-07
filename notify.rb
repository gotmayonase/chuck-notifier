require 'rubygems'
require 'bundler/setup'
require 'httparty'
require 'terminal-notifier'

loop do
  response = HTTParty.get('http://api.icndb.com/jokes/random?exclude=[explicit]')
  joke = response['value']['joke']
  cmd = "terminal-notifier -appIcon #{Dir.pwd}/chuck-logo.png -message \"#{joke}\" -execute \"say \\\"#{joke}\\\"\" -title \"Chuck Facts\""
  `#{cmd}`

  time = (rand(2) + 1) * 60
  puts "Sleeping for #{time} seconds"
  sleep time
end
