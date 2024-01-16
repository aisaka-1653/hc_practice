# frozen_string_literal: true

require 'date'
require 'optparse'

current_year = Date.today.year
request_month = Date.today.month

opt = OptionParser.new
opt.on('-m [MONTH]') do |n|
  unless n.to_i.between?(1, 12)
    raise "#{n} is neither a month number (1..12) nor a name"
  end

  request_month = n.to_i unless n.to_i.zero?
rescue RuntimeError => e
  puts e.message
  exit
end.parse!

first_day_of_month = Date.new(current_year, request_month, 1)
last_day_of_month = Date.new(current_year, request_month, -1)
days = [*first_day_of_month..last_day_of_month]

formatted_days = days.map do |day|
  day.wday.zero? ? "#{day.strftime('%e')}\n" : "#{day.strftime('%e')}\s"
end.join

puts "#{request_month}月 #{current_year}".center(21)
puts '月 火 水 木 金 土 日'

# 1週目のみ右寄せ表示にする
formatted_days.each_line.with_index do |line, week|
  puts week.zero? ? line.rjust(21) : line
end
