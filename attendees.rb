#!/usr/bin/ruby
require 'rubygems'
require 'twitter'
require 'yaml'

# Load cached attendees
attendees = Array.new
File.open('attendees.yml') do |file|
  attendees = YAML::load(file)
end

# Grab new attendees
Twitter::Search.new('signed up for @ignitesandiego').per_page(100).each do |r|
  attendees << r.from_user
end

# Remove duplicates
attendees = attendees.uniq

# Update cached attendees
File.open('attendees.yml', 'w') do |file|
  YAML.dump(attendees, file)
end

# Update include
cache = File.new('attendees.inc', "w+")
attendees.each do |attendee|
  cache.puts "<span class=\"attendee vcard\">" + 
             "@<a href=\"http://twitter.com/#{attendee}\" class=\"url fn nickname\">" + 
             "#{attendee}</a></span>"
end
