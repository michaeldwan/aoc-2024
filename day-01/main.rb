require 'pathname'


day_dir = Pathname.new(File.dirname(__FILE__))

left = []
right = []

day_dir.join('input.txt').read
  .lines
  .each do |line|
    l, r = line.split("  ").map(&:to_i)
    left << l
    right << r
  end

left.sort!
right.sort!

puts "Part 1"

distance =
  left.zip(right).map do |l, r|
    (r - l).abs
  end

puts "Distance: #{distance.sum}"

puts "Part 2"
similarity_score =
  left
  .map do |lval|
    lval * right.count { |rval| lval==rval }
  end
  .sum

puts "Similarity Score: #{similarity_score}"
