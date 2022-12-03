require_relative 'modules'
include Data

if __FILE__ == $0
  data = get_data("02")
  sum = 0
  data.each do |rps|
    they, me = rps.split(" ")
    case me
    when "X"
      sum += 1
      case they
      when "A"
        sum += 3
      when "C"
        sum += 6
      end
    when "Y"
      sum += 2
      case they
      when "B"
        sum += 3
      when "A"
        sum += 6
      end
    when "Z"
      sum += 3
      case they
      when "C"
        sum += 3
      when "B"
        sum += 6
      end
    else
      puts rps
    end
  end
  puts sum
end
