sum = 0
occurences = Hash.new
while true
  File.open(ARGV[0]).read.each_line do |line|
    sum += line.chomp.to_f
    if occurences.key?(sum)
      occurences[sum] += 1
    else
      occurences[sum] = 1
    end

    if occurences[sum] == 2
      puts "The solution is: #{sum}"
      exit
    end
  end
end
