##
# Checks to see if a string is a pangram
module Pangram
  # Problem Version
  VERSION = 1

  # Determine if a string uses every letter of the alphabet at least once.
  #
  # ==== Attributes
  #
  # * +str+ The string
  def is_pangram?(str) # rubocop:disable Style/PredicateName
    required = ('A'..'Z').to_a
    return false unless str.length >= required.length
    (0..str.length - 1).each do |pos|
      break if required.empty?
      required.delete(s[pos].upcase)
    end
    required.empty?
  end

  module_function :is_pangram?
end
