#!/usr/bin/env ruby

require 'nokogiri'

nok = Nokogiri::HTML( File.read( ARGV.shift ) )
nok.xpath("//p|//span").each do |p|
  puts "<p>#{p.inner_text}</p>"
end
