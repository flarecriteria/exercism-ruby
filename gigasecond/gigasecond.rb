# Write a program that will calculate the date that someone turned
# or will celebrate their 1 Gs anniversary.
class Gigasecond
  VERSION = 1

  def self.from(time)
    time + 10**9
  end
end
