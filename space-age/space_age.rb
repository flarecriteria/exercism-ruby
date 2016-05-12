require 'bigdecimal'

##
# Calculates age on other planets
class SpaceAge
  SECONDS_IN_EARTH_YEAR = BigDecimal.new('31557600')

  ORBITAL_PERIODS = {
    mercury: BigDecimal.new('0.2408467'),
    venus: BigDecimal.new('0.61519726'),
    earth: BigDecimal.new('1'),
    mars: BigDecimal.new('1.8808158'),
    jupiter: BigDecimal.new('11.862615'),
    saturn: BigDecimal.new('29.447498'),
    uranus: BigDecimal.new('84.016846'),
    neptune: BigDecimal.new('164.79132')
  }.freeze

  def initialize(seconds)
    @earth_years = BigDecimal.new(seconds.to_s) / SECONDS_IN_EARTH_YEAR
  end

  def seconds
    (@earth_years * SECONDS_IN_EARTH_YEAR).to_f
  end

  ORBITAL_PERIODS.keys.each do |obj|
    define_method "on_#{obj}" do
      (@earth_years / ORBITAL_PERIODS[obj]).to_f
    end
  end
end
