##
# Clock
class Clock
  # Problem Version
  VERSION = 1

  def self.at(hours, minutes)
    Clock.new(hours, minutes)
  end

  def initialize(hours, minutes)
    @minutes = 0
    self + (hours * 60 + minutes)
  end

  def to_s
    format('%02d:%02d', *@minutes.divmod(60))
  end

  def ==(other)
    to_s == other.to_s
  end

  def +(other)
    @minutes = (other + @minutes) % 1440
    self
  end

  def -(other)
    self.+(other * -1)
  end
end
