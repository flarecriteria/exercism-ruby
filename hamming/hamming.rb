# Calculates Hamming Distance
class Hamming
  VERSION = 2

  def self.compute(s1, s2)
    raise UnequalLengthError unless s1.length.equal? s2.length
    s1.chars.zip(s2.chars).count { |a, b| a != b }
  end
end

class UnequalLengthError < ArgumentError; end
