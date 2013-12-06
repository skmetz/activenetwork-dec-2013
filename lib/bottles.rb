require 'forwardable'

class BottlesSong
  attr_reader :verse_class, :fragments_class
  def initialize(verse_class=BeerVerse, fragments_class=BeerVerseFragments)
    @verse_class = verse_class
    @fragments_class = fragments_class
  end

  def sing
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map {|n| verse(n) + "\n"}.join
  end

  def verse(number)
    verse_class.new(fragments_class.for(number)).to_s
  end
end

class BeerVerse
  extend Forwardable
  def_delegators :fragments,
                     :starting_count, :starting_container,
                     :action,
                     :ending_count, :ending_container

  attr_reader :fragments

  def initialize(fragments)
    @fragments = fragments
  end

  def to_s
    "#{starting_count} #{starting_container} of beer on the wall, ".capitalize +
    "#{starting_count} #{starting_container} of beer.\n" +
    "#{action}, " +
    "#{ending_count} #{ending_container} of beer on the wall.\n"
  end

end

class BeerVerseFragments

  def self.for(number)
    begin
      Object.const_get("BeerVerseFragments#{number}").new(number)
    rescue
      BeerVerseFragments.new(number)
    end
  end

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def starting_count
    number
  end

  def starting_container
    'bottles'
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def ending_count
    number - 1
  end

  def ending_container
    'bottles'
  end

  private

  def pronoun
    'one'
  end
end

class BeerVerseFragments0 < BeerVerseFragments

  def starting_count
    'no more'
  end

  def action
    "Go to the store and buy some more"
  end

  def ending_count
    99
  end

end

class BeerVerseFragments1 < BeerVerseFragments

  def starting_container
    'bottle'
  end

  def ending_count
    'no more'
  end

  private

  def pronoun
    'it'
  end

end

class BeerVerseFragments2 < BeerVerseFragments

  def ending_container
    'bottle'
  end

end
