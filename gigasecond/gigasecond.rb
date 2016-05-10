##
# Write a program that will calculate the date that someone turned
# or will celebrate their 1 Gs anniversary.
module Gigasecond
  VERSION = 1

  def from(time)
    time + 10**9
  end

  module_function :from
end
