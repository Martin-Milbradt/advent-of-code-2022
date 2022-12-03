require_relative 'modules'
include Data

if __FILE__ == $0
  data = get_data_int("01")
  sums = [0]
  data.each do |cal|
    if cal == 0
      sums.append(0)
    else
      sums[-1] += cal
    end
  end
  sums = sums.sort
  
  puts sums[-1]
  puts sums[-3..-1].sum
end
