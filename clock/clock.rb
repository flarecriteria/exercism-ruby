##
# Clock
class Clock
  # Problem Version
  VERSION = 1
  MINUTES_IN_DAY = 1440
  MINUTES_IN_HOUR = 60

  def self.at(hours, minutes)
    new(hours * MINUTES_IN_HOUR + minutes)
  end

  def initialize(minutes)
    @minutes = minutes % MINUTES_IN_DAY
  end

  def to_s
    format('%02d:%02d', *@minutes.divmod(MINUTES_IN_HOUR))
  end

  def ==(other)
    to_s == other.to_s
  end

  def +(minutes) # rubocop:disable Style/OpMethod
    Clock.new(minutes + @minutes)
  end
end
