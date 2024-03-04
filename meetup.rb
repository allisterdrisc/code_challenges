require 'date'

class Meetup
  WEEKDAYS = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday',
              'friday', 'saturday']
  CATEGORIES = ['first', 'second', 'third', 'fourth', 'last', 'fifth', 'teenth']

  attr_reader :month, :year, :days_in_month, :all_days

  def initialize(year, month)
    @month = month
    @year = year
    @days_in_month = Date.civil(@year, @month, -1).day
    @all_days = (1..days_in_month).to_a
  end

  def day(weekday, schedule)
    weekday = WEEKDAYS.index(weekday.downcase)
    schedule_arr = create_schedule_arr(schedule.downcase)

    correct_date = schedule_arr.select do |number_day|
      if Date.valid_civil?(year, month, number_day)
        Date.civil(year, month, number_day).wday == weekday
      end
    end

    return nil if correct_date.empty?
    Date.civil(year, month, correct_date.first)
  end

  private

  def create_schedule_arr(schedule)
    schedule_subarrs = create_schedule_subarrs
    schedule_index = CATEGORIES.index(schedule)
    schedule_subarrs[schedule_index]
  end

  def create_schedule_subarrs
    schedule_subarrs = []
    0.upto(all_days.size - 7) do |start_idx|
      if start_idx == 0 || start_idx % 7 == 0
        schedule_subarrs << all_days[start_idx, 7]
      end
    end
    schedule_subarrs << all_days.reverse[0, 7]
    schedule_subarrs << fifth_subarr
    schedule_subarrs << (13..19).to_a
  end

  def fifth_subarr
    if days_in_month >= 29
      (29..days_in_month).to_a
    else
      [nil]
    end
  end
end
