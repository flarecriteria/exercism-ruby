##
# Checks to see if a string is a pangram
module Pangram
  VERSION = 1

  def is_pangram?(str) # rubocop:disable Style/PredicateName
    required = ('A'..'Z').to_a
    (0..str.length - 1).each do |pos|
      break if required.empty?
      required.delete(s[pos].upcase)
    end
    required.empty?
  end
  module_function :is_pangram?
end
