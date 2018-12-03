sum = 0
File.open(ARGV[0]).read.each_line do |line|
  sum += line.chomp.to_f
end
puts "The solution is: #{sum}"
