##
# This class calculates the hamming distance
class Hamming
  # Problem Version
  VERSION = 2

  # Compares two DNA strands of equal length and counts how many of the
  # nucleotides are different from their equivalent in the other strand.
  #
  # An UnequalLengthError is raised if the strands are not the same length.
  #
  # ==== Attributes
  #
  # * +strand1+ The first dna strand to be compared
  # * +strand2+ The second dna strand to be compared
  def self.compute(strand1, strand2)
    raise UnequalLengthError unless strand1.length.equal? strand2.length
    strand1.chars.zip(strand2.chars).count { |a, b| a != b }
  end
end

# Raised when strands provided are of unequal length
class UnequalLengthError < ArgumentError
  def message
    'Strand lengths are unequal. Strands are expected to have the same length.'
  end
end
