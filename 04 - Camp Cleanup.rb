require_relative 'modules'
include Data

def part1(data)
  contained = 0
  data.each do |pair|
    first, second = pair.split(",")
    first = first.split("-").map(&:to_i)
    second = second.split("-").map(&:to_i)
    if first.first >= second.first && first.last <= second.last || second.first >= first.first && second.last <= first.last
      contained += 1
    end
  end
  contained
end

def part2(data)
  overlapping = 0
  data.each do |pair|
    first, second = pair.split(",")
    first = first.split("-").map(&:to_i)
    second = second.split("-").map(&:to_i)
    if first.first <= second.last && first.last >= second.first
      overlapping += 1
    end
  end
  overlapping
end

if __FILE__ == $0
  data = get_data("04")
  puts part1(data)
  puts part2(data)
end
