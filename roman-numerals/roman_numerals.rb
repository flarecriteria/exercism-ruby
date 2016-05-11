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

  def to_roman
    remaining = to_i
    raise ArgumentError unless remaining >= 1
    raise NotImplementedError unless remaining <= 3000
    roman_numeral = ''
    # Interestingly, even with these as strings, ruby requires me to use to_s,
    # or a type error is thrown. I'm not quite sure it's supposed to do that.
    # So I changed the hash back to symbols, I like the way that looks better
    # anyways.
    ROMAN_NUMERALS.each do |roman_glyph, value|
      (remaining / value).times.each { roman_numeral << roman_glyph.to_s }
      remaining = remaining % value
    end
    roman_numeral
  end
end

##
# Monkey Patch
class Fixnum
  # Just no, on a non-namespaced VERSION constant inside of Fixnum.
  # Even monkey patching a core class for a single use case makes me cringe.
  include RomanNumerals
end
