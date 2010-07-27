require 'rubygems'
require 'sinatra'
require 'twitter'
require 'yaml'

get '/' do
  erb :index
end

get '/guidelines' do
  erb :guidelines
end

get '/talks' do
  erb :talks
end

get '/signup' do

  # Let's get this party started!
  attendees = Array.new

  # Create cached files (if missing)
  ['yml', 'inc'].each do |type|
    unless File.exists?("attendees.#{type}")
      File.new("attendees.#{type}",  "w+")
    end
  end

  # Load cached attendees
  unless File.zero?('attendees.yml')
    File.open('attendees.yml') do |file|
      attendees = YAML::load(file)
    end
  end

  # Grab new attendees
  Twitter::Search.new('signed up for @ignitesandiego').per_page(100).each do |tweet|
    attendees << tweet.from_user
  end

  # Sort attendee names
  attendees = attendees.sort_by { |attendee| attendee.downcase }

  # Remove duplicates
  attendees = attendees.uniq

  # Update cached attendees
  File.open('attendees.yml', 'w') do |file|
    YAML.dump(attendees, file)
  end

  # Update include file
  cache = File.new('attendees.inc', "w+")
  attendees.each do |attendee|
    cache.puts "<span class=\"attendee vcard\">" + 
               "@<a href=\"http://twitter.com/#{attendee}\" class=\"url fn nickname\">" + 
               "#{attendee}</a></span>"
  end

end
