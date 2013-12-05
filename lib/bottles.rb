class BottlesSong
  def sing
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map {|n| verse(n) + "\n"}.join
  end

  def verse(number)
    BeerVerse.new(number).to_s
  end
end

class BeerVerse
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def to_s
    "#{starting_count} #{starting_container} of beer on the wall, ".capitalize +
    "#{starting_count} #{starting_container} of beer.\n" +
    "#{action}, " +
    "#{ending_count} #{ending_container} of beer on the wall.\n"
  end

  private

  def starting_count
    case number
    when 0
      'no more'
    else
      number
    end
  end

  def starting_container
    case number
    when 1
      'bottle'
    else
      'bottles'
    end
  end

  def action
    case number
    when 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def pronoun
    case number
    when 1
      'it'
    else
      'one'
    end
  end

  def ending_count
    case number
    when 0
      99
    when 1
      'no more'
    else
      number - 1
    end
  end

  def ending_container
    case number
    when 2
      'bottle'
    else
      'bottles'
    end
  end
end
