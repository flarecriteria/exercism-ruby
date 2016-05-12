##
# Grains Practice Problem
module Grains
  def self.square(int)
    2**(int - 1)
  end

  def self.total
    # Calculated with
    # (1..64).reduce { |m, o| m += square(o)}
    # I'm sure there's formula for this, but for now a const.
    18_446_744_073_709_551_615
  end
end
