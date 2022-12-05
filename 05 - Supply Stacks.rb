require_relative 'modules'
include Data

def get_crates(crates_raw)
  array = crates_raw.split("\n").map { |line| line.split("") }
  crates = []
  array.last.each_with_index do |value, stack|
    next if value.strip == ""
    crates.append([])
    (0..array.length-2).reverse_each do |height|
      crate = array[height][stack]
      break if crate.nil? || crate.strip == ""
      crates.last.push(crate)
    end
  end
  crates
end

def get_crates_and_moves(data)
  crates_raw, moves_raw = data.split("\n\n")
  crates = get_crates(crates_raw)
  moves = moves_raw.split("\n")
  [crates, moves]
end

def get_and_log_crates_and_moves(data)
  crates, moves = get_crates_and_moves(data)
  log_crates_and_moves(crates, moves)
end

def log_crates_and_moves(crates, moves)
  if moves.respond_to?(:each)
    moves.each_with_index do |move|
      puts move
    end
  else
    puts moves
  end
  puts "----"
  puts_crates(crates)
  puts "--------"
end

def puts_crates(crates)
  crates.each_with_index do |crate, i|
    puts "Stack #{i}: #{crate.join(', ')}"
  end
end

def parse_move(move)
  match = move.scan(/\d+/)
  num_crates = match[0].to_i
  src_stack = match[1].to_i - 1
  dest_stack = match[2].to_i - 1
  [num_crates, src_stack, dest_stack]
end

def final_stacks_part_1(data)
  crates, moves = get_crates_and_moves(data)
  moves.each do |move|
    num_crates, src_stack, dest_stack = parse_move(move)
    num_crates.times do
      crates[dest_stack].push(crates[src_stack].pop)
    end
  end
  crates
end

def final_stacks_part_2(data)
  crates, moves = get_crates_and_moves(data)
  moves.each do |move|
    num_crates, src_stack, dest_stack = parse_move(move)
    crates[dest_stack].concat(crates[src_stack].pop(num_crates))
  end
  crates
end

def part1(data)
  final_stacks_part_1(data).map(&:last).join
end

def part2(data)
  final_stacks_part_2(data).map(&:last).join
end

if __FILE__ == $0
  data = get_data_string("05")
  puts part1(data)
  puts part2(data)
end
