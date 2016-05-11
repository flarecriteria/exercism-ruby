##
# Coverts to_i to roman numerals
module RomanNumerals
  ROMAN_NUMERALS = {
    M: 1000,
    CM: 900,
    D: 500,
    CD: 400,
    C: 100,
    XC: 90,
    L: 50,
    XL: 40,
    X: 10,
    IX: 9,
    V: 5,
    IV: 4,
    I: 1
  }.freeze

  ##
  # Instance methods live here.
  # Keep namespaces clean and constants constant
  module InstanceMethods
    def to_roman
      remaining = to_i
      raise ArgumentError unless remaining >= 1
      raise NotImplementedError unless remaining < 4000
      # Interestingly, even with string keys, ruby 2.3.0 requires me to use to_s
      # or a type error is thrown. I'm not quite sure it's supposed to do that.
      # So I changed the hash back to symbols, I like the way that looks better
      # anyways.
      #
      # Did not realize each_with_object or divmod existed till I saw
      # @DebbieGillespie's answer. Much better
      ROMAN_NUMERALS.each_with_object('') do |(roman_glyph, value), out|
        next unless remaining >= value
        (quotient, remaining) = remaining.divmod(value)
        out << roman_glyph.to_s * quotient
      end
    end
  end
end

# Still not adding VERSION to fixed num
# Happier with this
Fixnum.include(RomanNumerals::InstanceMethods)
