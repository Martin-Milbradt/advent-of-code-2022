require_relative 'modules'
include Data

def get_sizes(data)
  stack = [0]
  sizes = []
  data.each do |command|
    case command
      when /^\$ cd \//
        sizes += stack.pop(stack.length-2) if stack.length > 1
      when /^\$ cd \.\./
        sizes.push(stack.pop)
      when /^\$ cd /
        stack.push(0)
      when /^dir /, /^\$ ls/
        next
      when /^\d+ /
        size = command.split(" ").first.to_i
        stack = stack.map {|e| e+size}
      else
        puts "Unknown command: #{command}"
    end
  end
  sizes += stack
end

def part1(data)
  get_sizes(data).select {|s| s <= 100000}.sum
end

def part2(data)
  sizes = get_sizes(data).sort
  req = 30000000
  available = 70000000 - sizes.last
  res = 0
  sizes.reverse_each do |size|
    return res if available + size < 30000000
    res = size
  end
end

if __FILE__ == $0
  data = get_data("#{$0[2..3]}")
  puts part1(data)
  puts part2(data)
end
