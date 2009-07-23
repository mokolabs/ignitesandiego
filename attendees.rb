#!/usr/bin/env ruby

require 'rubygems'
require 'twitter'

Twitter::Search.new('Just signed up for @ignitesandiego').each do |r|
  puts "<span class=\"attendee vcard\">@<a href=\"http://twitter.com/#{r.from_user}\" class=\"url fn nickname\">#{r.from_user}</a></span>"
end
