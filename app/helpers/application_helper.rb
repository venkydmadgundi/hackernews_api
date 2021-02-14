module ApplicationHelper
  require 'date'
  def time_ago(unix_date)
    intervals = [["hour", 24], ["minute", 60], ["second", 60]]
    elapsed = DateTime.now - DateTime.strptime(unix_date.to_s,'%s')
    interval = 1.0
    parts = intervals.collect do |name, new_interval|
      interval /= new_interval
      number, elapsed = elapsed.abs.divmod(interval)
      return "#{number.to_i} #{name}#{"s" unless number == 1}" if number > 0
    end
    "#{parts} ago."
  end
end
