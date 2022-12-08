  def details(val, name="a")
    "#{name}: #{val} (length #{val.length})\n\n"
  end

def array_merge
  a = ["1", "2"]
  b = ["3", "4"]

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

def array_merge2
  a = [1, 2]
  b = [2, 3]
  puts "+=: #{a += b}\n"
  puts details(a)
  puts details(b, "b")
  b = []
  puts details(a)

  a = a.map {|e| e+3}
  puts details(a)
end

if __FILE__ == $0
  array_merge
end
