#!/usr/bin/env ruby

##
# Converts integer to string
class Raindrops
  # Program Version
  VERSION = 1

  def self.convert(int)
    str = ''
    str += int % 3 == 0 ? 'Pling' : ''
    str += int % 5 == 0 ? 'Plang' : ''
    str += int % 7 == 0 ? 'Plong' : ''
    str.empty? ? int.to_s : str
  end
end
