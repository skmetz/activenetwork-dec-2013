require_relative 'miracle'

class BottlesSong
  def sing
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map {|n| verse(n) + "\n"}.join
  end

  def verse(number)
    bottle_number = number.to_container_number
    "#{bottle_number} of beer #{location}, ".capitalize +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{bottle_number.pred} of beer #{location}.\n"
  end

  def location
    'on the wall'
  end

end

