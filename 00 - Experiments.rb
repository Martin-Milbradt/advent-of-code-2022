def array_merge
  a = ["1", "2"]
  b = ["3", "4"]

  def details(a)
    "a: #{a} (length #{a.length})\n\n"
  end

  puts "+= : #{a += b}\n"
  puts details(a)
  a = ["1", "2"]
  puts "append : #{a.append(b)}\n"
  puts details(a)
  a = ["1", "2"]
  puts "concat : #{a.concat(b)}\n"
  puts details(a)
  a = ["1", "2"]
  puts "push : #{a.push(b)}\n"
  puts details(a)
  a = ["1", "2"]
  puts "push *: #{a.push(*b)}\n"
  puts details(a)
  a = ["1", "2"]
  puts "unshift *: #{a.unshift(*b)}\n"
  puts details(a)
  a = ["1", "2"]
  puts "unshift: #{a.unshift(b)}\n"
  puts details(a)
  a = ["1", "2"]
  puts "<<: #{a << b}\n"
  puts details(a)
  a = ["1", "2"]
  puts "+: #{a + b}\n"
  puts details(a)
end


if __FILE__ == $0
  array_merge
end
