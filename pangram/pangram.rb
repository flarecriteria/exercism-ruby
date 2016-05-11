##
# Adds pangram test to any class with to_s
module PangramTestable
  # Tests to see if self.to_s returns a pangram.
  # A pangram contains all of the characters in an alphabet at least once.
  #
  # ==== Attributes
  #
  # * +alphabet+ An array containing the characters of the alphabet used by
  #   the pangram. Defaults to Latin (A-Z).
  def pangram?(alphabet = [*'A'..'Z'])
    str = to_s
    required = Array.new(alphabet)
    return false unless str.length > required.length
    (0..str.length - 1).each do |pos|
      break if required.empty?
      required.delete(str[pos].upcase)
    end
    required.empty?
  end
end

##
# Wraps PangramTestable
module Pangram
  VERSION = 1

  def is_pangram?(str) # rubocop:disable Style/PredicateName
    str.extend(PangramTestable)
    str.pangram?
  end
  module_function :is_pangram?
end
