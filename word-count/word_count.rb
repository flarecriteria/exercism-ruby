##
# Word Count Problem
class Phrase
  VERSION = 1
  attr_reader :word_count
  def initialize(str)
    word_array = str.downcase.scan(/(\w+(?:'\w+)?)/).flatten
    @word_count = word_array.each_with_object(Hash.new(0)) { |w, h| h[w] += 1 }
  end
end
