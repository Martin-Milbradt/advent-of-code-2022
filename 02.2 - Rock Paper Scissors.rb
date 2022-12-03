require_relative 'modules'
include Data

if __FILE__ == $0
  data = get_data("02")
  sum = 0
  data.each do |rps|
    they, me = rps.split(" ")
    case me
    when "X"
      case they
      when "A"
        sum += 3
      when "B"
        sum += 1
      when "C"
        sum += 2
      end
    when "Y"
      sum += 3
      case they
      when "A"
        sum += 1
      when "B"
        sum += 2
      when "C"
        sum += 3
      end
    when "Z"
      sum += 6
      case they
      when "A"
        sum += 2
      when "B"
        sum += 3
      when "C"
        sum += 1
      end
    else
      puts rps
    end
  end
  puts sum
end
