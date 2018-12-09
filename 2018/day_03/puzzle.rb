require 'set'

tiles = {}
tile_claims = {}
all_claims = Set[]
overlapping_claims = Set[]

File.open(ARGV[0]).read.each_line do |line|
  # <ID> @ x,y: wxh
  id, x, y, w, h = line.match(/#(\d+)\s@\s(\d+),(\d+): (\d+)x(\d+)/).captures.map { |c| c.to_i }
  all_claims.add(id)

  iw = 0
  while iw < w
    ih = 0
    while ih < h
      idx = "%d,%d" % [x+iw, y+ih]
      tiles[idx] = 0 if !tiles.key?(idx)
      tiles[idx] += 1
      ih += 1

      tile_claims[idx] = Set[] if !tile_claims.key?(idx)
      tile_claims[idx].add(id)

      if tiles[idx] > 1
        overlapping_claims.merge(tile_claims[idx])
      end
    end
    iw += 1
  end
end

part_one = tiles.values.keep_if { |v| v > 1 }.length
puts "The solution for Part One is: %d" % [part_one]

the_lonely_claim = all_claims.difference(overlapping_claims)
raise "More than one claims found, the solution is wrong!" if the_lonely_claim.length != 1

the_lonely_claim.each do |e|
  puts "The solution for Part Two is: %d" % [e]
end
