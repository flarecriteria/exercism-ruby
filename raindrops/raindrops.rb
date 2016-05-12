##
# Converts integer to string
class Raindrops
  # Program Version
  VERSION = 1

  # Didn't know numeric keys get forced old style hash
  TR = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }.freeze

  # 82 :(
  def self.convert(i)
    TR.each_with_object('') { |(k, v), s| s << v if (i % k) == 0 }[/.+/] || i.to_s
  end
end
