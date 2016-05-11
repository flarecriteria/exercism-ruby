##
# Implementation of the Sieve of Eratosthenes
#
# Why would you make this an instancialized class?
class Sieve
  def initialize(up_to_num)
    @up_to_num = up_to_num
  end

  # Everytime I go to optimize this it's no longer the sieve
  #
  private def _sieve
    arr = Array.new(@up_to_num + 1)
    arr[2] = true unless @up_to_num < 2
    (3..@up_to_num).step(2) do |num|
      next unless arr[num].nil?
      arr[num] = true
      (num**2..@up_to_num).step(num) { |i| arr[i] = false }
    end
    arr.each_index.select { |i| arr[i] }
  end

  def primes
    @primes ||= _sieve
  end
end
