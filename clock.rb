class Clock
  HOURS = (0..23).to_a

  attr_reader :hr, :min

  def initialize(hr, min)
    @hr = HOURS[hr]
    @min = min
  end

  def single_digit?(num)
    num.digits.size == 1
  end

  def self.at(hr, min = 0)
    Clock.new(hr, min)
  end

  def +(mins)
    add_hr, add_min = min_to_hr_and_min(mins)
    new_hr = add_hr
    new_min = min + add_min
    if new_min > 59
      new_hr += 1
      new_min = 60 - new_min
    end
    Clock.at(HOURS.rotate(hr)[new_hr], new_min)
  end

  def -(mins)
    minus_hr, minus_min = min_to_hr_and_min(mins)
    new_hr = minus_hr
    new_min = min - minus_min
    if new_min < 0
      new_hr += 1
      new_min = 60 + new_min
    end
    Clock.at(HOURS.rotate(hr)[-new_hr], new_min)
  end

  def to_s
    hour = single_digit?(hr) ? ("0#{hr}") : (hr.to_s)
    minute = single_digit?(min) ? ("0#{min}") : (min.to_s)
    "#{hour}:#{minute}"
  end

  def ==(other_clock)
    to_s == other_clock.to_s
  end

  def min_to_hr_and_min(mins)
    if mins < 60
      [0, mins]
    else
      mins = account_for_over_a_day(mins)
      mins.divmod(60)
    end
  end

  def account_for_over_a_day(mins)
    until mins < 1440
      mins -= 1440
    end
    mins
  end
end
