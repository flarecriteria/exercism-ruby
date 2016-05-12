##
# Clock
class Clock
  # Problem Version
  VERSION = 1

  def self.at(hours, minutes)
    new(hours * 60 + minutes)
  end

  def initialize(minutes)
    @minutes = minutes % 1440
  end

  def to_s
    format('%02d:%02d', *@minutes.divmod(60))
  end

  def ==(other)
    to_s == other.to_s
  end

  def +(minutes) # rubocop:disable Style/OpMethod
    Clock.new(minutes + @minutes)
  end
end
