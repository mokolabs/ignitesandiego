#!/usr/bin/ruby

require 'rubygems'
require 'twitter'

Twitter::Search.new('signed up for @ignitesandiego').per_page(100).each do |r|
  puts "<span class=\"attendee vcard\">@<a href=\"http://twitter.com/#{r.from_user}\" class=\"url fn nickname\">#{r.from_user}</a></span>"
end
