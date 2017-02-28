class TimeLapse
  def initialize(options={})
    @start_time = options[:start_time]
    @end_time = options[:end_time]
  end

  attr_accessor :start_time, :end_time

  def find_lapse
    sec = (@end_time - @start_time).abs
    days = sec / 60 / 60 / 24
    days_number = days * 24 * 60 * 60
    hours = (sec - days_number) / 60 / 60
    hours_number = hours * 60 * 60
    min = (sec - days_number - hours_number) / 60
    min_number = min * 60
    seconds = sec - days_number - hours_number - min_number
    puts compose_string(days, hours, min, seconds)
  end

  def compose_string(var1, var2, var3, var4)
    str = ""
    if var1 == 1
      str = var1.to_s + " day "
    else
      str = var1.to_s + " days "
    end
    if var2 == 1
      str = str + var2.to_s + " hour "
    else
      str = str + var2.to_s + " hours "
    end
    if var4 > 0
      str = str + var3.to_s + " min and "
      if var4 == 1
        str = str + var4.to_s + " second"
      else
        str = str + var4.to_s + " seconds"
      end
    else
      str = str + var3.to_s + " min"
    end
    return str
  end
end

is_exit = "exit"
loop do
  print "Input start-time: "
  start = gets.chomp
  break if start == is_exit
  print "Input end-time: "
  finish = gets.chomp
  break if finish == is_exit
  time_lapse = TimeLapse.new({start_time: start.to_i, end_time: finish.to_i})
  time_lapse.find_lapse
  puts
end
exit



