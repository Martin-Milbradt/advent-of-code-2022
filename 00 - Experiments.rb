input = "
                [M]     [W] [M]
            [L] [Q] [S] [C] [R]
            [Q] [F] [F] [T] [N] [S]
    [N]     [V] [V] [H] [L] [J] [D]
    [D] [D] [W] [P] [G] [R] [D] [F]
[T] [T] [M] [G] [G] [Q] [N] [W] [L]
[Z] [H] [F] [J] [D] [Z] [S] [H] [Q]
[B] [V] [B] [T] [W] [V] [Z] [Z] [M]
 1   2   3   4   5   6   7   8   9
"


lines = input.split("\n")

grid = lines.map do |line|
  line.chars
end

puts grid.length
puts grid[1].length

grid = grid.transpose

grid = lines.map do |line|
  line.chars
end

puts grid.length
puts grid[1].length
