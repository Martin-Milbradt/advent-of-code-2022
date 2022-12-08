require_relative 'modules'
include Data

def puts_visible(visible)
  display = []
  visible.each do |row|
    s = ""
    row.each do |v|
      s += v ? "T" : "."
    end
    display.push(s)
  end
  puts display
end

def marks_visible(data, visible, row, clm, max)
  tree = data[row][clm].to_i
  if tree > max
    visible[row][clm] = true
    max = tree
  end
  max
end

def get_visible_trees(data)
  rows = data.length
  clms = data.first.length
  row = Array.new(clms, false)
  visible = Array.new(rows) {|r| r = row.clone}
  (0..rows-1).each do |row|
    max = -1
    (0..clms-1).each do |clm|
      max = marks_visible(data, visible, row, clm, max)
    end
    max = -1
    (0..clms-1).reverse_each do |clm|
      max = marks_visible(data, visible, row, clm, max)
    end
  end
  (0..clms-1).each do |clm|
    max = -1
    (0..rows-1).each do |row|
      max = marks_visible(data, visible, row, clm, max)
    end
    max = -1
    (0..rows-1).reverse_each do |row|
      max = marks_visible(data, visible, row, clm, max)
    end
  end
  visible
end

def get_view(row_tree, clm_tree, data)
  ht = data[row_tree][clm_tree].to_i
  prod = 1
  fac = 0
  (0..row_tree-1).reverse_each do |row|
    fac += 1
    if data[row][clm_tree].to_i >= ht
      break
    end
  end
  prod *= fac
  fac = 0
  (row_tree+1..data.length-1).each do |row|
    fac += 1
    if data[row][clm_tree].to_i >= ht
      break
    end
  end
  prod *= fac
  fac = 0
  (0..clm_tree-1).reverse_each do |clm|
    fac += 1
    if data[row_tree][clm].to_i >= ht
      break
    end
  end
  prod *= fac
  fac = 0
  (clm_tree+1..data.first.length-1).each do |clm|
    fac += 1
    if data[row_tree][clm].to_i >= ht
      break
    end
  end
  prod *= fac
  prod
end

def part2(data)
  max = -1
  (0..data.length-1).each do |row|
    (0..data.first.length-1).each do |clm|
      max = [get_view(row, clm, data), max].max
    end
  end
  max
end

def part1(data)
  visible = get_visible_trees(data)
  number_visible = visible.sum {|r| r.count(true)}
end

if __FILE__ == $0
  data = get_data("#{$0[2..3]}")
  puts part1(data)
  puts part2(data)
end
