def hamming(a, b)
  throw :size_mismatch if a.length != b.length
  len = a.length
  aa = a.split("")
  bb = b.split("")

  r = aa.zip(bb).map{ |x| x.uniq! }
  return len - r.compact.length, r.find_index(nil), r
end

ids = File.readlines(ARGV[0])
a = 0
while a < ids.length
  b = 1
  while b < ids.length
    d, i, ary = hamming(ids[a], ids[b])

    if d == 1
      ary.delete_at(i)
      puts "The solution is: %s" % [ary.join]
      exit
    end

    b += 1
  end

  a += 1
end
