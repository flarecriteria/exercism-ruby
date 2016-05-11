require 'securerandom'

##
# Only class in file, yet the name differs.
class Robot
  VERSION = 1

  attr_reader :name

  def initialize
    reset
  end

  def reset
    # Names are short enough that a collision is likely, only 676,000 possible.
    # should really be something like
    # @name = SecureRandom.uuid
    pool = SecureRandom.base64(64)
    chars = pool.scan(/[[:alpha:]]/).slice(0, 2).join.upcase
    num = pool.scan(/[[:digit:]]/).slice(0, 3).join
    @name = chars + num
  end
end
