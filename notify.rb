require 'rubygems'
require 'bundler/setup'
require 'httparty'
require 'terminal-notifier'

loop do
  response = HTTParty.get('http://api.icndb.com/jokes/random?limitTo=nerdy')
  joke = response['value']['joke']
  cmd = "terminal-notifier -appIcon #{Dir.pwd}/chuck-logo.png -message \"#{joke}\" -execute \"say \\\"#{joke}\\\"\" -title \"Chuck Facts\""
  puts cmd
  `#{cmd}`

  time = (rand(2) + 1) * 10
  puts "Sleeping for #{time} seconds"
  sleep time
end