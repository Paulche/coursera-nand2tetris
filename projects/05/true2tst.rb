#!/usr/bin/env ruby #

require 'pp'

input = IO.read(File.expand_path(ARGV[0]))
num   = ARGV[1].to_i

line_array = input.each_line.map { |el| el.split('|').reject { |el| el == "\n" or el == "" }.map { |el| el.gsub(' ','')} }

line_array[1..-1].map { |el| el.zip(line_array.first) }.each do |line|
  output = line.first(num).map  { |var| " set #{var.last} #{var.first}" }.join(',')
  puts "#{output}, eval, output;"
end


