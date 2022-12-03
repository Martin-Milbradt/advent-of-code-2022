require_relative 'modules'
include Data

class String
  def halves
    chars.each_slice(size / 2).map(&:join)
  end
end

def priority(char)
  ord = char.ord
  if ord >= 97
    ord - 96
  else
    ord - 38
  end
end

def get_wrong_item(bag)
  first, second = bag.halves
  (first.split("") & second.split("")).first
end

def get_common_item(bags)
  common = bags.first.split("")
  bags[1..-1].each do |bag|
    common = common & bag.split("")
  end
  common.first
end

def part1(data)
  sum = 0
  data.each do |bag|
    sum += priority(get_wrong_item(bag))
  end
  sum
end

def part2(data)
  sum = 0
  (0...data.length).step(3).each do |i|
    sum += priority(get_common_item(data[i..i+2]))
  end
  sum
end

if __FILE__ == $0
  data = get_data("03")
  puts part1(data)
  puts part2(data)
end
