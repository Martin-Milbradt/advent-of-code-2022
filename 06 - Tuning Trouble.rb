require_relative 'modules'
include Data

def unique_string_at(data, length)
  length -= 1 # to compensate for starting at 0
  (length..data.length).each do |idx|
    chars = data.chars[idx-length..idx]
    return idx+1 if chars.count { |c| chars.count(c) > 1 } == 0
  end
end

# RegEx solution for 1 (ungreedy): '^\w+(\w)(?!\g1)(\w)(?!\g1|\g2)(\w)(?!\g1|\g2|\g3)(\w)\w+$'

def part1(data)
  unique_string_at(data, 4)
end

def part2(data)
  unique_string_at(data, 14)
end

if __FILE__ == $0
  data = get_data_string("06")
  puts part1(data)
  puts part2(data)
end
