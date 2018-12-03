def main(input)
  twos = 0
  threes = 0
  File.open(input).read.each_line do |line|
    tw, th = count_twos_threes(line)
    twos += tw
    threes += th
  end

  checksum = twos * threes
  puts "The solution is: #{checksum}"
end

def count_twos_threes(id)
  all_chars = id.split("")
  tw = 0
  th = 0

  while all_chars.length > 0
    c = all_chars.at(0)
    len_a = all_chars.length
    all_chars.delete(c)

    case (len_a - all_chars.length)
    when 2
      tw = 1
    when 3
      th = 1
    end
  end

  return tw, th
end

main(ARGV[0])
